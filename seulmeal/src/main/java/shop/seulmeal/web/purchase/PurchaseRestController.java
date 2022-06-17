package shop.seulmeal.web.purchase;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonInclude;

import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.purchase.PurchaseService;
import shop.seulmeal.service.user.UserService;

@RestController
@RequestMapping("/purchase/api/*")
public class PurchaseRestController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("${pageUnit}")
	int pageUnit;
	
	@Value("${pageSize}")
	int pageSize;
	
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}

	//장바구니에서 수량변경
	@GetMapping("updateCustomProduct/{customProductNo}/{count}")
	public CustomProduct updateCusotmProduct(@PathVariable int customProductNo, @PathVariable int count, CustomProduct customProduct) throws Exception {
	
		System.out.println("/purchase/api/updateCusotmProduct : "+customProductNo+count);
		
		customProduct=purchaseService.getCustomProduct(customProductNo);
		customProduct.setCount(count);
		
		int result = purchaseService.updateCustomProductCount(customProduct);
		System.out.println("update: "+result);

		return customProduct;	
		
	}	
	
	@PostMapping("insertPurchase")
	public Purchase insertPurchase(@RequestBody Purchase purchase, @AuthenticationPrincipal User user) throws Exception {
	
		System.out.println("/purchase/api/insertPurchase : "+purchase);
		

		purchase.setUser(user);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! "+user);

	      
		int result=purchaseService.insertPurchase(purchase);
		System.out.println("/purchase/api/insertPurchase insert : "+result);
		
		purchase=purchaseService.getPurchase(purchase.getPurchaseNo());
		System.out.println("/purchase/api/insertPurchase get : "+purchase);
		purchase.setUser(user);
		System.out.println("1111111111111111+++++++++++++++++++++++"+purchase);

		return purchase;	
		
	}	
	
	@PostMapping("updatePurchaseCode")
	public Purchase updatePurchaseCode(@RequestBody Purchase purchase) throws Exception {

	      System.out.println("/purchase/api/updatePurchase : POST");
	      
	      purchaseService.updatePurchaseCode(purchase);
	      purchase=purchaseService.getPurchase(purchase.getPurchaseNo());
	      
	      return purchase;
	   }   
	
	@PostMapping("verifyIamport")
	public JSONObject verifyIamport(@RequestBody Purchase purchase) {
		
		System.out.println("/purchase/api/verifyIamport : "+purchase);
		
		int success=purchaseService.updatePurchase(purchase);
		System.out.println("/purchase/api/verifyIamport update : "+success);
		
		purchase=purchaseService.getPurchase(purchase.getPurchaseNo());
		System.out.println("/purchase/api/verifyIamport purchaseNo : "+ purchase.getPurchaseNo());
		
		String token=purchaseService.getImportToken();
		System.out.println("/purchase/api/verifyIamport token : "+ token);
		
		JSONObject json=new JSONObject();
		if(success ==1) {
			String portAmount=purchaseService.getAmount(token, Integer.toString(purchase.getPurchaseNo()));
			
			if(purchase.getPrice() == Integer.parseInt(portAmount)) {
				json.put("purchase", purchase);
				json.put("sucess", "true");
				json.put("message", "성공!!!!!!");
			}else {
				json.put("success", "false");
				int cancel=purchaseService.cancelPayment(token, Integer.toString(purchase.getPurchaseNo()));
				if(cancel==1) {
					json.put("message", "성공!!!!!");
				}else {
					json.put("message", "실패");
				}
			}
		}else {
			purchaseService.cancelPayment(token, Integer.toString(purchase.getPurchaseNo()));
			json.put("message", "결제실패ㅠㅠ");
		}
		return json;
	}

}

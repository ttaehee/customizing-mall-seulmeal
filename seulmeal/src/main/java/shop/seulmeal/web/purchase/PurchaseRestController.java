package shop.seulmeal.web.purchase;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	int pageUnit;
	int pageSize;
	
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	@PostMapping("insertPurchase")
	public Purchase insertPurchase(@RequestBody Purchase purchase, String userId) throws Exception {
	
		System.out.println("/purchase/api/insertPurchase : "+purchase);
		
		User user=userService.getUser(userId);	
	     purchase.setUser(user);
	      

		int result=purchaseService.insertPurchase(purchase);
		System.out.println("/purchase/api/insertPurchase insert : "+result);
		
		purchase=purchaseService.getPurchase(purchase.getPurchaseNo());
		System.out.println("/purchase/api/insertPurchase get : "+purchase);

		return purchase;	
		
	}	
	
	@PostMapping("updatePurchaseCode")
	public Purchase updatePurchaseCode( @RequestBody Purchase purchase) throws Exception {

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

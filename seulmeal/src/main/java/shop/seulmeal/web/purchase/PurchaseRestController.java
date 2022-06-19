package shop.seulmeal.web.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.service.domain.CustomProduct;
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
	
	@PostMapping("autocomplete")
	public @ResponseBody Map<String, Object> autocomplete(@RequestParam Map<String, Object> paramMap) throws Exception{
		
		List<Map> resultList = purchaseService.autocomplete(paramMap);
		paramMap.put("resultList", resultList);

		return paramMap;
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
	
	@PostMapping("confirmPassword")
	public JSONObject confirmPassword(@RequestBody Map temp, HttpSession session) throws Exception {
	
		System.out.println("/purchase/api/confirmPassword : "+temp);
		
		String password=(String)temp.get("password");
		int usePoint=(int)temp.get("usePoint");
		
		User user=(User)session.getAttribute("user");
		String realPw=user.getPassword();
		int realPt=user.getTotalPoint();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		JSONObject json=new JSONObject();
		if(encoder.matches(password, realPw) && usePoint<=realPt) {
			json.put("success", "true");
		}else if(usePoint > realPt) {
			json.put("success","pt");
		}else {
			json.put("success","pw");
		}
		return json;	
	}	
	
	
	@PostMapping("insertPurchase")
	public Purchase insertPurchase(@RequestBody Map<String, Object> map, Purchase purchase, HttpSession session) throws Exception {
		
		System.out.println("________:"+map);
		
		System.out.println("aaaaaaa:"+map.get("customProductNo"));
		
		User user=(User)(session.getAttribute("user"));
		
		purchase.setUser(user);
		purchase.setName((String)map.get("name"));
		purchase.setAddress((String)map.get("address"));
		purchase.setPhone((String)map.get("phone"));
		purchase.setEmail((String)map.get("email"));
		purchase.setMessage((String)map.get("message"));
		purchase.setPrice(Integer.parseInt((String)map.get("price")));
		purchase.setPaymentCondition(String.valueOf(map.get("paymentCondition")));
		
		purchaseService.insertPurchase(purchase);
		
		int usePoint=(Integer.parseInt((String)map.get("usePoint")));
		
		ArrayList customProductNo=(ArrayList) map.get("customProductNo");
		System.out.println("oobobbbbj:"+customProductNo);
		
		List<CustomProduct> cpList=new ArrayList<CustomProduct>();
		for(int i=0; i<customProductNo.size(); i++) {
			CustomProduct cp=new CustomProduct();
			cp=purchaseService.getCustomProduct(Integer.parseInt((String)customProductNo.get(i)));
			cp.setPurchaseNo(purchase.getPurchaseNo());
			System.out.println("ccccccccc:"+cp);
			purchaseService.updateCustomProductPurchaseNo(cp);
			cpList.add(cp);
		}
		
		purchase=purchaseService.getPurchase(purchase.getPurchaseNo());
		purchase.setUser(user);
		System.out.println("ppppppp:"+purchase);

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
	public JSONObject verifyIamport(@RequestBody Purchase purchase, HttpSession session) {
		
		System.out.println("/purchase/api/verifyIamport : "+purchase);
		
		//결제완료 시 구매상태 상품준비중으로 변경
		int success=purchaseService.updatePurchase(purchase);
		System.out.println("/purchase/api/verifyIamport update : "+success);
			
		purchase=purchaseService.getPurchase(purchase.getPurchaseNo());
		System.out.println("/purchase/api/verifyIamport purchaseNo : "+ purchase.getPurchaseNo());
		User user=(User)(session.getAttribute("user"));
		purchase.setUser(user);		
		
		//커스터마이징상품은 장바구니리스트에서 삭제 
		List<CustomProduct> cpList=purchase.getCustomProduct();
		for(CustomProduct cp : cpList) {
			purchaseService.updateCustomProductStatus(cp);
		}
		
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

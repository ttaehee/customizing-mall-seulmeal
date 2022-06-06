package shop.seulmeal.web.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.ProductParts;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.purchase.PurchaseService;
import shop.seulmeal.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private ProductService productService;
	
	//@Autowired
	//private UserService userService;
	
	//@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	//@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public PurchaseController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	//커스터마이징 옵션선택 화면출력 
	@GetMapping("insertCustomProduct/{productNo}")
	public String insertCustomProduct(@PathVariable int productNo, Model model) throws Exception {
		
		System.out.println("/insertCustomProduct productNo : "+ productNo);
		
		Product product=productService.getProduct(productNo);
		List<Parts> partsList=productService.getProductParts(productNo);
		
		model.addAttribute("product",product);
		model.addAttribute("partsList",partsList);
		
		return "purchase/insertPurchaseCustomProduct";
		
	}
	
	//커스터마이징 상품 인서트 
	@PostMapping("insertCustomProduct")
	@Transactional(rollbackFor= {Exception.class})
	public String insertCustomProduct(List<CustomParts> minus, List<CustomParts> plus, CustomProduct customProduct, Product product, String userId, String cartStatus, Model model) {
		
		System.out.println("/insertPurchase :Post");
		
		User user=new User();
		user.setUserId(userId);
		
		customProduct.setUser(user);
		customProduct.setProduct(product);
		customProduct.setMinusParts(minus);
		customProduct.setPlusParts(plus);
		
		purchaseService.insertCustomProduct(customProduct);
		
		Map<String, Object> map=new HashMap<>();
		map.put("customProductNo",customProduct.getCustomProductNo());
		map.put("minusParts",minus);
		map.put("plusParts",plus);
			
		purchaseService.insertMinusParts(map);
		purchaseService.insertPlusParts(map);
		
		model.addAttribute("customProduct",customProduct);
		
		if(cartStatus.equals("0")) {
			return "purchase/getListCustomProduct/"+userId;
		}else {
			return "purchase/insertPurchase/"+customProduct.getCustomProductNo();
		}
		
	}
	
	//장바구니 리스트 
	@GetMapping("getListCustomProduct/{userId}")
	public String getListCustomProduct(@PathVariable String userId, Model model) {
		System.out.println("/getListCustomProduct : "+ userId);
		
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//커스터마이징상품 리스
		Map<String, Object> map =  purchaseService.getListCustomProduct(search, userId);

		Page resultPage 
			= new Page(search.getCurrentPage(), 
					((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		model.addAttribute("customProductList", map.get("cproductList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "purchase/listPurchaseCart";
		
	}	
	
	//커스터마이징 상품 현재옵션정보 + 옵션수정 화면출력 
	@GetMapping("updateCustomProduct/{customProductNo}")
	@Transactional(rollbackFor= {Exception.class})
	public String updateCustomProduct(@PathVariable int customProductNo, CustomProduct customProduct, Model model) {
		
		System.out.println("/deletePurchase :Post");
		
		customProduct=purchaseService.getCustomProduct(customProductNo);
		
		model.addAttribute("customProduct", customProduct);
		
		return "purchase/getPurchaseCustomProduct";
	}	
	
	//커스터마이징 상품 옵션수정(커스터마이징재료 삭제 후 추가)
	@PostMapping("updateCustomProduct")
	@Transactional(rollbackFor= {Exception.class})
	public String updateCustomProduct(int customProductNo, String userId, List<CustomParts> minus, List<CustomParts> plus, Model model) {
		
		System.out.println("/deletePurchase :Post");
		
		purchaseService.deleteCustomParts(customProductNo);
		
        List<CustomParts> list=new ArrayList<CustomParts>();
		
        Map<String, Object> map=new HashMap<>();
		map.put("customProductNo",customProductNo);
		map.put("minusParts",minus);
		map.put("plusParts",plus);
			
		purchaseService.insertMinusParts(map);
		purchaseService.insertPlusParts(map);
		
		return "purchase/getListCustomProduct/"+userId;
	}		
		
	//커스터마이징 상품 장바구니에서 삭제 
	@PostMapping("deleteCustomProduct")
	@Transactional(rollbackFor= {Exception.class})
	public String deleteCustomProduct(int customProductNo, String userId, Model model) {
		
		System.out.println("/deletePurchase :Post");
		
		purchaseService.deleteCustomProduct(customProductNo);
		
		return "purchase/getListCustomProduct/"+userId;
	}	
	
	
	//구매정보입력 화면 출력 
	@GetMapping("insertPurchase/{customProductNo}")
	public String insertPurchase(@PathVariable int customProudctNo, Model model) {
		
		System.out.println("/insertPurchase customProductNo : "+ customProudctNo);
		
		CustomProduct customProduct=purchaseService.getCustomProduct(customProudctNo);
		model.addAttribute(customProduct);
		
		return "purchase/insertPurchase";
		
	}
	
	//구매 인서트 
	@PostMapping("insertPurchase")
	@Transactional(rollbackFor= {Exception.class})
	public String insertPurchase(int customProductNo, Purchase purchase, String userId, Model model) {
		
		System.out.println("/insertPurchase :Post");
		
		User user=new User();
		user.setUserId(userId);
		
		purchase.setUser(user);
		purchaseService.insertPurchase(purchase);
		
		//커스터마이징 상품 구매번호 업데이트해야
		
		model.addAttribute("purchase",purchase);
		
		return "redirect:getPurchase/"+purchase.getPurchaseNo();	
		
	}
	
	@GetMapping("getPurchase/{purchaseNo}")
	public String getPurchase(@PathVariable int purchaseNo, Purchase purchase, Model model) {
		
		System.out.println("/getListCustomProduct : "+ purchaseNo);
		
		purchase=purchaseService.getPurchase(purchaseNo);
		
		model.addAttribute(purchase);
		
		return "purchas/getPurchase";
		
	}	
	
	@GetMapping("getListPurchase/{userId}")
	public String getListPurchase(String userId, Search search, Purchase purchase, Model model, HttpSession session)
			throws Exception {

		System.out.println("/getListPurchase");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getListPurchase(search, userId);

		Page resultPage 
			= new Page(search.getCurrentPage(), 
					((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		model.addAttribute("purchaseList", map.get("purchaseList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "purchase/listPurchase";
	}
	
	//구매내역 삭제 
	@PostMapping("deletePurchase")
	@Transactional(rollbackFor= {Exception.class})
	public String deletePurchase(int purchaseNo, String userId) {
		
		System.out.println("/deletePurchase :Post");
		
		purchaseService.deleteCustomProduct(purchaseNo);
		
		return "purchase/getListCustomProduct/"+userId;
	}		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
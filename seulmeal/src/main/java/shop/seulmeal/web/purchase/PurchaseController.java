package shop.seulmeal.web.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("${pageUnit}")
	int pageUnit;
	
	@Value("${pageSize}")
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
	public String insertCustomProduct(@RequestParam(value="productNo") int productNo, 
			CustomProduct customProduct, Model model, HttpSession session,
			// 제외 상품
			String minusNoA, String minusNameA,
			// 추가 상품
			String plusPartsNo, String plusPrice, String plusGram) throws Exception {
		
		System.out.println("insertCustomProduct POST : "+customProduct);

		System.out.println("========== minusNo : "+minusNoA);
		System.out.println("========== minusName : "+minusNameA);

		System.out.println("========== plusPartsNo : "+plusPartsNo);
		System.out.println("========== plusPrice : "+plusPrice);
		System.out.println("========== plusGram : "+plusGram);
		
		// setProduct
		Product product = productService.getProduct(productNo);
		customProduct.setProduct(product);
		
		// 구매자 아이디 세팅
		User user= (User)session.getAttribute("user");
		customProduct.setUser(user);
		
		Map<String, Object> map=new HashMap<>();
		
		int result=purchaseService.insertCustomProduct(customProduct);
		System.out.println("reusult : "+result);
		
		// minus parts
		List<CustomParts> minusParts = new ArrayList();
		if(minusNoA.trim().length() > 0) {
			String[] minusNoAA = minusNoA.split(",");
			String[] minusNameAA = minusNameA.split(",");

			for(int i=0; i<minusNoAA.length; i++) {
				CustomParts minus = new CustomParts();
				minus.setMinusNo(Integer.parseInt(minusNoAA[i]));
				minus.setMinusName(minusNameAA[i]);
				minus.setCustomProductNo(customProduct.getCustomProductNo());
				minusParts.add(minus);
			}
			customProduct.setMinusParts(minusParts);
			map.put("minusParts",minusParts);
			int re=purchaseService.insertMinusParts(map);
			System.out.println("minus result:"+re);
		}
		
		// plus parts
		List<CustomParts> plusParts = new ArrayList();
		
		if(plusPartsNo !=null) {
			String[] plusPartsNoA = plusPartsNo.split(",");
			String[] plusPriceA = plusPrice.split(",");
			String[] plusGramA = plusGram.split(",");

			for(int i=0; i<plusPartsNoA.length; i++) {		
				CustomParts plus = new CustomParts();
				Parts p = new Parts();
				System.out.println(Integer.parseInt(plusPartsNoA[i]));
				p.setPartsNo(Integer.parseInt(plusPartsNoA[i]));
				p.setPrice(Integer.parseInt(plusPriceA[i]));
				
				plus.setParts(p);
				plus.setGram(Integer.parseInt(plusGramA[i]));
				plus.setCustomProductNo(customProduct.getCustomProductNo());
				plusParts.add(plus);
			}
			customProduct.setPlusParts(plusParts);
			map.put("plusParts",plusParts);
			int sul=purchaseService.insertPlusParts(map);
			System.out.println("plus result:"+sul);
		}

		map.put("customProductNo",customProduct.getCustomProductNo());

		model.addAttribute("customProduct",customProduct);
		
		System.out.println("ccccc:"+customProduct.getCartStatus());
		if(customProduct.getCartStatus().equals("1")) {
			return "redirect:/purchase/getListCustomProduct";
		}else {
			return "redirect:/purchase/insertPurchaseDirect";
		}
		
	}
	
	//장바구니 리스트 
	@GetMapping("getListCustomProduct")
	public String getListCustomProduct(Model model, HttpSession session) {
		System.out.println("/getListCustomProduct");
		
		User user=(User)session.getAttribute("user");
		String userId=user.getUserId();
		
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//커스터마이징상품 리스트
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
	public String updateCustomProduct(@PathVariable int customProductNo, CustomProduct customProduct, Model model) throws Exception {
		
		System.out.println("/deletePurchase :Post");
		
		customProduct=purchaseService.getCustomProduct(customProductNo);
		
		List<Parts> partsList=productService.getProductParts(customProduct.getProduct().getProductNo());
				
		model.addAttribute("customProduct", customProduct);
		model.addAttribute("partsList",partsList);
		
		return "purchase/updatePurchaseCustomProduct";
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
		
		return "redirect:/purchase/getListCustomProduct";
	}	
		
	//커스터마이징 상품 장바구니에서 삭제 
	@GetMapping("deleteCustomProduct/{customProductNo}")
	@Transactional(rollbackFor= {Exception.class})
	public String deleteCustomProduct(@PathVariable int customProductNo) {
		
		System.out.println("/deletePurchase");

		int result = purchaseService.deleteCustomProduct(customProductNo);
		System.out.println("delete : "+result);
		
		return "redirect:/purchase/getListCustomProduct";
	}	
	
	
	//바로구매하기 구매정보입력창
	@GetMapping("insertPurchaseDirect/{customProductNo}")
	public String insertPurchaseDirect(int customProductNo, CustomProduct customProduct, Model model) {
		
		System.out.println("/insertPurchase : GET");
		
		customProduct=purchaseService.getCustomProduct(customProductNo);
		
		model.addAttribute("customProduct", customProduct);
		model.addAttribute("cartStatus", "0");
		
		return "purchase/insertPurchase";
		
	}
	
	//장바구니 거쳐서 구매정보입력창
	@GetMapping("insertPurchase")
	public String insertPurchase(Model model, HttpSession session) {
		
		System.out.println("/insertPurchase : GET");
		
		User user=(User)session.getAttribute("user");
		String userId=user.getUserId();
		
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
	
		Map<String, Object> map=purchaseService.getListCustomProduct(search, userId);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!! : "+map.get("cproductList"));
		Page resultPage 
		= new Page(search.getCurrentPage(), 
				((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("customProductList", map.get("cproductList"));
		model.addAttribute("cartStatus", "1");
		
		return "purchase/insertPurchase";
		
	}
	
	@GetMapping("getPurchase/{purchaseNo}")
	public String getPurchase(@PathVariable int purchaseNo, Purchase purchase, Model model) {
		
		System.out.println("/getListCustomProduct : "+ purchaseNo);
		
		purchase=purchaseService.getPurchase(purchaseNo);
		
		model.addAttribute(purchase);
		
		return "purchase/getPurchase";
		
	}	
	
	@RequestMapping(value="getListPurchase")
	public String getListPurchase(Search search, String purchaseStatus, Model model, HttpSession session)
			throws Exception {
		
		User user=(User)session.getAttribute("user");
		String userId=user.getUserId();
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getListPurchase(search, userId, purchaseStatus);

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
	@PostMapping("/deletePurchase")
	@Transactional(rollbackFor= {Exception.class})
	public String deletePurchase(int purchaseNo, String userId) {
		
		System.out.println("/deletePurchase :Post");
		
		purchaseService.deletePurchase(purchaseNo);
		
		return "redirect:getListPurchase/"+userId;
	}			
	
}
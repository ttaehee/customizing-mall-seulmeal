package shop.seulmeal.web.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Product;
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
	
	//@Autowired
	//private ProductService productService;
	
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
	
	@GetMapping("insertCustomProduct/{productNo}")
	public String insertPurchase(@PathVariable int proudctNo, Model model) {
		
		System.out.println("/insertPurchase productNo : "+ proudctNo);
		
		CustomProduct customProduct=purchaseService.getCustomProduct(proudctNo);
		model.addAttribute(customProduct);
		
		return "purchase/insertPurchase";
		
	}
	
	@PostMapping("insertCustomProduct")
	@Transactional(rollbackFor= {Exception.class})
	public String insertCustomProduct(CustomProduct customProduct, Product product, String userId, String cartStatus, Model model) {
		
		System.out.println("/insertPurchase :Post");
		
		User user=new User();
		user.setUserId(userId);
		
		customProduct.setUser(user);
		customProduct.setProduct(product);
		
		purchaseService.insertCustomProduct(customProduct);
		
		model.addAttribute("customProduct",customProduct);
		
		if(cartStatus.equals("0")) {
			return "purchase/getListCustomProduct";
		}else {
			return "purchase/insertPurchase/"+customProduct.getCustomProductNo();
		}
		
	}
	
	/*
	@GetMapping("insertPurchase/{customProductNo}")
	public String insertPurchase(@PathVariable int customProudctNo, Model model) {
		
		System.out.println("/insertPurchase customProductNo : "+ customProudctNo);
		
		CustomProduct customProduct=purchaseService.getCustomProduct(customProudctNo);
		model.addAttribute(customProduct);
		
		return "purchase/insertPurchase";
		
	}
	
	@PostMapping("insertPurchase")
	@Transactional(rollbackFor= {Exception.class})
	public String insertPurchase(Purchase purchase, String userId, Model model) {
		
		System.out.println("/insertPurchase :Post");
		
		User user=new User();
		user.setUserId(userId);
		
		purchase.setUser(user);
		purchaseService.insertPurchase(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "redirect:getPurchase/"+purchase.getPurchaseNo();	
		
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

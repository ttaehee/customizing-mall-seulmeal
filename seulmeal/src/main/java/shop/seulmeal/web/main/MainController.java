package shop.seulmeal.web.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.seulmeal.service.product.ProductService;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@GetMapping("/")
	public String main(HttpSession session) throws Exception {
		session.setAttribute("fList",productService.getListFoodCategory());
		
		return "main";
	}
	
	@GetMapping("/admin")
	public String adminPage() throws Exception {
		return "admin/admin";
	}
}

package shop.seulmeal.web.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.product.ProductService;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("${operation.query.pageUnit}")
	int pageUnit;
	
	@Value("${operation.query.pageSize}")
	int pageSize;
	
	@GetMapping("/")
	public String main(HttpSession session, Model model) throws Exception {
		session.setAttribute("fList",productService.getListFoodCategory());
		User user = (User)session.getAttribute("user");
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(user == null) {
			Map<String,Object> map = productService.getListProduct(search);
			List<Product> list = (List)map.get("list");
			model.addAttribute("list",list);
		}
		
		return "main";
	}
	
	@GetMapping("/admin")
	public String adminPage() throws Exception {
		return "admin/admin";
	}
}

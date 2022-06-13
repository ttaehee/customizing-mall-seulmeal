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

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.operation.OperationService;
import shop.seulmeal.service.product.ProductService;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	private OperationService operationService;
	
	@Value("${operation.query.pageUnit}")
	int pageUnit;
	
	@Value("${operation.query.pageSize}")
	int pageSize;
	
	@GetMapping("/")
	public String main(HttpSession session, Model model) throws Exception {
				
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}		
		search.setPageSize(pageSize);
		System.out.println(search);
		
		// 이벤트		
		Map<String,Object> map = operationService.getListOperation(search, 2);		
		model.addAttribute("listE",(List<Post>)map.get("list"));
				
		// 푸드 카테고리
		model.addAttribute("list",(List<Post>)map.get("list"));		
		session.setAttribute("fList",productService.getListFoodCategory());
		
		// 추천음식
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			map = productService.getListProduct(search);
			List<Product> list = (List)map.get("list");
			model.addAttribute("list",list);
		} else {
			if(user.getFoodCategoryName1() == null) {
				map = productService.getListProduct(search);
				List<Product> list = (List)map.get("list");
				model.addAttribute("list",list);
			}else {
				map = productService.getListProduct(search);
				List<Product> list = (List)map.get("list");
				model.addAttribute("list",list);
			}
		}
		
		
		return "main/main";
	}
	
	@GetMapping("/admin")
	public String adminPage(HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals("1")) {
				return "admin/admin";
			}
		}
		
		return "redirect:/";
	}
}

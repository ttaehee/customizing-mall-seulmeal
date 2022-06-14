package shop.seulmeal.web.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.operation.OperationService;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	private OperationService operationService;
	
	@Autowired
	private UserService userService;
	
	@Value("${operation.query.pageUnit}")
	int pageUnit;
	
	@Value("${operation.query.pageSize}")
	int pageSize;
	
	@GetMapping("/")
	public String main(HttpSession session, Model model, HttpServletRequest request,@AuthenticationPrincipal User userC) throws Exception {
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		System.out.println("ip : : : : : "+ip);
		model.addAttribute("clientIP", ip);
		
		// 자동로그인
		Cookie[] cookies = request.getCookies();		
		if(cookies != null) {
			String userId = null;
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("loginCookie")) {
					userId = cookie.getValue();
				}
			}			
			User dbUser = userService.getUser(userId);			
			if(dbUser != null) {
				session.setAttribute("user", dbUser);
			}
		}
		
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
		User user = userC;
		session.setAttribute("user", user);
		System.out.println("principal : "+userC);
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
		
		System.out.println("user C 임 "+userC);
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

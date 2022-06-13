package shop.seulmeal.web.user;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Point;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private ProductService productService;
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@GetMapping("insertUser")
	public String insertUser() throws Exception{	
		
		return "user/insertUser";
	}
	
	@PostMapping("insertUser")
	public String insertUser(@ModelAttribute("user") User user, @DateTimeFormat(pattern="YYYY-MM-DD") Date birth, HttpSession session) throws Exception {
		
		System.out.println("::user : "+user);
		userService.insertUser(user);
		session.setAttribute("user", user);
		
		return "redirect:/user/insertUserInformation";
	}
	
	
	  @GetMapping("insertUserInformation") 
	  public String insertUserInformation(Model model) throws Exception{
	  
		  List<Foodcategory> foodcategoryList = productService.getListFoodCategory();
		  model.addAttribute("foodcategoryList",foodcategoryList);
	 return "user/insertUserInformation"; 
	 }
	 
	
	@PostMapping("inserUserInformation")
	public String insertUserInformation(List<String> foodcategory ) throws Exception {
		
		
		System.out.println(foodcategory.get(0));
		System.out.println(foodcategory.get(1));
		
		
		return "redirect:/";
	}
	
	@GetMapping("getUpdateUser/{userId}")
	public String getUpdateUser(@PathVariable("userId") String userId, Model model) throws Exception {
		
		User user = userService.getUser(userId);
		
		model.addAttribute("user", user);
		
		return "user/getUpdateUser";
	}
	
	@PostMapping("getUpdateUser")
	public String getUpdateUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {
		
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		return "redirect:/user/getUpdateUser/"+sessionId;	
	}
	
	@GetMapping("login")
	public String login() throws Exception {
		
		return "user/login";
	}
	
	@PostMapping("login")
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("::user : "+user);
		
		User dbUser = userService.getUser(user.getUserId());
		
		if(user.getPassword().equals((dbUser.getPassword()))) {
			session.setAttribute("user", dbUser);
		}
		
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		return "redirect:/";
	}
	
	
	public String naverLogin() throws Exception {
		return "main";
	}
	
	public String kakaoLogin() throws Exception {
		return "main";
	}
	
	@GetMapping("findUserId")
	public String findUserId() throws Exception {
		 
		return "user/findUserIdView";
	}
	
	@PostMapping("findUserId")
	public String findUserId(String name,String phone, String email, Model model) throws Exception {
		
		if(phone !=null) {
			User user = userService.confirmUserPhone(phone);

			if (name.equals(user.getUserName())) {
				model.addAttribute("userId", user.getUserId());

				return "user/findUserId";

			} else {
				return "<script>alert('등록된 아이디가 없습니다.');</script>";
			}
			
		} else {
			
			User user = userService.confirmUserEmail(email);
			
			if (name.equals(user.getUserName())) {
				model.addAttribute("userId", user.getUserId());

				return "user/findUserId";

			} else {
				return "<script>alert('등록된 아이디가 없습니다.');</script>";
			}
		}
		
	}
	
		
	@GetMapping("findUserPassword")
	public String findUserPassword(String userId, String phone, String email) throws Exception {
		
		if(phone !=null) {
			User user = userService.confirmUserPhone(phone);

			if (userId.equals(user.getUserId())) {
				
				return "user/resetUserPassword";

			} else {
				return "<script>alert('등록된 아이디가 없습니다.');</script>";
			}
			
		} else {
			
			User user = userService.confirmUserEmail(email);
			
			if (userId.equals(user.getUserId())) {
				
				return "user/resetUserPassword";

			} else {
				return "<script>alert('등록된 아이디가 없습니다.');</script>";
			}
		}
		
	}
	
	@GetMapping("userGradeModal")
	public String userGradeModal() throws Exception {
		
		return "userGradeModal";
	}
	
	@GetMapping("deleteUser")
	public String deleteUser() throws Exception {
		
		return "user/deleteUser";
	}
	
	@PostMapping("deleteUser")
	public String deleteUser( String password, HttpSession session) throws Exception {
	
		if(password.equals(((User)session.getAttribute("user")).getPassword())) {
			userService.deleteUser(((User)session.getAttribute("user")).getUserId());
			
			session.invalidate();
			
			return "redirect:/";
		} else {
			return "<script>alert('비밀번호가 일치하지 않습니다');</script>";
		}
		
		
		
	}
	
	@GetMapping("listUser/{currentPage}")
	public String getUserList( Model model, @PathVariable(required = false) String currentPage, @PathVariable(required = false) String searchCondition) throws Exception {
		
		Search search = new Search();
		if(currentPage != null) {
			search.setCurrentPage(new Integer(currentPage));
		}
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setSearchCondition(searchCondition);
		System.out.println(search);
		
		Map<String , Object> map=userService.getListUser(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("page", resultPage);
		model.addAttribute("search", search);
		
		
		return "user/listUser";
	}
	
	@GetMapping("getUser/{userId}")
	public String getUser(@PathVariable("userId") String userId, Model model) throws Exception {
		
		User user = userService.getUser(userId);
		
		model.addAttribute("user", user);
		
		return "user/getUser";
	}
	
	
	
	
	@GetMapping("chargeuserPoint")
	public String chargeUserPoint() throws Exception {
		
		return "user/chargeUserPoint";
	}
	
	@GetMapping("getChargeUserPoint")
	public String getChargeUserPoint() throws Exception {
		
		return "user/getChargeUserPoint";
	}
	
	@GetMapping("listUserPoint/{currentPage}")
	public String listUserPoint(Model model, @PathVariable(required = false) String currentPage, @PathVariable(required = false) String searchCondition, HttpSession session) throws Exception {
		
		Search search = new Search();
		if(currentPage != null) {
			search.setCurrentPage(new Integer(currentPage));
		}
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setSearchCondition(searchCondition);
		System.out.println(search);
		
		User dbUser= (User)session.getAttribute("user");
		
		Map<String , Object> map=userService.getListPoint(search, dbUser.getUserId());
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("pontTotalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		model.addAttribute("pointList", map.get("pointList"));
		model.addAttribute("page", resultPage);
		model.addAttribute("search", search);
		
		return "user/listUserPoint";
	}
	
	
	
	
	

}

package shop.seulmeal.web.user;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import shop.seulmeal.service.confirm.ConfirmService;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.naver.impl.KakaoAPI;
import shop.seulmeal.service.naver.impl.LoginService;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ConfirmService confirmService;
	
	@Autowired
	private LoginService loginService;
	

	public UserRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@GetMapping("/username")
	public Principal cuname(Principal principal) {
		System.out.println("principal 알려줘 : "+principal);
		return principal;
	}
	
	@GetMapping("api/confirmUserId/{userId}")
	public JSONObject confirmUserId(@PathVariable String userId) throws Exception {
		JSONObject json = new JSONObject();
		
		int no = userService.confirmUserId(userId);
		if(no == 0) {
			json.put("result", "success");
		} else {
			json.put("result", "fail");
		}
			
		return json;
	}
	
	@GetMapping("api/confirmUserNickname/{nickName}")
	public JSONObject confirmUserNickname(@PathVariable String nickName) throws Exception {
		JSONObject json = new JSONObject();
		int no = userService.confirmUserId(nickName);
		if(no == 0) {
			json.put("result", "success");
		} else {
			json.put("result", "fail");
		}
		return json;
	}
	
	@GetMapping("api/confirmUserPhone/{phone}")
	public JSONObject confirmUserPhone(@PathVariable String phone,HttpSession session) throws Exception {
		JSONObject json = new JSONObject();
		
		User user = userService.confirmUserPhone(phone);
		
		
		if(user == null) {			
			int num = confirmService.confirmNum();
			String message = "인증번호는 ["+num+"] 입니다";
			confirmService.sendSMS(phone, message);
			session.setAttribute(phone, num);
			json.put("result", "success");
		} else {
			json.put("result", "fail");
		}
		
		return json;
	}
	
	@GetMapping("api/confirmUserEmail/{email}")
	public JSONObject confirmUserEmail(@PathVariable String email, HttpSession session) throws Exception {
		JSONObject json = new JSONObject();
		User user = userService.confirmUserEmail(email);
		
		if(user == null) {			
			int num = confirmService.confirmNum();
			String message = "인증번호는 ["+num+"] 입니다";
			confirmService.sendMail(message, email);
			session.setAttribute(email, num);
			json.put("result", "success");
			
		} else {
			json.put("result", "fail");
		}
		
		return json;
	}
	
	@GetMapping("api/confirmCode/{confirm}/{confrimNum}")
	public JSONObject confirmCode(@PathVariable String confirm,
							@PathVariable Integer confrimNum, HttpSession session) throws Exception {
		
		JSONObject json = new JSONObject();
		int num =(Integer)session.getAttribute(confirm);
		System.out.println("내가보낸 인증번호 : "+confrimNum);
		System.out.println("들어있는 인증번호 : "+num);
		if(confrimNum == num) {
			json.put("result", "인증완료");
			session.removeAttribute(confirm);
		} else {
			json.put("result", "인증실패");
		}
		
		return json;
	}
	
	public String confirmCaptcha() throws Exception {
		return null;
	}
	
	@GetMapping("api/naver")
	public String authNaver(@RequestParam Map<String, String> resValue) {
		System.out.println(resValue);
		String token = loginService.getNaverAccessToken(resValue.get("state"), resValue.get("code"));
		User user = loginService.getUserInfo(token);
		System.out.println(user);
		return "code : ";
	}

}

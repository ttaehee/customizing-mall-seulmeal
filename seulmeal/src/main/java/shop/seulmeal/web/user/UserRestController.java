package shop.seulmeal.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.service.confirm.ConfirmService;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@RestController
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ConfirmService confirmService;

	public UserRestController() {
		// TODO Auto-generated constructor stub
	}

	
	@GetMapping("api/confirmUserId/{userId}")
	public int confirmUserId(@PathVariable String userId) throws Exception {
		
		int no = userService.confirmUserId(userId);
		
		return no;
	}
	
	@GetMapping("api/confirmUserNickname/{nickName}")
	public int confirmUserNickname(@PathVariable String nickName) throws Exception {
		int no = userService.confirmUserId(nickName);
		
		return no;
	}
	
	@GetMapping("api/confirmUserPhone/")
	public String confirmUserPhone( String phone) throws Exception {
		
		User user = userService.confirmUserPhone(phone);
		
		return user.getPhone();
	}
	
	@GetMapping("api/confirmUserEmail/")
	public String confirmUserEmail(String email, String name, String code, HttpSession session) throws Exception {
		
		User user = userService.confirmUserEmail(email);
		
		String sendMessage = confirmService.confirmNum();
		String sendCode = sendMessage.substring(7,10);
		System.out.println("::sendCode : "+sendCode);
		session.setAttribute("sendCode", sendCode);
		
		if(name.equals(user.getUserName())) {
			confirmService.sendMail(sendMessage, email);
		}
		
		if(code.equals(session.getAttribute(sendCode))) {
			
		}
		
		return user.getUserId();
	}
	
	public String confirmCode() throws Exception {
		return null;
	}
	
	public String confirmCaptcha() throws Exception {
		return null;
	}
	

}

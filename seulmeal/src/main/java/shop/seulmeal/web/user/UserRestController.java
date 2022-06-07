package shop.seulmeal.web.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

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
	
	@GetMapping("api/confirmUserPhone/{phone}")
	public String confirmUserPhone(@PathVariable String phone) throws Exception {
		
		User user = userService.confirmUserPhone(phone);
		
		return user.getPhone();
	}
	
	@GetMapping("api/confirmUserEmail/{email}")
	public String confirmUserEmail(@PathVariable String email) throws Exception {
		
		User user = userService.confirmUserEmail(email);
		
		return user.getEmail();
	}
	
	public String confirmCode() throws Exception {
		return null;
	}
	
	public String confirmCaptcha() throws Exception {
		return null;
	}
	

}

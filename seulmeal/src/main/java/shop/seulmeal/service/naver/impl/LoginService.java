package shop.seulmeal.service.naver.impl;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	public LoginService() {
		// TODO Auto-generated constructor stub
	}

}

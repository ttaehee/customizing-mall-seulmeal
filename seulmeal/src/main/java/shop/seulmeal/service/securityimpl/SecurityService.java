package shop.seulmeal.service.securityimpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.domain.UserPrincipal;
import shop.seulmeal.service.mapper.UserMapper;

@Service
public class SecurityService implements UserDetailsService{
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("userId : "+ userId);
		User useraAuthes = null;
		try {
			useraAuthes = userMapper.getUser(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new UserPrincipal(useraAuthes);
	}
	
	public String insertUser(User user) throws Exception {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		userMapper.insertUser(user);
		
		return "success";
	}
}

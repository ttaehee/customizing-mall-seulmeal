package shop.seulmeal.service.user;

import java.util.List;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.User;

public interface UserService {

	public int insertUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public int updateUser(User user) throws Exception;
	
	public int deleteUser(User user) throws Exception;
	
	public List<User> getListUser() throws Exception;
	
	public int confirmUserId(String userId) throws Exception; 
	
	public int confirmUserPhone(String phome) throws Exception;
	
	public int confirmUserEmail(String email) throws Exception;
	
	public int confirmCode(String code) throws Exception;
	
	public int confirmUserNickname(String nickname) throws Exception;
	
	public int confirmCaptcha(String captcha) throws Exception;
	
	public int kakaoLogin() throws Exception;
	
	public int naverLogin() throws Exception;
	
	public int insertBlackList() throws Exception;
	

	
}

package shop.seulmeal.service.user;

import java.util.List;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.BlackList;
import shop.seulmeal.service.domain.Point;
import shop.seulmeal.service.domain.User;

public interface UserService {

	public int insertUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public int updateUser(User user) throws Exception;
	
	public int deleteUser(User user) throws Exception;
	
	public List<User> getListUser() throws Exception;
	
	public int confirmUserId(String userId) throws Exception; 
	
	public User confirmUserPhone(String phone) throws Exception;
	
	public User confirmUserEmail(String email) throws Exception;
	
	public int confirmCode(String code) throws Exception;
	
	public int confirmUserNickname(String nickname) throws Exception;
	
	public int confirmCaptcha(String captcha) throws Exception;
	
	public int kakaoLogin() throws Exception;
	
	public int naverLogin() throws Exception;
	
	public int insertBlackList(BlackList blackList) throws Exception;
	
	public int updateBlackList(BlackList blackList) throws Exception;
	
	public int insertPont(Point point) throws Exception;
	
	public List<Point> getListPoint() throws Exception;
	
	
	
	

	
}

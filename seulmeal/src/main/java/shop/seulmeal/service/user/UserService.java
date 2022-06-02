package shop.seulmeal.service.user;

import java.util.List;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.User;

public interface UserService {

	public int insertUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void deleteUser(User user) throws Exception;
	
	public List<User> getListUser() throws Exception;
}

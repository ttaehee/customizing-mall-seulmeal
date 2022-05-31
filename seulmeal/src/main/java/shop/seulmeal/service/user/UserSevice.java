package shop.seulmeal.service.user;

import shop.seulmeal.service.domain.User;

public interface UserSevice {
	public void insertUser(User user) throws Exception;
	public User getUser(String userId) throws Exception;
	public void updateUser(User user) throws Exception;
	public void deleteUser(User user) throws Exception;
}

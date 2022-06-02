package shop.seulmeal.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.UserMapper;
import shop.seulmeal.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int insertUser(User user) throws Exception {
		return userMapper.insertUser(user);
		
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getListUser() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}

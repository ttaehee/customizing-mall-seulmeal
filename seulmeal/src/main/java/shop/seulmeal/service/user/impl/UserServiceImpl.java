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

	@Override
	public int insertUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<User> getListUser() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int confirmUserId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int confirmUserPhone(String phome) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int confirmUserEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int confirmCode(String code) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int confirmUserNickname(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int confirmCaptcha(String captcha) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int kakaoLogin() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int naverLogin() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBlackList() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}

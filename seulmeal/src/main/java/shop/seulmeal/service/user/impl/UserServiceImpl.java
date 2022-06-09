package shop.seulmeal.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.BlackList;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Point;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.UserMapper;
import shop.seulmeal.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int insertUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.insertUser(user);
	}
	
	public int insertUserInformation(User user) throws Exception{
		return userMapper.inserUserInformation(user);
	}

	@Override
	public int insertHatesParts(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.insertHatesParts(map);
	}
	
	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUser(userId);
	}
	
	@Override
	public List<Parts> getUserHatesParts(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserHatesParts(userId);
	}


	@Override
	public Map<String, Object> getListUser(Search search) throws Exception {

		Map<String, Object> map=new HashMap<>();
		map.put("search", search);

		
		List<User> list=userMapper.getListUser(search);
		int totalCount=userMapper.getListUserTotalCount(search);
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public int updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}

	@Override
	public int deleteUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.deleteUser(userId);
	}

	public int confirmUserId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.checkDuplicationUserId(userId);
	}

	@Override
	public User confirmUserPhone(String phone) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.checkDuplicationPhone(phone);
	}

	@Override
	public User confirmUserEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.checkDuplicationEmail(email);
	}

	@Override
	public int confirmCode(String code) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int confirmUserNickname(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.checkDuplicationNickName(nickname);
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
	public int insertBlackList(BlackList blackList) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.insertBlackList(blackList);
	}
	
	@Override
	public int updateBlackList(BlackList blakList) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.updateBlackList(blakList);
	}


	@Override
	public int insertPoint(Point point) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.insertPoint(point);
	}

	@Override
	public Map<String, Object>  getListPoint(Search search) throws Exception {


		Map<String, Object> map=new HashMap<>();
		map.put("search", search);

		
		List<Point> list=userMapper.getListPoint(search);
		int totalCount=userMapper.getListPointTotalCount(search);
		
		map.put("List", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public User getProfile(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getProfile(userId);
	}

	@Override
	public int updateProfile(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.updateProfile(user);
	}
	
	

	

	



	

	
	
	
}

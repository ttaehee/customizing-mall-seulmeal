package shop.seulmeal;


import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Point;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.ProductMapper;
import shop.seulmeal.service.mapper.UserMapper;
import shop.seulmeal.service.user.UserService;



@SpringBootTest
public class UserTest {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
		
	
	//@Test
	void insertUser() throws Exception{
		User user = new User();
		user.setUserId("testUser1");
		user.setUserName("testName1");
		user.setPassword("testPassword1");
		user.setBirth("00/01/01");
		user.setAddress("서울");
		user.setPhone("00031");
		user.setEmail("xcvbe1");
		user.setNickName("닉네임1");
		
		
		assertThat(userMapper.insertUser(user)).isEqualTo(1);
	}
	
	//@Test
	void insertHatesParts() throws Exception{
		
		List<Parts> parts = new ArrayList<Parts>();
		//parts.add( 1, "양파");
	
		
	}
	
	@Test
	void getUser() throws Exception{
		User user = new User();
		
		user.setUserId("testUser");
		
		user=userMapper.getUser("testUser");
		System.out.println("getUser : "+user);
		
		assertEquals(user.getUserName(), "testName");
		assertEquals(user.getPassword(), "testPassword");
		assertEquals(user.getAddress(), "서울");
		
	}
	
	//@Test
	void updateUser() throws Exception {
		
		User user =new User();
		user.setUserId("testUser");
		user.setUserName("testUser11");
		user.setPassword("1234");
		user.setPhone("0004");
		user.setEmail("bvcx");
		
		
		
		userMapper.updateUser(user);
		user=userMapper.getUser("testUser");
		System.out.println("updateUser : "+user);
		
		assertEquals(user.getUserId(), "testUser");
		
	}
	
	//@Test
	void deleteUser() throws Exception {
		User user = new User();
		user.setUserId("testUser");
		
		userMapper.deleteUser(user);
		user=userMapper.getUser("testUser");
		System.out.println("deleteUser : "+user);
		
		assertEquals(user.getUserId(),  "testUser");
		
	}
	
	//@Test
	void getListUser() throws Exception {
		
		
		
		
	}
	
	//@Test
	void insertPoint() throws Exception {
	
		
		Point point = new Point();
		point.setUserId("ghm4905");
		point.setPurchaseNo(2);
		point.setPointStatus("1");
		point.setPoint(6);
		
		assertThat(userMapper.insertPoint(point)).isEqualTo(1);
		
	}
	
	
	
}

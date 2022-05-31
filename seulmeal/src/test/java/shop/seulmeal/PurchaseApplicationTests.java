package shop.seulmeal;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.ProductMapper;
import shop.seulmeal.service.mapper.PurchaseMapper;
import shop.seulmeal.service.mapper.UserMapper;


@SpringBootTest
class PurchaseApplicationTests {
	
	//@Autowired
	//private UserMapper userMapper;
	
	@Autowired
	private PurchaseMapper purchaseMapper;
	
	//@Autowired
	//private ProductMapper productMapper;	
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	@Test
	void insertPurchase() {
		Purchase purchase=new Purchase();
		User user=new User();
		user.setUserId("user01");
		user.setUserName("홍길동");
		user.setPhone("1111");
		
		purchase.setUser(user);
		purchase.setPrice(10000);
		purchase.setDeliveryPrice(3000);
		purchase.setAddress("강남");
		purchase.setName("홍길동");
		purchase.setPhone("1111");
		purchase.setMessage("빠른배송요");
		purchase.setPurchaseStatus("0");
		purchase.setPaymentCondition("0");
		purchase.setImp_uid("1111");
		purchase.setAmount(13000);
		
		int result=purchaseMapper.insertPurchase(purchase);
		System.out.println("결과 : "+result);
		assertEquals(purchase.getPrice(), 10000);
	}

}

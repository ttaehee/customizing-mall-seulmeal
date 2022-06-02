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
import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Product;
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
	
	//@Test
	void insertCustomParts() {
		CustomParts customParts=new CustomParts();

		Product product=new Product();
		product.setProductNo(1);
		
		//customParts.setUser(user);
		//customParts.setProduct(product);
		//customParts.setCount(2);
		//customParts.setCartStatus("1");
		//customParts.setStatus("0");
			
		//int result=purchaseMapper.insertCustomParts(customParts);
		//System.out.println("결과 : "+result);
		
		//assertEquals(customProduct.getCount(), 2);
	}
	
	//@Test
	void insertCustomProduct() {
		CustomProduct customProduct=new CustomProduct();
		User user=new User();
		user.setUserId("ghm4905");
		Product product=new Product();
		product.setProductNo(1);
		
		customProduct.setUser(user);
		customProduct.setProduct(product);
		customProduct.setCount(5);
		customProduct.setCartStatus("1");
		customProduct.setStatus("0");
			
		int result=purchaseMapper.insertCustomProduct(customProduct);
		System.out.println("결과 : "+result);
		
		assertEquals(customProduct.getCount(), 2);
	}
	
	//@Test
	void updateCustomProduct() {
		CustomProduct customProduct=new CustomProduct();
		Purchase purchase=new Purchase();
		purchase.setPurchaseNo(2);
		
		customProduct.setCustomProductNo(1);
		customProduct.setPurchase(purchase);
		
		purchaseMapper.updateCustomProduct(customProduct);
		customProduct=purchaseMapper.getCustomProduct(1);
		System.out.println("결과 : "+customProduct);
		
		assertEquals(customProduct.getCount(), 2);
	}
	
	//@Test
	void insertPurchase() {
		Purchase purchase=new Purchase();
		User user=new User();
		user.setUserId("ghm4905");
		user.setUserName("김태히");
		user.setPhone("4905");
		
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
	
	//@Test
	void getPurchase() {
		Purchase purchase=new Purchase();
		
		purchase.setPurchaseNo(2);
		
		purchase=purchaseMapper.getPurchase(2);
		System.out.println("결과 : "+purchase);
		
		assertEquals(purchase.getPrice(), 10000);
	}
	
	//@Test
	void updatePurchaseCode() {
		Purchase purchase=new Purchase();
		
		purchase.setPurchaseNo(2);
		purchase.setPurchaseStatus("1");
		
		purchaseMapper.updatePurchaseCode(purchase);
		purchase=purchaseMapper.getPurchase(2);
		System.out.println("결과 : "+purchase);
		
		assertEquals(purchase.getPurchaseStatus(), "1");
	}
	
	//@Test
	void deletePurchase() {
		Purchase purchase=new Purchase();
		
		purchase.setPurchaseNo(2);
		
		purchaseMapper.deletePurchase(purchase);
		purchase=purchaseMapper.getPurchase(2);
		System.out.println("결과 : "+purchase);
		
		assertEquals(purchase.getStatus(), "1");
	}

}

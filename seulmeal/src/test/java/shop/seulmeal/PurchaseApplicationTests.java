package shop.seulmeal;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.ProductMapper;
import shop.seulmeal.service.mapper.PurchaseMapper;
import shop.seulmeal.service.mapper.UserMapper;
import shop.seulmeal.service.product.ProductService;


@SpringBootTest
//@Transactional(rollbackFor=Exception.class)
class PurchaseApplicationTests {
	
	//@Autowired
	//private UserMapper userMapper;
	
	@Autowired
	private PurchaseMapper purchaseMapper;
	
	@Autowired
	private ProductMapper productMapper;	
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	//@Test
	void insertCustomParts() {
		CustomParts customParts=new CustomParts();
		Parts parts=new Parts();
		parts.setPartsNo(1);
		
		customParts.setCustomProductNo(1);
		customParts.setProductPartsNo(1);
		customParts.setParts(parts);
		customParts.setGram(50);
			
		List<CustomParts> list=new ArrayList<CustomParts>();
		
		for(int i=0; i<5; i++) {
			list.add(customParts);
		}
					
		int result=purchaseMapper.insertCustomParts(list);
		System.out.println("결과 : "+result);
		
		assertEquals(purchaseMapper.getCustomParts(11).getGram(), 50);
	}
	
	//@Test
	void getCustomParts() {
		CustomParts customParts=new CustomParts();
		
		customParts=purchaseMapper.getCustomParts(11);
		System.out.println("결과 : "+customParts);
		
		assertEquals(customParts.getGram(), 50);
	}
	
	//@Test
	void getListCustomParts() throws Exception {
		
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("search : "+search);
		
		Map<String, Object> map=new HashMap<>();
		map.put("customProductNo",1);
		map.put("search", search);
		
		List<CustomParts> list=purchaseMapper.getListCustomParts(map);
		
		System.out.println("list 결과 : "+list);
		
		map.put("partsNo",1);
		
		for(CustomParts customParts : list) {
			customParts.setCustomProductNo(1);
			customParts.setParts(productMapper.getParts(map));
			System.out.println("결과 : "+customParts);
		}

	}	
	
	//@Test
	void deleteCustomParts() {
		
		//customProductNo=1
		purchaseMapper.deleteCustomParts(1);
		
		int result=purchaseMapper.deleteCustomParts(1);
		System.out.println("결과 : "+result);
	}	
	
	
	//@Test
	void insertCustomProduct() {
		CustomProduct customProduct=new CustomProduct();
		User user=new User();
		user.setUserId("ghm4905");
		Product product=new Product();
		product.setProductNo(3);
		
		customProduct.setUser(user);
		customProduct.setProduct(product);
		customProduct.setCount(7);
		customProduct.setCartStatus("1");
		customProduct.setStatus("0");
			
		int result=purchaseMapper.insertCustomProduct(customProduct);
		System.out.println("결과 : "+result);
		
		assertEquals(purchaseMapper.getCustomProduct(3).getCount(), 7);
	}
	
	@Test 
	void getListCustomProduct() {
		
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("search : "+search);
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId","ghm4905");
		map.put("search", search);
		
		List<CustomProduct> list=purchaseMapper.getListCustomProduct(map);
		
		System.out.println("list 결과 : "+list);
		
		//for(CustomProduct customProduct : list) {
		//	map.put("customProductNo",1);
			purchaseMapper.getListCustomParts(map);		
		//}

	}		
	
	//@Test
	void updateCustomProduct() {
		CustomProduct customProduct=new CustomProduct();
		Purchase purchase=new Purchase();
		purchase.setPurchaseNo(3);
		
		customProduct.setCustomProductNo(1);
		customProduct.setPurchase(purchase);
		
		purchaseMapper.updateCustomProduct(customProduct);

		System.out.println("결과 : "+purchaseMapper.getCustomProduct(3));
		
		assertEquals(purchaseMapper.getCustomProduct(3).getPurchase().getPurchaseNo(), 2);
	}
	
	//@Test
	void deleteCustomProduct() {
		CustomProduct customProduct=new CustomProduct();
		customProduct.setCustomProductNo(3);
		
		purchaseMapper.updateCustomProduct(customProduct);

		System.out.println("결과 : "+purchaseMapper.getCustomProduct(3));
		
		assertEquals(purchaseMapper.getCustomProduct(3).getStatus(), 1);
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
	
	//@Test 해야
	void getListPurchase() throws Exception {
		
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("search : "+search);
		
		Map<String, Object> map=new HashMap<>();
		map.put("customProductNo",1);
		map.put("search", search);
		
		List<CustomParts> list=purchaseMapper.getListCustomParts(map);
		
		System.out.println("list 결과 : "+list);
		
		map.put("partsNo",1);
		
		for(CustomParts customParts : list) {
			customParts.setCustomProductNo(1);
			customParts.setParts(productMapper.getParts(map));
			System.out.println("결과 : "+customParts);
		}

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

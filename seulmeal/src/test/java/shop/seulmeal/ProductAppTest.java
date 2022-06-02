package shop.seulmeal;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import junit.framework.Assert;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.product.ProductService;

@SpringBootTest
public class ProductAppTest {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	
	public void testInsertProduct() throws Exception {

		Product product = new Product();
		Foodcategory food = new Foodcategory();
		food.setFoodCategoryNo(0);
		
		product.setFoodCategory(food);
		product.setName("test01");
		product.setSubContent("TEST01");
		product.setPrice(1000);
		product.setCalorie(1000);
		product.setContent("TEST01 PROCESSING");
		product.setStock(100);
		product.setThumbnail("0");		
		
		System.out.println(product);
		
		productService.insertProduct(product);
		
	}
	
	
	public void testGetProduct() throws Exception {
		Product product = productService.getProduct(1);
		
		System.out.println(product);
		
		
	}
	
	
	public void testListProduct() throws Exception {
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("김치");
	 	Map<String,Object> map = productService.listProduct(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	
	 	
	}
	
	
	public void testUpdateProduct() throws Exception {
		Product product = productService.getProduct(1);
		food
		
		product.setFoodCategory();
		product.setName("UPDATED");
		product.setSubContent("업데이트 완료");
		product.setPrice(5900);
		product.setCalorie(980);
		product.setContent("업데이트를 성공적으로 마쳤습니다");
		product.setStock(50);
		product.set
	}
		
	
	
	public void testdeleteProduct() throws Exception {
		
	}
}

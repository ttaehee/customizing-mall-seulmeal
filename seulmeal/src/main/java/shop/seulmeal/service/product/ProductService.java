package shop.seulmeal.service.product;

import java.util.List;
import java.util.Map;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Review;

public interface ProductService {
	public void insertProduct(Product product) throws Exception;
	public void updateProduct(Product product) throws Exception;
	public Map<String, Object> listProduct(Search search) throws Exception;
	public Product getProduct(int productNo) throws Exception;
	public void deleteProduct(int productNo) throws Exception;
	
	public void insertFoodCategory(String foodCategoryName) throws Exception;
	public Map<String, Object> listFoodCategory(Search search) throws Exception;
	public void deleteFoodCategory(int foodCategoryNo) throws Exception;
	
	public void insertReview(Review review) throws Exception;
	public void updateReview(Review review) throws Exception;
	public Review getReview(int reviewNo) throws Exception;
	public Map<String, Object> listReview(Search search) throws Exception;
	public void deleteReview(int reviewNo) throws Exception;
}

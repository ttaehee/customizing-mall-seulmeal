package shop.seulmeal.service.product;

import java.util.List;
import java.util.Map;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Review;

public interface ProductService {
	// Product
	public void insertProduct(Product product) throws Exception;

	public void updateProduct(Product product) throws Exception;

	public Map<String, Object> getListProduct(Search search) throws Exception;

	public Product getProduct(int productNo) throws Exception;

	public void deleteProduct(int productNo) throws Exception;
	
	public void restoreProduct(int productNo) throws Exception;

	// foodCategory 관련
	public void insertFoodCategory(String foodCategoryName) throws Exception;

	public List<Foodcategory> getListFoodCategory() throws Exception;

	public void deleteFoodCategory(int foodCategoryNo) throws Exception;
	
	public void restoreFoodCategory(int foodCategoryNo) throws Exception;

	// Review
	public void insertReview(Review review) throws Exception;

	public void updateReview(Review review) throws Exception;

	public Review getReview(int reviewNo) throws Exception;

	public Map<String, Object> getListReview() throws Exception;

	public void deleteReview(int reviewNo) throws Exception;
	
	public void restoreReview(int reviewNo) throws Exception;

	// Parts 넣기
	public int insertParts(Parts parts) throws Exception;

	public Parts getParts(Map<String, Object> map) throws Exception;

	public int updateParts(Parts parts) throws Exception;

	public int deleteParts(int no) throws Exception;

	public Map<String, Object> getListParts(Search search) throws Exception;

	// ProductParts 관련
	public int insertProudctParts(List<Parts> list) throws Exception;

	public List<Parts> getProductParts(int productNo) throws Exception;

	public int deleteProductParts(int productPartsNo) throws Exception;

}

package shop.seulmeal.service.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Review;

@Mapper
public interface ProductMapper {
	
	public void insertProduct(Product product) throws Exception;
	public void updateProduct(Product product) throws Exception;
	public Product getProduct(int productNo) throws Exception;
	public List<Product> listProduct(Search search) throws Exception;
	public void deleteProduct(int productNo) throws Exception;
	
	public void insertFoodCategory(String foodCategoryName) throws Exception;
	public List<Foodcategory> listFoodCategory(Search search) throws Exception;
	public void deleteFoodCategory(int foodCategoryNo) throws Exception;
	
	public void insertReview(Review review) throws Exception;
	public void updateReview(Review review) throws Exception;
	public Review getReview(int reviewNo) throws Exception;
	public List<Review> listReview(Search search) throws Exception;
	public void deleteReview(int reviewNo) throws Exception;
	
	public int insertParts(Parts parts)throws Exception;
	public Parts getParts(Map<String,Object> map)throws Exception;
	public int updateParts(Parts parts)throws Exception;
	public int deleteParts(int no)throws Exception;
	public List<Parts> getListParts(Map<String,Object> map)throws Exception;
	
	// productParts
	public int insertProudctParts(List<Parts> list)throws Exception;
	public List<Parts> getProductParts(int productNo)throws Exception;
	public int deleteProductParts(Parts parts)throws Exception;
	
	// totalCount
	public int getTotalProductCount(Search search) throws Exception;
	public int getTotalFoodCategoryCount()throws Exception;
	public int getReviewCountInProduct(int productNo)throws Exception;
	public int getAverageRating (int productNo) throws Exception;
	public int getTotalReviewCount()throws Exception;
	public int getTotalPartsCount(Search search)throws Exception;
}

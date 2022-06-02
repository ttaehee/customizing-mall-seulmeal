package shop.seulmeal.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Review;
import shop.seulmeal.service.mapper.ProductMapper;
import shop.seulmeal.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}

	// Product CRUD
	@Override
	// test done
	public void insertProduct(Product product) throws Exception {
		productMapper.insertProduct(product);
	}

	@Override
	// test done
	public void updateProduct(Product product) throws Exception {
		productMapper.updateProduct(product);
	}

	@Override
	public Map<String, Object> getListProduct(Search search) throws Exception {
		List<Product> list = productMapper.getListProduct(search);
		int totalCount = productMapper.getTotalProductCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	// test done
	public Product getProduct(int productNo) throws Exception {
		return productMapper.getProduct(productNo);
	}

	@Override
	// test done + need toggle
	public void deleteProduct(int productNo) throws Exception {

		productMapper.deleteProduct(productNo);
	}

	// Food Category CRUD
	public void insertFoodCategory(String foodCategoryName) throws Exception {
		productMapper.insertFoodCategory(foodCategoryName);
	}

	public Map<String, Object> getListFoodCategory() throws Exception {
		List<Foodcategory> list = productMapper.getListFoodCategory();
		int totalCount = productMapper.getTotalFoodCategoryCount();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void deleteFoodCategory(int foodCategoryNo) throws Exception {
		productMapper.deleteFoodCategory(foodCategoryNo);
	}

	// Review CRUD
	@Override
	public void insertReview(Review review) throws Exception {
		productMapper.insertReview(review);
		Product product = productMapper.getProduct(review.getProduct().getProductNo());
		product.setReviewCount(productMapper.getReviewCountInProduct(review.getProduct().getProductNo()));
		product.setAverageRating(productMapper.getAverageRating(review.getProduct().getProductNo()));
		productMapper.updateProduct(product);
	}

	@Override
	public void updateReview(Review review) throws Exception {
		productMapper.updateReview(review);
	}

	@Override
	public Review getReview(int reviewNo) throws Exception {
		return productMapper.getReview(reviewNo);
	}

	@Override
	public Map<String, Object> getListReview() throws Exception {
		List<Review> list = productMapper.getListReview();
		int totalCount = productMapper.getTotalReviewCount();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public void deleteReview(int reviewNo) throws Exception {
		productMapper.deleteReview(reviewNo);
	}

	// Parts 관련
	@Override
	public int insertParts(Parts parts) throws Exception {
		
		return productMapper.insertParts(parts);
	}

	@Override
	public Parts getParts(Map<String, Object> map) throws Exception {
		
		return productMapper.getParts(map);
	}

	@Override
	public int updateParts(Parts parts) throws Exception {
		
		return productMapper.updateParts(parts);
	}

	@Override
	public int deleteParts(int no) throws Exception {
		
		return productMapper.deleteParts(no);
	}

	@Override
	public Map<String, Object> getListParts(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);

		map.put("list", productMapper.getListParts(map));
		map.put("totalCount", productMapper.getTotalPartsCount(map));

		return map;
	}

	// ProductParts 관련
	@Override
	public int insertProudctParts(List<Parts> list) throws Exception {
		return productMapper.insertProudctParts(list);
	}

	@Override
	public List<Parts> getProductParts(int productNo) throws Exception {
		return productMapper.getProductParts(productNo);
	}

	@Override
	public int deleteProductParts(int productPartsNo) throws Exception {
		return productMapper.deleteProductParts(productPartsNo);
	}

	
	
	@Override
	public void restoreProduct(int productNo) throws Exception {
		productMapper.restoreProduct(productNo);
	}

	@Override
	public void restoreFoodCategory(int foodCategoryNo) throws Exception {
		productMapper.restoreFoodCategory(foodCategoryNo);
	}

	@Override
	public void restoreReview(int reviewNo) throws Exception {
		productMapper.restoreReview(reviewNo);
	}

}
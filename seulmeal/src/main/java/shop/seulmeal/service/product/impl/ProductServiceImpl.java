package shop.seulmeal.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
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

	@Override
	//test done
	public void insertProduct(Product product) throws Exception {
		productMapper.insertProduct(product);
	}

	@Override
	//test done
	public void updateProduct(Product product) throws Exception {
		productMapper.updateProduct(product);
	}

	@Override
	public Map<String, Object> listProduct(Search search) throws Exception {
		List<Product> list = productMapper.listProduct(search);
		int totalCount = productMapper.getTotalProductCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}
	
	@Override
	//test done
	public Product getProduct(int productNo) throws Exception {
		return productMapper.getProduct(productNo);
	}

	@Override
	//test done + need toggle
	public void deleteProduct(int productNo) throws Exception {
		
		productMapper.deleteProduct(productNo);
	}
	
	
	

	public void insertFoodCategory(String foodCategoryName) throws Exception {
		productMapper.insertFoodCategory(foodCategoryName);
	}

	public Map<String, Object> listFoodCategory(Search search) throws Exception {
		List<Foodcategory> list = productMapper.listFoodCategory(search);
		int totalCount = productMapper.getTotalFoodCategoryCount();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void deleteFoodCategory(int foodCategoryNo) throws Exception {
		productMapper.deleteFoodCategory(foodCategoryNo);		
	}

	
	
	@Override
	public void insertReview(Review review) throws Exception {
		productMapper.insertReview(review);
		Product product = 
			productMapper.getProduct(review.getProduct().getProductNo());
		product.setReviewCount(
			productMapper.getReviewCountInProduct(review.getProduct().getProductNo()));
		product.setAverageRating(
			productMapper.getAverageRating(review.getProduct().getProductNo()));
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
	public Map<String, Object> listReview(Search search) throws Exception {
		List<Review> list = productMapper.listReview(search);
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

	
	
	
	
	
	
	
}

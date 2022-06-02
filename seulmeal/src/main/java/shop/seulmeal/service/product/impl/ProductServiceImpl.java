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

	@Override
	public void insertProduct(Product product) throws Exception {
		productMapper.insertProduct(product);
	}

	@Override
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
	public Product getProduct(int productNo) throws Exception {
		return productMapper.getProduct(productNo);
	}

	@Override
	public void deleteProduct(int productNo) throws Exception {
		productMapper.deleteParts(productNo);
	}
	
	
	

	public void insertFoodCategory(String foodCategoryName) throws Exception {
		productMapper.insertFoodCategory(foodCategoryName);
	}

	public List<Foodcategory> getListFoodCategory() throws Exception {
		
		return  productMapper.getListFoodCategory();
	}

	public void deleteFoodCategory(int foodCategoryNo) throws Exception {
		productMapper.deleteFoodCategory(foodCategoryNo);		
	}

	
	
	@Override
	public void insertReview(Review review) throws Exception {
		productMapper.insertReview(review);
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
		int totalCount = productMapper.getTotalReviewCount(search);

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
		// TODO Auto-generated method stub
		return productMapper.insertParts(parts);
	}

	@Override
	public Parts getParts(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.getParts(map);
	}

	@Override
	public int updateParts(Parts parts) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.updateParts(parts);
	}
	
	@Override
	public int deleteParts(int no) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.deleteParts(no);
	}

	@Override
	public Map<String, Object> getListParts(Search search) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		map.put("list", productMapper.getListParts(map));
		map.put("totalCount", productMapper.getTotalPartsCount(map));
		
		return map;
	}
	
	// ProductParts 관련	
	@Override
	public int insertProudctParts(List<Parts> list) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.insertProudctParts(list);
	}

	@Override
	public List<Parts> getProductParts(int productNo) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.getProductParts(productNo);
	}

	@Override
	public int deleteProductParts(int productPartsNo) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.deleteProductParts(productPartsNo);
	}

	
	
	
	
	
	
	
}

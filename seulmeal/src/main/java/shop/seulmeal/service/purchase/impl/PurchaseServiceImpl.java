package shop.seulmeal.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.mapper.PurchaseMapper;
import shop.seulmeal.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	private PurchaseMapper purchaseMapper;
	
	public PurchaseServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	
	//커스터마이징재료 
	@Override
	public int insertMinusParts(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return purchaseMapper.insertMinusParts(map);
	}
	
	@Override
	public int insertPlusParts(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return purchaseMapper.insertPlusParts(map);
	}

	@Override 
	public CustomParts getCustomParts(int customPartsNo) {
		// TODO Auto-generated method stub
		return purchaseMapper.getCustomParts(customPartsNo);
	}

	@Override
	public List<CustomParts> getListCustomParts(int customProductNo) {
		// TODO Auto-generated method stub
		
		return purchaseMapper.getListCustomParts(customProductNo);
	}

	@Override
	public int deleteCustomParts(int customProductNo) {
		// TODO Auto-generated method stub
		return purchaseMapper.deleteCustomParts(customProductNo);
	}
	
	
	//커스터마이징상품 
	@Override
	public int insertCustomProduct(CustomProduct customProduct) {
		// TODO Auto-generated method stub
		return purchaseMapper.insertCustomProduct(customProduct);
	}

	@Override
	public CustomProduct getCustomProduct(int customProductNo) {
		// TODO Auto-generated method stub
		return purchaseMapper.getCustomProduct(customProductNo);
	}

	@Override
	public Map<String, Object> getListCustomProduct(Search search, String userId) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
	
		map.put("cproductList", purchaseMapper.getListCustomProduct(map));
		map.put("totalCount",purchaseMapper.getTotalCount(map));
		
		return map;
	}

	@Override
	public int updateCustomProduct(CustomProduct customProduct) {
		// TODO Auto-generated method stub
		return purchaseMapper.updateCustomProduct(customProduct);
	}

	@Override
	public int deleteCustomProduct(int customProductNo) {
		// TODO Auto-generated method stub
		return purchaseMapper.deleteCustomProduct(customProductNo);
	}
	
	//구매 
	@Override
	public int insertPurchase(Purchase purchase) {
		// TODO Auto-generated method stub
		return purchaseMapper.insertPurchase(purchase);
	}

	@Override
	public Purchase getPurchase(int purchaseNo) {
		// TODO Auto-generated method stub
		return purchaseMapper.getPurchase(purchaseNo);
	}

	@Override
	public Map<String, Object> getListPurchase(Search search, String userId) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=new HashMap<>();
		map.put("search", search);
		map.put("userId", userId);
		
		List<Purchase> list=purchaseMapper.getListPurchase(map);
		int totalCount=purchaseMapper.getTotalCount(map);
		
		map.put("purchaseList", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public int updatePurchaseCode(Purchase purchase) {
		// TODO Auto-generated method stub
		return updatePurchaseCode(purchase);
	}

	@Override
	public int deletePurchase(Purchase purchase) {
		// TODO Auto-generated method stub
		return purchaseMapper.deletePurchase(purchase);
	}

}

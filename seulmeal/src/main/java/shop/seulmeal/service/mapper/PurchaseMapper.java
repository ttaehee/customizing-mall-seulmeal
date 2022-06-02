package shop.seulmeal.service.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.common.Search;

import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Purchase;

@Mapper
public interface PurchaseMapper {
	
	//커스터마이징재료 추가 
	public int insertCustomParts(List<CustomParts> list);
	
	//커스터마이징상재료 상세 
	public CustomParts getCustomParts(int customPartsNo);

	//커스터마이징재료 리스트
	public List<CustomParts> getListCustomParts(Map<String, Object> map);
	
	//커스터마이징재료 삭제 
	public int deleteCustomParts(CustomParts customParts);
	
	
	//커스터마이징상품 추가 
	public int insertCustomProduct(CustomProduct customProduct);
	
	//커스터마이징상품 상세 
	public CustomProduct getCustomProduct(int customProductNo);
	
	//커스터마이징상품 리스트(장바구니)
	public List<CustomProduct> getListCustomProduct();
	
	//커스터마이징상품 수정(구매번호추가)
	public int updateCustomProduct(CustomProduct customProduct);
	
	//커스터마이징상품 삭제(장바구니사용여부 수정)
	public int deleteCustomProduct(int customProductNo);
	
	
	//구매추가
	public int insertPurchase(Purchase purchase);
	
	//구매상세 
	public Purchase getPurchase(int purchaseNo);
	
	//구매내역리스트
	public List<Purchase> getListPurchase(Map map);
	
	//구매코드 변경 
	public int updatePurchaseCode(Purchase purchase);
	
	//구매내역 삭제 
	public int deletePurchase(Purchase purchase);
	
	//개수
	public int getTotalCount(Search search);

}

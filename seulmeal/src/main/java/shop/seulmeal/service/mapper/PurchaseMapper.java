package shop.seulmeal.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Purchase;

@Mapper
public interface PurchaseMapper {
	
	//커스터마이징상품 추가 
	public int insertCustomProduct(CustomProduct customProduct);
	
	//구매추가
	public int insertPurchase(Purchase purchase);
	
	//구매상세 
	public Purchase getPurchase(int purchaseNo);
	
	//구매내역리스트
	public List<Purchase> getListPurchase();
	
	//구매코드 변경 
	public int updatePurchase(Purchase purchase);
	
	//구매내역 삭제 
	public int deletePurchase(Purchase purchase);

}

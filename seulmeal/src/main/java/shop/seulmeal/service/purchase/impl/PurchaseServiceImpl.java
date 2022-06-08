package shop.seulmeal.service.purchase.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.CustomProduct;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.mapper.PurchaseMapper;
import shop.seulmeal.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	
	public static final String KEY = "3479616353644323";
	public static final String SECRET = "cbe3de64fe45c7f463b3635d100f3b778c1bb755d258dec8c9d4f22f77fb9e7093be3b1c11843648";
	
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
	public int updatePurchase(Purchase purchase) {
		// TODO Auto-generated method stub
		return purchaseMapper.updatePurchase(purchase);
	}

	@Override
	public int updatePurchaseCode(Purchase purchase) {
		// TODO Auto-generated method stub
		return updatePurchaseCode(purchase);
	}

	@Override
	public int deletePurchase(int purchaseNo) {
		// TODO Auto-generated method stub
		return purchaseMapper.deletePurchase(purchaseNo);
	}
	@Override
	//아임포트 인증(토큰)받아주는 함수
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String,String> m  =new HashMap<String,String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수
	public List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		
		Set<Entry<String,String>> entries = paramMap.entrySet();
		
		for(Entry<String,String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}	
	
	@Override
	// 결제취소
	public int cancelPayment(String token, String mid) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return -1;
		} else {
			System.err.println("환불성공");
			return 1;
		}
	}
	
	@Override
	// 아임포트 결제정보에서 amount 조회
	public String getAmount(String token, int mId) {
		String amount = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mId + "/paid");
		get.setHeader("Authorization", token);

		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			amount = resNode.get("amount").asText();
			System.out.println("======================amount : "+amount);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return amount;
	}

}

package shop.seulmeal.web.main;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.operation.OperationService;
import shop.seulmeal.service.product.ProductService;

@RestController
public class MainRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	private OperationService operationService;
	
	@Value("${operation.query.pageUnit}")
	int pageUnit;
	
	@Value("${operation.query.pageSize}")
	int pageSize;
	
	public MainRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@GetMapping("/api/main")
	public Map<String,Object> getMain(@RequestParam(required = false, defaultValue = "2") int currentPage) throws Exception {
		JSONObject json = new JSONObject();
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		Map<String,Object> map = productService.getListProduct(search);
		
		return map;
	}
	
	@GetMapping("/api/getDayStatistics/{month}")
	public Map<String,Object> getDayStatistics(@PathVariable int month){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("month",month);
		
		// user 일일 가입자수
		map.put("table", "users");		
		map.put("userDay",operationService.countAdminDay(map));
		
		// 구매 횟수
		map.put("table", "purchase");
		map.put("purchaseDay",operationService.countAdminDay(map));
		
		// 판매액
		map.put("option", "price");
		map.put("purchasePriceDay",operationService.countAdminDay(map));
		map.put("option", null);
		
		// 리뷰횟수
		map.put("table", "review");
		map.put("reviewDay",operationService.countAdminDay(map));
		
		// 문의 횟수
		map.put("table", "post");
		map.put("post_status", 3);
		map.put("queryDay",operationService.countAdminDay(map));
		
		// 게시판 글쓴 횟수
		map.put("post_status", 0);
		map.put("communityDay",operationService.countAdminDay(map));
		
		return map;
	}
}

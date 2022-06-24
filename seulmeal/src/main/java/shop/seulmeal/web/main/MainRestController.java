package shop.seulmeal.web.main;

import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.product.ProductService;

@RestController
public class MainRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
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

}

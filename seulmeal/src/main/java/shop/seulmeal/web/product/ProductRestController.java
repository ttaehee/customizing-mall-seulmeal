package shop.seulmeal.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.product.ProductService;

@RestController
@RequestMapping("/product/api/*")
public class ProductRestController {
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductRestController() {
		System.out.println(this.getClass());
	}	

	
	@PostMapping("insertParts")
	public Parts insertParts(@RequestBody Parts parts) throws Exception {
		System.out.println("재료 : "+ parts);
		
		productService.insertParts(parts);
		
		return parts;
	}
	
	@GetMapping("getPartsName/{name}")
	public Parts getPartsName(@PathVariable String name, Map<String, Object> map) throws Exception {
		map.put("name", name);
		Parts parts = productService.getParts(map);
		System.out.println(parts);
		return parts;
	}
	
	
	/* 상품 좋아요 / 좋아요 취소 */
	@GetMapping("updateLikeProduct/{productNo}")
	public JSONObject updateLikeProduct(@PathVariable int productNo, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("userId", user.getUserId());
		
		String result = productService.updateLikeProduct(map);
		Product product =productService.getProduct(productNo);
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		json.put("likeCount", product.getLikeCount());
		return json;
	}
	
	@PostMapping("insertFoodCategory")
	public Foodcategory insertFoodcategory(@RequestBody Foodcategory foodcategory) throws Exception {
		
		productService.insertFoodCategory(foodcategory.getName());
		System.out.println(foodcategory);
		return foodcategory;
	}
	
}

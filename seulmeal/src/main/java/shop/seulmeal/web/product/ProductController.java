package shop.seulmeal.web.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@GetMapping("insertProduct")
	public String insertProduct(Model model) throws Exception {
				
		model.addAttribute("list",productService.getListFoodCategory());
		
		return "/product/insertProduct";
	}
	
	@PostMapping("insertProduct")
	@Transactional
	public String insertProduct(Product product,Foodcategory f, Model model,String partsNo, String partsName) throws Exception {
		product.setFoodCategory(f);
		System.out.println(product);
		productService.insertProduct(product);
		System.out.println(partsNo);
		System.out.println(partsName);
		
		List<Parts> list = new ArrayList<Parts>();
		String[] no = partsNo.split(",");
		String[] name = partsName.split(",");
		
		
		for(int i=0; i<no.length; i++) {
			Parts parts = new Parts();
			parts.setPartsNo(new Integer(no[i]));
			parts.setName(name[i]);
			parts.setProductNo(product.getProductNo());
			System.out.println(parts);
			list.add(parts);
		}
		
		int r = productService.insertProudctParts(list);
		
		if(r == no.length) {
			System.out.println("성공");
		}
		
		System.out.println("상품 : "+product);
		return "";
	}
	
	@GetMapping("getProduct/{prodNo}")
	public String getProduct(@PathVariable int prodNo, Model model) throws Exception {
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product",product);
		return "/product/getProduct";
	}
}

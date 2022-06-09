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

import shop.seulmeal.common.Page;
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
	
	int pageUnit = 5;	
	int pageSize = 5;
	
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
		List<Parts> list =productService.getProductParts(product.getProductNo());
		product.setParts(list);
		
		model.addAttribute("product",product);
		return "/product/getProduct";
	}
	
	@GetMapping(value = {"getListProduct/{searchCondition}",
						"getListProduct"})
	public String getListProduct(Model model,Search search, @PathVariable(required = false) String currentPage, @PathVariable(required = false) String searchCondition) throws Exception {
		
		if(currentPage != null) {
			search.setCurrentPage(new Integer(currentPage));
		}
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchCondition(searchCondition);
		System.out.println(search);
		
		
		Map<String,Object> map = productService.getListProduct(search);
		List<Product> list = (List)map.get("list");
		List<Product> listr = new ArrayList();
		
		for (Product product : list) {
			List<Parts> listp =productService.getProductParts(product.getProductNo());
			product.setParts(listp);
			listr.add(product);
			System.out.println("product : "+product);
		}
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list",listr);
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("search",search);
		
		return "/product/listProduct";
	}
	
	@GetMapping(value = {"updateProduct/{productNo}"})
	public String updateProduct(@PathVariable int productNo, Model model) throws Exception {
		Product product = productService.getProduct(productNo);
		model.addAttribute("product", product);
		return "forward:/product/updateProduct/{productNo}";
	}
	
	@PostMapping(value = {"updateProduct/{productNo}"})
	public String updateProduct(@PathVariable int productNo, Product product) throws Exception {
		productService.updateProduct(product);
		return "redirect:/product/getProduct/"+productNo;
	}
	
}

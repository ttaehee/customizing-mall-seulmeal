package shop.seulmeal.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Foodcategory;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Review;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	int pageUnit = 5;
	int pageSize = 5;

	public ProductController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}


	@GetMapping("insertProduct")
	public String insertProduct(Model model) throws Exception {

		model.addAttribute("list", productService.getListFoodCategory());

		return "/product/insertProduct";
	}

	@PostMapping("insertProduct")
	@Transactional
	public String insertProduct(Product product, Foodcategory f, Model model, String partsNo, String partsName)
			throws Exception {
		product.setFoodCategory(f);
		productService.insertProduct(product);

		List<Parts> list = new ArrayList<Parts>();
		String[] no = partsNo.split(",");
		String[] name = partsName.split(",");

		for (int i = 0; i < no.length; i++) {
			Parts parts = new Parts();
			parts.setPartsNo(new Integer(no[i]));
			parts.setName(name[i]);
			parts.setProductNo(product.getProductNo());
			System.out.println(parts);
			list.add(parts);
		}

		int r = productService.insertProudctParts(list);

		if (r == no.length) {
			System.out.println("성공");
		}

		System.out.println("상품 : " + product);
		return "redirect:/product/getProduct/"+product.getProductNo();
	}

	@GetMapping("getProduct/{prodNo}")
	public String getProduct(@PathVariable(required = false) String currentPage, @PathVariable int prodNo, Search search, Model model) throws Exception {
		Product product = productService.getProduct(prodNo);
		List<Parts> list = productService.getProductParts(product.getProductNo());
		product.setParts(list);
		

		if (currentPage != null) {
			search.setCurrentPage(new Integer(currentPage));
		}
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println(search);
		
		search.setSearchSort(prodNo);

		Map<String, Object> map = productService.getListReview(search);
		List<Review> list0 = (List) map.get("list");
		List<Review> listr = new ArrayList();

		for (Review review : list0) {
			listr.add(review);
		}

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		model.addAttribute("review", listr);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("product", product);
		return "/product/getProduct";
	}

	@GetMapping(value = { "getListProduct/{searchCondition}", "getListProduct" })
	public String getListProduct(Model model, Search search, @PathVariable(required = false) String currentPage,
			@PathVariable(required = false) String searchCondition) throws Exception {

		if (currentPage != null) {
			search.setCurrentPage(new Integer(currentPage));
		}
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchCondition(searchCondition);
		System.out.println(search);

		Map<String, Object> map = productService.getListProduct(search);
		List<Product> list = (List) map.get("list");
		List<Product> listr = new ArrayList();

		for (Product product : list) {
			List<Parts> listp = productService.getProductParts(product.getProductNo());
			product.setParts(listp);
			listr.add(product);
			System.out.println("product : " + product);
		}

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		model.addAttribute("list", listr);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "/product/listProduct";
	}

	@GetMapping(value = { "updateProduct/{productNo}" })
	public String updateProduct(@PathVariable int productNo, Model model) throws Exception {
		model.addAttribute("product", productService.getProduct(productNo));
		model.addAttribute("list", productService.getListFoodCategory());
		System.out.println("GET : updateProduct");
		System.out.println(model.getAttribute("product"));
		return "/product/updateProduct";
	}

	@PostMapping(value = { "updateProduct/{productNo}" })
	public String updateProduct(@ModelAttribute Foodcategory f, @PathVariable int productNo, Product product) throws Exception {
		product.setProductNo(productNo);
		product.setFoodCategory(f);
		productService.updateProduct(product);
		System.out.println("POST : updateProduct");
		return "redirect:/product/getProduct/" + product.getProductNo();
	}
	
	@GetMapping(value = {"insertParts"} )
	public String insertParts(Parts parts, Model model) throws Exception {
		model.addAttribute(parts);
		return "/product/insertParts";
	}
	
	@PostMapping(value = {"insertParts"})
	public String insertParts(Parts parts) throws Exception {
		productService.insertParts(parts);
		return "redirect:/product/listParts";
	}
	
	@GetMapping(value = {"listParts"})
	public String getListParts(Model model, Search search, @PathVariable(required = false) String currentPage,
				@PathVariable(required = false) String searchCondition) throws Exception {

			if (currentPage != null) {
				search.setCurrentPage(new Integer(currentPage));
			}
			if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			search.setSearchCondition(searchCondition);
			System.out.println(search);

			Map<String, Object> map = productService.getListParts(search);
			List<Parts> list = (List) map.get("list");
			List<Parts> listr = new ArrayList();

			for (Parts parts : list) {
				listr.add(parts);
			}

			Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
					pageSize);

			model.addAttribute("list", listr);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);

			return "/product/listParts";
	}
	
	@GetMapping(value = {"updateParts/{partsNo}"})
	public String updateParts(@PathVariable int partsNo, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("partsNo", partsNo);
		
		model.addAttribute("parts", (Parts)productService.getParts(map));
		
		
		return "/product/updateParts";
	}
	
	@PostMapping(value = {"updateParts/{partsNo}"})
	public String updateParts(@PathVariable int partsNo, Parts parts) throws Exception {
		parts.setPartsNo(partsNo);
		productService.updateParts(parts);
		return "redirect:/product/listParts";
	}
	
	
	@GetMapping(value = {"listFoodCategory"})
	public String getListFoodCategory(Model model) throws Exception {

			List<Foodcategory> list = productService.getListFoodCategory();

			model.addAttribute("list", list);

			return "/product/listFoodCategory";
	}
	
	

	@GetMapping(value = { "insertReview/{productNo}" })
	public String insertReview(@PathVariable int productNo, HttpSession session, Model model) throws Exception {
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("product", (Product) productService.getProduct(productNo));
		return "/product/insertReview";
	}

	@PostMapping(value = { "insertReview/{productNo}" })
	public String insertReview(@PathVariable int productNo, HttpSession session, Review review) throws Exception {
		review.setUser((User) session.getAttribute("user"));
		review.setProduct((Product)productService.getProduct(productNo));
		
		productService.insertReview(review);
		
		return "redirect:/product/getProduct/"+productNo;
	}

	@GetMapping(value = { "updateReview/{reviewNo}" })
	public String updateReview(@PathVariable int reviewNo, Model model) throws Exception {
		Review review = productService.getReview(reviewNo);
		model.addAttribute("review", review);
		return "/product/updateReview";
	}

	@PostMapping(value = { "updateReview/{reviewNo}" })
	public String updateReview(@PathVariable int reviewNo, Review review) throws Exception {
		productService.updateReview(review);
		return "redirect:/product/getReview/" + reviewNo;
	}

	@GetMapping(value = { "getReview/{reviewNo}" })
	public String getReview(@PathVariable int reviewNo, Model model) throws Exception {
		Review review = productService.getReview(reviewNo);
		model.addAttribute("product", productService.getProduct(review.getProduct().getProductNo()));
		model.addAttribute("user", userService.getUser(review.getUser().getUserId()));

		model.addAttribute("review", review);
		return "/product/getReview";
	}

	
	
}
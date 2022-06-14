package shop.seulmeal.web.community;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Report;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.CommunityMapper;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@Autowired
	private UserService userService;

	@Autowired
	private ProductService productService;

	@Autowired
	private AttachmentsService attachmentsService;

	@Autowired
	private CommunityMapper communityMapper;

	int pageUnit = 5;
	int pageSize = 5;

	// C
	public CommunityController() {
		System.out.println(this.getClass());
	}

	@GetMapping("updateCommunityProfileImageModal")
	public String modalTest() {
		return "community/updateCommunityProfileImageModal";
	}
	
	
	// M
	// 무한스크롤
	@GetMapping("/communityMain") // o
//	@ResponseBody
	public String communityMain(@RequestParam(required = false) String searchKeyword,
			@RequestParam(required = false) String searchCondition, Model model, HttpSession session) throws Exception {

		// 1. communityService.getListPost();
		// 2. productService.getListProduct() 추천밀키트 리스트

		System.out.println("//////////////" + session.getAttribute("user"));

		// 게시글
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		search.setSearchKeyword(searchKeyword);
		search.setSearchCondition(searchCondition);
		Map<String, Object> map = communityService.getListPost(search, null); // 모든 게시글

		// product
		Search productSearch = new Search();
		productSearch.setCurrentPage(1);
		productSearch.setPageSize(3);
		Map<String, Object> productMap = productService.getListProduct(productSearch);

		model.addAttribute("postList", (List<Post>) map.get("postList"));
		model.addAttribute("productList", (List<Product>) productMap.get("list"));

		// 팔로우, 팔로워 수
		String userId = ((User) session.getAttribute("user")).getUserId();

		Map<String, Object> map02 = new HashMap<>();
		map02.put("userId", userId);
		map02.put("relationUserId", userId);
		map02.put("relationStatus", "0");

		int followCnt = communityMapper.getRelationTotalCount(map02);
		int followerCnt = communityMapper.getFollowerTotalCount(map02);

		model.addAttribute("followCnt", followCnt);
		model.addAttribute("followerCnt", followerCnt);

		return "community/communityMain";
//		return map;
	}

	// Post
	@GetMapping("/insertPost") // oo
	public String insertPost() {
		return "community/insertCommunityPost";
	}

	@PostMapping("/insertPost") // x
	@Transactional(rollbackFor = Exception.class)
	public String insertPost(@ModelAttribute Post post, MultipartFile[] uploadfile, Attachments attachments,
			HttpSession session) throws IllegalStateException, IOException {

		System.out.println("/////////////" + post);
		System.out.println("/////////////" + uploadfile);

		post.setUser(((User) session.getAttribute("user")));
		System.out.println("///////////session 검증 : " + ((User) session.getAttribute("user")));
		communityService.insertPost(post);

		attachments.setPostNo(Integer.toString(post.getPostNo()));

		attachmentsService.insertAttachments(uploadfile, attachments);

		return "redirect:getPost/" + post.getPostNo();
	}

	@GetMapping("/getPost/{postNo}") // oo
//	@ResponseBody
	public String getPost(@PathVariable int postNo, Model model) {

		Post post = communityService.getPost(postNo);

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		Map<String, Object> map = communityService.getListcomment(search, postNo);

		model.addAttribute("post", post);
		model.addAttribute("commentList", (List<Comment>) map.get("commentList"));

		System.out.println(model);

//		return post;
		return "community/getCommunityPost";
	}

	@GetMapping("/updatePost/{postNo}") // o
	public String updatePost(@PathVariable int postNo, Model model) {

		Post post = communityService.getPost(postNo);

		model.addAttribute("post", post);

		return "community/updateCommunityPost";
	}

	@PutMapping("/updatePost/{postNo}") // o
	public String updatePost(@ModelAttribute Post post, @PathVariable int postNo) {

		communityService.updatePost(post);

		return "redirect:/community/getPost/" + postNo;
	}

	@PutMapping("/deletePost/{postNo}") // o
	public String deletePost(@PathVariable int postNo) {

		communityService.deletePost(postNo);

		return "community/communityMain";
	}

	// Post
	@PostMapping("/insertReportPost") // o
	public String insertReportPost(@ModelAttribute Report report) {

		communityService.insertReportPost(report);
		return "redirect:/community/getPost/" + report.getPostNo();
	}

	@GetMapping("/getListReportPost") // o
	public String getListReportPost(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") Integer currentPage,
			Model model) {

		System.out.println("type : " + currentPage.getClass().getTypeName());
		System.out.println("값 : " + currentPage);

		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		System.out.println("////////" + search);

		Map<String, Object> map = communityService.getListReportPost(search);
		Page resultPage = new Page(search.getCurrentPage(), (int) map.get("reportTotalCount"), pageUnit, pageSize);
		System.out.println("////////" + resultPage);

		model.addAttribute("reportList", (List<Report>) map.get("reportList"));
		model.addAttribute("resultPage", resultPage);
		// search 필요x

		return "/community/listCommunityReportPost";
	}

	@PutMapping("/deleteReportPost/{postNo}") // o
	public String deleteReportPost(@PathVariable int postNo) {

		communityService.deleteReportPost(postNo);
		return "redirect:/community/getListReportPost";
	}

	@GetMapping("getProfile/{userId}")
	// @ResponseBody
	public String getProfile(@PathVariable String userId, Model model) throws Exception {

		User user = userService.getProfile(userId);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);//

		Map map = communityService.getListPost(search, userId);
		model.addAttribute("postList", (List<Post>) map.get("postList"));

		// 팔로우, 팔로워 수
		Map<String, Object> map02 = new HashMap<>();
		map02.put("userId", userId);
		map02.put("relationUserId", userId);
		map02.put("relationStatus", "0");

		int followCnt = communityMapper.getRelationTotalCount(map02);
		int followerCnt = communityMapper.getFollowerTotalCount(map02);

		model.addAttribute("followCnt", followCnt);
		model.addAttribute("followerCnt", followerCnt);

		return "/community/getCommunityProfile";
	}

	@GetMapping("updateProfile") // oo
	public String updateProfile(HttpSession session, Model model) throws Exception {

		return "/community/updateCommunityProfile";
	}

	@PostMapping("updateProfile") // oo
	public String updateProfile(@ModelAttribute User user, String[] foodCategoryName, HttpSession session, Model model)
			throws Exception {

		System.out.println("////////" + foodCategoryName.length);
		
		if(foodCategoryName.length == 1) {
			user.setFoodCategoryName1(foodCategoryName[0]);
		}else if(foodCategoryName.length == 2) {
			user.setFoodCategoryName1(foodCategoryName[0]);
			user.setFoodCategoryName2(foodCategoryName[1]);
		}else {
			user.setFoodCategoryName1(foodCategoryName[0]);
			user.setFoodCategoryName2(foodCategoryName[1]);
			user.setFoodCategoryName3(foodCategoryName[2]);
		}


		user.setUserId(((User) session.getAttribute("user")).getUserId());
		userService.updateProfile(user);
		session.setAttribute("user", user);

		return "redirect:/community/getProfile/" + user.getUserId();
	}

}

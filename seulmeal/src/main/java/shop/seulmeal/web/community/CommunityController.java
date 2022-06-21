package shop.seulmeal.web.community;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Relation;
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
	// 게시판 메인
	@GetMapping("/communityMain") // o
	public String communityMain(@RequestParam(required = false) String searchKeyword,
			@RequestParam(required = false) String searchCondition, Model model, HttpSession session) throws Exception {
		
		// 비회원 게시판 사용불가
		if(session.getAttribute("user") == null) {
			return "user/login";
		}
		
		User loginUser = (User)session.getAttribute("user");
		List<Relation> relationList = communityService.getAllRelation(loginUser.getUserId());
		System.out.println("/////"+relationList);
		loginUser.setRelation(relationList);
		session.setAttribute("user", loginUser);

		// 전체 post
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);//pageSize
		search.setSearchKeyword(searchKeyword);
		search.setSearchCondition(searchCondition);
		Map<String, Object> postMap = communityService.getListPost(search, null); // 모든 게시글
		// 게시글 무한스크롤 -> maxPage 필요
		Page resultPage = new Page(1, (int) postMap.get("postTotalCount"), pageUnit, pageSize);
		System.out.println("//postTotalC:"+ postMap.get("postTotalCount"));
		
		
		Map<String, Object> attachMap = new HashMap<>();
		List<Post> postList = (List<Post>) postMap.get("postList");
		List<Attachments> attachmentList = new ArrayList<>();

		for(Post post : postList) {
			attachMap.put("postNo", post.getPostNo());
			post.setAttachments(attachmentsService.getAttachments(attachMap));
			
			// 닉네임없는 유저, id를 닉네임으로 저장
			if(post.getUser().getNickName() == null) {
				post.getUser().setNickName(post.getUser().getUserId());
			}
			
			// 프로필이미지 없는 유저, 기본이미지로 저장
			if(post.getUser().getProfileImage()==null) {
				post.getUser().setProfileImage("default_profile.jpg");
			}
			
			if(post.getAttachments() == null) {
				
				if(post.getContent().length() > 200) {
					post.setShortContent(post.getContent().substring(0, 201));					
				}else {
					post.setShortContent(post.getContent());
				}
			}else {
				
				if(post.getContent().length() > 50) {
					post.setShortContent(post.getContent().substring(0, 51));					
				}else {
					post.setShortContent(post.getContent());
				}
			}			
		}
		
		/* product
		Search productSearch = new Search();
		productSearch.setCurrentPage(1);
		productSearch.setPageSize(3);
		Map<String, Object> productMap = productService.getListProduct(productSearch);
		*/

		// 팔로우, 팔로워 목록 및 count
		String userId = ((User) session.getAttribute("user")).getUserId();

		Map<String, Object> followMap = communityService.getListFollow(null, userId, "0");
		Map<String, Object> followerMap = communityService.getListFollower(null, userId);
		
		// 차단유저 목록
		List<Relation> blockList = (List<Relation>)communityService.getListBlock(null, userId, "1").get("blockList");
		
		//model
		model.addAttribute("postList", postList);
		model.addAttribute("resultPage",resultPage);
		//model.addAttribute("productList", (List<Product>) productMap.get("list"));
		model.addAttribute("followMap", followMap);
		model.addAttribute("followerMap", followerMap);
		model.addAttribute("blockList", blockList);

		return "community/communityMain";
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
		
		// 첨부파일 없을 경우, 유효성 체크
		if(uploadfile.length > 1) {
			attachments.setPostNo(Integer.toString(post.getPostNo()));
			attachmentsService.insertAttachments(uploadfile, attachments);
		}

		return "redirect:getPost/" + post.getPostNo();
	}

	@GetMapping("/getPost/{postNo}") // oo
	public String getPost(@PathVariable int postNo, Model model, HttpSession session) {
		
		
		// 해당 post
		Post post = communityService.getPost(postNo);
		System.out.println("//////"+post.getContent());
		
		// 타인 게시글 조회시에만, 조회수 증가 
		if(!((User)session.getAttribute("user")).getUserId().equals(post.getUser().getUserId()) ) {
			communityService.postViewsUp(postNo);
		}

		// 해당 post의 첨부파일 
		Map<String,Object> map02 = new HashMap<>();
		map02.put("postNo", postNo);
		List<Attachments> attachmentList =  attachmentsService.getAttachments(map02);

		// 댓글 목록 (무한스크롤 -> maxPage 필요)
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		Map<String, Object> map = communityService.getListcomment(search, postNo);
		Page resultPage = new Page(1, (int) map.get("commentTotalCount"), pageUnit, pageSize);
		System.out.println("///"+map.get("commentTotalCount"));
		System.out.println("///"+resultPage);

		// model
		model.addAttribute("post", post);
		model.addAttribute("attachmentList", attachmentList);
		model.addAttribute("commentList", (List<Comment>) map.get("commentList"));
		model.addAttribute("resultPage",resultPage);

		System.out.println("////////"+attachmentList);
		return "community/getCommunityPost";
	}

	@GetMapping("/updatePost/{postNo}") // o
	public String updatePost(@PathVariable int postNo, Model model) {

		// post 가져오기
		Post post = communityService.getPost(postNo);
		
		// 첨부파일 가져오기
		Map<String,Object> map = new HashMap<>();
		map.put("postNo", postNo);
		
		// post 도메인에 첨부파일 넣기
		post.setAttachments(attachmentsService.getAttachments(map));
		
		//model
		model.addAttribute("post", post);

		return "community/updateCommunityPost";
	}

	@PostMapping("/updatePost/{postNo}") // o
	public String updatePost(@ModelAttribute Post post, @PathVariable int postNo, MultipartFile[] uploadfile, Attachments attachments, String deleteAttachmentNo, String deleteAttachmentName) throws IllegalStateException, IOException {
		System.out.println("/////////////"+uploadfile);
		
		// db와 폴더 첨부파일 삭제
		attachmentsService.deleteAttachments(deleteAttachmentNo, deleteAttachmentName);

		
		// 새로 추가한 첨부파일 등록, 유효성 체크
		if(uploadfile != null ) {
			attachments.setPostNo(Integer.toString(postNo));
			attachmentsService.insertAttachments(uploadfile, attachments);
		}
		
		// post 업데이트
		communityService.updatePost(post);
		
		return "redirect:/community/getPost/" + postNo;
	}

	@GetMapping("/deletePost/{postNo}") // o
	public String deletePost(@PathVariable int postNo) {

		communityService.deletePost(postNo);

		return "redirect:/community/communityMain";
	}

	// Post
	@PostMapping("/insertReportPost") // o
	public String insertReportPost(@ModelAttribute Report report) {

		System.out.println("//////: "+ report);
		
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
	public String getProfile(@PathVariable String userId, Model model, HttpSession session) throws Exception {

		// default : 타인 게시글
		boolean isMine = false;
		
		// 본인 게시글 
		if(((User)session.getAttribute("user")).getUserId().equals(userId)){
			isMine = true; 
		}
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(2);

		Map<String,Object> postMap = communityService.getListPost(search, userId);
		
		Page resultPage = new Page(1, (int) postMap.get("postTotalCount"), pageUnit, pageSize);
		
		// 팔로우, 팔로워 목록 및 count
		Map<String, Object> followMap = communityService.getListFollow(null, userId, "0");
		Map<String, Object> followerMap = communityService.getListFollower(null, userId);
		
		// 차단유저 목록
		Map<String,Object> blockMap = communityService.getListBlock(null, userId, "1");
		
		Map<String, Object> attachMap = new HashMap<>();
		List<Post> postList = (List<Post>) postMap.get("postList");
		List<Attachments> attachmentList = new ArrayList<>();

		for(Post post : postList) {
			attachMap.put("postNo", post.getPostNo());
			post.setAttachments(attachmentsService.getAttachments(attachMap));
			
			// 닉네임없는 유저, id를 닉네임으로 저장
			if(post.getUser().getNickName() == null) {
				post.getUser().setNickName(post.getUser().getUserId());
			}
			
			// 프로필이미지 없는 유저, 기본이미지로 저장
			if(post.getUser().getProfileImage()==null) {
				post.getUser().setProfileImage("default_profile.jpg");
			}
			
			if(post.getAttachments() == null) {
				
				if(post.getContent().length() > 200) {
					post.setShortContent(post.getContent().substring(0, 201));					
				}else {
					post.setShortContent(post.getContent());
				}
			}else {
				
				if(post.getContent().length() > 50) {
					post.setShortContent(post.getContent().substring(0, 51));					
				}else {
					post.setShortContent(post.getContent());
				}
			}			
		}
				
		//model
		model.addAttribute("isMine", isMine);
		model.addAttribute("profileUser",userService.getProfile(userId));
		model.addAttribute("postList", (List<Post>)postMap.get("postList"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("followMap", followMap);
		model.addAttribute("followerMap", followerMap);
		model.addAttribute("blockMap", blockMap);

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

package shop.seulmeal.web.community;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Like;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Relation;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.CommunityMapper;
import shop.seulmeal.service.user.UserService;

@RestController
@RequestMapping("/community/api/*")
public class CommunityRestController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private AttachmentsService attachmentsService;
	
	@Autowired
	private UserService userService;

	int pageUnit = 5;
	int pageSize = 5;

	public CommunityRestController() {
		System.out.println(this.getClass());
	}

	/*
	@GetMapping("/communityMain") // o
	public Map<String,Object> communityMain(@RequestParam(required = false) String searchKeyword,
			@RequestParam(required = false) String searchCondition, HttpSession session) throws Exception {

		// 1. communityService.getListPost();
		// 2. productService.getListProduct() 추천밀키트 리스트

		System.out.println("//////////////" + session.getAttribute("user"));

		// 전체 post
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(13);
		search.setSearchKeyword(searchKeyword);
		search.setSearchCondition(searchCondition);
		Map<String, Object> map = communityService.getListPost(search, null); // 모든 게시글
		
		Page resultPage = new Page(search.getCurrentPage(), (int) map.get("postTotalCount"), pageUnit, search.getPageSize());


		Map<String, Object> map03 = new HashMap<>();

		List<Post> postList = (List<Post>) map.get("postList");
		
		List<Attachments> attachmentList = new ArrayList<>();

		for(Post post : postList) {
			map03.put("postNo", post.getPostNo());
			post.setAttachments(attachmentsService.getAttachments(map03));  
		}
		
		System.out.println("//////////////////"+postList);
		
		
//		product
//		Search productSearch = new Search();
//		productSearch.setCurrentPage(1);
//		productSearch.setPageSize(3);
//		Map<String, Object> productMap = productService.getListProduct(productSearch);
		

		// 팔로우, 팔로워 수
		String userId = ((User) session.getAttribute("user")).getUserId();

		Map<String, Object> map02 = new HashMap<>();
		map02.put("userId", userId);
		map02.put("relationUserId", userId);
		map02.put("relationStatus", "0");

		int followCnt = communityMapper.getRelationTotalCount(map02);
		int followerCnt = communityMapper.getFollowerTotalCount(map02);

		// 차단유저 목록
		List<Relation> blockList = (List<Relation>)communityService.getListBlock(null, userId, "1").get("blockList");
		
		
		Map<String,Object> resultMap = new HashMap<>();
		
		//model
		resultMap.put("postList", postList);
		resultMap.put("resultPage",resultPage);
		//model.addAttribute("productList", (List<Product>) productMap.get("list"));
		resultMap.put("followCnt", followCnt);
		resultMap.put("followerCnt", followerCnt);
		resultMap.put("blockList", blockList);

		return resultMap;
	}
*/
	
	// 무한스크롤
	@GetMapping("getListPost") // oo
	public List<Post> getListPost(@RequestParam(required = false, defaultValue = "2") int currentPage,
			@RequestParam(required = false) String searchKeyword, @RequestParam(required = false) String searchOption ,@RequestParam(required = false) String userId) {
		
		System.out.println("RestC : CurrentP : "+ currentPage);
		
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);
		search.setSearchCondition(searchOption);

		// 메인 게시글 : userId = null (searchKeyword, searchOption 존재)
		// 내 프로필 게시글 : userId = session (searchKeyword, searchOption 존재x)
		// 타 프로필 게시글 : userId  (위와 동일)
		Map<String, Object> map = communityService.getListPost(search, userId);
		//map.put("search", search);
		
		Map<String, Object> attachMap = new HashMap<>();
		List<Post> postList = (List<Post>)map.get("postList");
				
		for(Post post : postList) {
			attachMap.put("postNo", post.getPostNo());
			post.setAttachments(attachmentsService.getAttachments(attachMap));
			
			// 닉네임없는 유저, id를 닉네임으로 저장
			if(post.getUser().getNickName() == null) {
				post.getUser().setNickName(post.getUser().getUserId());
			}
			
			// 프로필이미지 없는 유저, 기본이미지로 저장
			if(post.getUser().getProfileImage() == null) {
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
		System.out.println(("/////"+map.get("postTotalCount")));
		System.out.println("/////"+postList);
		return postList;
	}

	// 댓글 무한스크롤
	@GetMapping("getListComment/{postNo}") // oo
	public List<Comment> getListComment(@RequestParam(required = false, defaultValue = "2") int currentPage,
			@PathVariable int postNo) {

		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);

		Map<String, Object> map = communityService.getListcomment(search, postNo);
		
		return (List<Comment>)map.get("commentList");
	}
	
	//Comment
	@PostMapping("/insertComment") // oo
	public Comment insertComment(@RequestBody Comment comment, HttpSession session) {

		User user = (User)session.getAttribute("user");
		comment.setUser(user);
	
		communityService.insertComment(comment);
		Comment dbComment = communityService.getComment(comment.getCommentNo());
		
		return dbComment; 

	}

	@PostMapping("/deleteComment/{commentNo}") // ^o
	public void deleteComment(@PathVariable int commentNo) {
		communityService.deleteComment(commentNo);
	}
	
	/*
	@GetMapping("/updateComment/{commentNo}") // oo
	public Comment updateComment(@PathVariable int commentNo) {
		
		return communityService.getComment(commentNo); 
	}*/
	/*
	@PatchMapping("/updateComment/{commentNo}") // o^
	public Comment updateComment(@PathVariable int commentNo, @RequestBody Comment comment) {
		
		comment.setCommentNo(commentNo);
		communityService.updateComment(comment);
		
		return communityService.getComment(commentNo); 
	}*/
	
	

	@PostMapping("insertLike/{postNo}") // oo
	public Map<String,Integer> insertLike(@PathVariable String postNo, HttpSession session) {

		Like like = new Like();
		like.setPostNo(Integer.parseInt(postNo));
		//like.setUserId(userId);
		like.setUserId(((User)session.getAttribute("user")).getUserId());

		Map<String,Integer> map = new HashMap<>();
		int result = communityService.insertLike(like);
		Post post = communityService.getLikePost(Integer.parseInt(postNo));
		
		
		if(result == 1) {
			map.put("좋아요", post.getLikeCount());
			return map;
		}else{
			map.put("좋아요 취소", post.getLikeCount());
			return map;			
		}
	}
/*
	@PostMapping("deleteLike/{postNo}") // oo
	public Post deleteLike(@PathVariable String postNo, HttpSession session) {

		Like like = new Like();

		like.setPostNo(Integer.parseInt(postNo));
		like.setUserId(((User)session.getAttribute("user")).getUserId());

		// 좋아요 취소
		communityService.deleteLike(like);

		// 좋아요 취소한 게시글 좋아요 수 return
		Post post = communityService.getLikePost(Integer.parseInt(postNo));

		System.out.println("/////////" + post);
		
		return post;
	}
*/
	@PostMapping("insertFollow/{relationUserId}") // o
	public Map<String,Object> insertFollow(@PathVariable String relationUserId, HttpSession session) {

		Relation relation = new Relation();
		relation.setRelationStatus("0");
		User user = (User) session.getAttribute("user");
		relation.setUserId(user.getUserId());

		User relationUser = new User();
		relationUser.setUserId(relationUserId);
		relation.setRelationUser(relationUser);
		
		Map<String,Object> followerMap = communityService.insertFollow(relation);
		
		// 1. msg(팔로우, 팔로우 취소), 2. followerTotalCount
		return followerMap;
	}
	
	@PostMapping("deleteFollow/{relationUserId}") // o
	public Map<String,Object> deleteFollow(@PathVariable String relationUserId, HttpSession session) {

		System.out.println("relationUserId: "+ relationUserId);
		
		Relation relation = new Relation();
		relation.setRelationStatus("0");
		relation.setUserId(((User)session.getAttribute("user")).getUserId());
		
		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);

		Map<String,Object> resultMap = communityService.deleteFollow(relation);
			
		// 1.userFollowCnt
		// 2.relationUserFollowerCnt
		return resultMap;
	}

	@GetMapping("getListFollow") // oo
	public List<Relation> getListFollow(@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchKeyword, HttpSession session) {

		Search search = new Search();

		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);

		String userId = ((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = communityService.getListFollow(null, userId, "0");//검색없는 	전체목록

		return (List<Relation>) map.get("followList");
	}

	@GetMapping("getListFollower") // oo
	public List<Relation> getListFollower(@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchKeyword,HttpSession session) {

		Search search = new Search();

		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);

		String relationUserId = ((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = communityService.getListFollower(search, relationUserId);

		return (List<Relation>) map.get("followerList");
	}

	@PostMapping("insertBlock/{relationUserId}") // oo
	public int insertBlock(@PathVariable String relationUserId, HttpSession session) throws Exception {

		Relation relation = new Relation();
		relation.setRelationStatus("1");
		relation.setUserId(((User) session.getAttribute("user")).getUserId());

		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);

		int result = communityService.insertBlock(relation);
		System.out.println("/////////"+result);
		
		return result;
		/*
		if (communityService.insertBlock(relation) == 1) {
			userService.updateBlockCount(relationUserId);
			List<Relation> list = ((User) session.getAttribute("user")).getRelation();
			list.add(relation);
		}*/
	}

	@PostMapping("deleteBlock/{relationUserId}")
	public int deleteBlock(@PathVariable String relationUserId, HttpSession session) {

		Relation relation = new Relation();
		relation.setRelationStatus("1");
		relation.setUserId(((User) session.getAttribute("user")).getUserId());
		
		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);
		
		int result = communityService.deleteBlock(relation);
		System.out.println("/////////"+result);
		
		return result;
	}
	
	
	@GetMapping("getListBlock") // oo
	public List<Relation> getListBlock(@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchKeyword, HttpSession session) {

		Search search = new Search();

		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);

		String userId = ((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = communityService.getListBlock(search, userId, "1");

		return (List<Relation>) map.get("blockList");
	}

	// 프로필 이미지 저장 및 변경	// oo
	@PostMapping("updateProfileImage")
	public User updateProfileImage(MultipartFile imageFile, HttpSession session) throws Exception {

		String imageFilePath = null;
//		String absolutePath = new File("").getAbsolutePath()+"\\";
		String path = System.getProperty("user.dir")+"/src/main/webapp/resources/attachments/profile_image";
		File file = new File(path);

		User user = (User)session.getAttribute("user");

		if (!file.exists()) {
			file.mkdirs();
		}

		if (!imageFile.isEmpty()) {
			String contentType = imageFile.getContentType();
			String originalFileExtension = null;

			if (contentType.contains("image/jpeg")) {
				originalFileExtension = ".jpg";
			} else if (contentType.contains("image/png")) {
				originalFileExtension = ".png";
			}

			imageFilePath = path + "/" + user.getUserId() + "_profile" + originalFileExtension;
			String imageFileName = user.getUserId() + "_profile" + originalFileExtension;
			System.out.println("//////userId: " + user.getUserId());
			System.out.println("//////imageFilePath: " + imageFilePath);
			System.out.println("//////originalFileExtension: " + originalFileExtension);
			System.out.println("//////getOriginalFilename(): " + imageFile.getOriginalFilename());

			// 이미지 파일 로컬에 저장
			file = new File(imageFilePath);
			imageFile.transferTo(file);

			// 저장한 이미지 파일을 User session 저장 또는 수정
			user.setProfileImage(imageFileName);

			// 변경된 session의 유저정보를 db에 반영
			userService.updateProfile(user);

		}
		return user;

	}
	
	// 프로필 이미지 삭제		// oo
	@PostMapping("deleteProfileImage")
	public ResponseEntity<User> deleteProfileImage(HttpSession session) throws Exception {

		User user = (User)session.getAttribute("user");

		// 프로필 이미지 없을 경우, 404에러 리턴
		if(user.getProfileImage()==null) {
			return ResponseEntity.notFound().build();			
		}
		
		// 프로필 이미지 있을 경우, 해당경로에 있는 jpg 파일 삭제
		String path = System.getProperty("user.dir")+"/src/main/webapp/resources/attachments/profile_image";
		String imageFileName = user.getProfileImage();
		String imageFilePath = path + "/" + imageFileName; 
		
		File file = new File(imageFilePath);

		if (file.exists()) {
			file.delete();
			System.out.println("파일 삭제 완료");
		} else {
			System.out.println("파일 존재 x");
		}

		// 유저가 session에 가지고 있는 profileImage 삭제
		user.setProfileImage(null);
		session.setAttribute("user", user);

		// profileImage 삭제한 session의 유저정보를 db에 반영
		userService.updateProfile(user);

		return new ResponseEntity<User>(user, HttpStatus.OK);
	}

}

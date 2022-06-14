package shop.seulmeal.web.community;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Like;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Relation;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.user.UserService;

@RestController
@RequestMapping("/community/api/*")
public class CommunityRestController {

	@Autowired
	private CommunityService communityService;

	@Autowired
	private UserService userService;

	int pageUnit = 5;
	int pageSize = 5;

	public CommunityRestController() {
		System.out.println(this.getClass());
	}

	@GetMapping("getListPost") // oo
	public Map<String, Object> getListPost(@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchKeyword, @RequestParam(required = false) String userId) {

		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(1);
		search.setSearchKeyword(searchKeyword);

		Map<String, Object> map = communityService.getListPost(search, userId);
		map.put("search", search);

		return map;
	}

	@GetMapping("getListComment/{postNo}") // oo
	public Map<String, Object> getListComment(@RequestParam(required = false, defaultValue = "1") int currentPage,
			@PathVariable int postNo) {

		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);

		Map<String, Object> map = communityService.getListcomment(search, postNo);
		map.put("search", search);

		return map;
	}
	
	//Comment
	@PostMapping("/insertComment") // oo
	public Comment insertComment(@RequestBody Comment comment, HttpSession session) {

		System.out.println("/////////"+comment);
		User user = (User)session.getAttribute("user");
		comment.setUser(user);
		
		communityService.insertComment(comment);
		System.out.println("/////////"+comment);
		return communityService.getComment(comment.getCommentNo()); 

	}
	
	@GetMapping("/updateComment/{commentNo}") // oo
	public Comment updateComment(@PathVariable int commentNo) {
		
		return communityService.getComment(commentNo); 
	}
	
	@PatchMapping("/updateComment/{commentNo}") // o^
	public Comment updateComment(@PathVariable int commentNo, @RequestBody Comment comment) {
		
		comment.setCommentNo(commentNo);
		communityService.updateComment(comment);
		
		return communityService.getComment(commentNo); 
	}
	
	@PostMapping("/deleteComment/{commentNo}") // ^o
	public void deleteComment(@PathVariable int commentNo) {
		System.out.println("///////////"+commentNo);
		
		communityService.deleteComment(commentNo);
	}
	

	@PostMapping("insertLike/{postNo}") // oo
	public ResponseEntity<Post> insertLike(@PathVariable String postNo, HttpSession session) {

		Like like = new Like();
		like.setPostNo(Integer.parseInt(postNo));
		like.setUserId(((User)session.getAttribute("user")).getUserId());

		// 좋아요
		if(communityService.insertLike(like) == -1) {
			return ResponseEntity.badRequest().build();
		}

		// 좋아요한 게시글의 좋아요 개수를 return 하기 위함 (status = '0'인 게시글만 select)
		Post post = communityService.getLikePost(Integer.parseInt(postNo));

		System.out.println("/////////post.getLikeCount():" + post.getLikeCount());

		return new ResponseEntity<Post>(post, HttpStatus.OK);
	}

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

	@PostMapping("insertFollow/{relationUserId}") // o
	public int insertFollow(@PathVariable String relationUserId, HttpSession session) {

		Relation relation = new Relation();
		relation.setRelationStatus("0");
		User user = (User) session.getAttribute("user");
		relation.setUserId(user.getUserId());

		User relationUser = new User();
		relationUser.setUserId(relationUserId);
		relation.setRelationUser(relationUser);
		
		int followCnt = communityService.insertFollow(relation);
		
		return followCnt;
	}
	
	@DeleteMapping("deleteFollow/{relationUserId}") // o
	public int deleteFollow(@PathVariable String relationUserId, HttpSession session) {

		Relation relation = new Relation();
		relation.setRelationStatus("0");
		relation.setUserId(((User)session.getAttribute("user")).getUserId());
		
		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);

		int followCnt = communityService.deleteFollow(relation);
		
		return followCnt;
	}

	@GetMapping("getListFollow") // oo
	public List<Relation> getListFollow(@RequestParam(required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchKeyword, HttpSession session) {

		Search search = new Search();

		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);

		String userId = ((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = communityService.getListFollow(search, userId, "0");

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
	public void insertBlock(@PathVariable String relationUserId, HttpSession session) {

		Relation relation = new Relation();
		relation.setRelationStatus("1");
		relation.setUserId(((User) session.getAttribute("user")).getUserId());

		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);

		if (communityService.insertBlock(relation) == 1) {
			List<Relation> list = ((User) session.getAttribute("user")).getRelation();
			list.add(relation);
		}
	}

	@DeleteMapping("deleteBlock/{relationUserId}")
	public void deleteBlock(@PathVariable String relationUserId, HttpSession session) {

		Relation relation = new Relation();
		relation.setRelationStatus("1");
		relation.setUserId(((User) session.getAttribute("user")).getUserId());
		
		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);

		if (communityService.deleteBlock(relation) == 1) {
			List<Relation> list = ((User) session.getAttribute("user")).getRelation();
			list.remove(relation);
		}
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

package shop.seulmeal.web.community;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Like;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Relation;
import shop.seulmeal.service.domain.User;

@RestController
@RequestMapping("/community/api/*")
public class CommunityRestController {
	
	@Autowired
	private CommunityService communityService;
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@GetMapping("getListPost")	// oo
	public List<Post> getListPost(@RequestParam(required = false, defaultValue = "1") int currentPage, @RequestParam(required = false) String searchKeyword, @RequestParam(required=false) String userId ){
		
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);
		
		Map<String,Object> map = communityService.getListPost(search, userId);
		List<Post> postList = (List<Post>)map.get("postList");
		
		//Page page = new Page();
		
		return postList;
	}
	
	@PostMapping("insertLike/{postNo}")	// oo
	public Post insertLike(@PathVariable int postNo, @RequestParam String userId) {
		
		Like like = new Like();
		
		like.setPostNo(postNo);
		like.setUserId(userId);
//		like.setUserId(((User)session.getAttribute("user")).getUserId());
		
		// 좋아요 
		communityService.insertLike(like);
		
		// 좋아요한 게시글의 좋아요 개수를 return 하기 위함 (status = '0'인 게시글만 select)
		Post post = communityService.getLikePost(postNo);
		
		System.out.println("/////////"+post);
		
		return post;
	}
	
	@PostMapping("deleteLike/{postNo}")	// oo
	public Post deleteLike(@PathVariable int postNo,@RequestParam String userId) {
		
		Like like = new Like();
		
		like.setPostNo(postNo);
		like.setUserId(userId);
//		like.setUserId(((User)session.getAttribute("user")).getUserId());
		
		// 좋아요 취소
		communityService.deleteLike(like);
		
		// 좋아요 취소한 게시글 좋아요 수 return 
		Post post = communityService.getLikePost(postNo);
		
		return post;
	}
	
	
	@PostMapping("insertFollow/{relationUserId}")  // o
	public void insertFollow(@PathVariable String relationUserId, HttpSession session) {
		
		Relation relation = new Relation();
		relation.setRelationStatus("0");
		relation.setUserId(((User)session.getAttribute("user")).getUserId());
		
		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);
		
		communityService.insertFollow(relation);
		
	}
	
	@GetMapping("getListFollow") // oo
	public List<Relation> getListFollow(@RequestParam(required = false, defaultValue = "1") int currentPage, @RequestParam(required = false) String searchKeyword, @RequestParam String userId) {
		
		Search search = new Search();
		
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);
		
//		String userId = ((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = communityService.getListFollow(search, userId, "0");
		
		
		return (List<Relation>)map.get("followList");
	}

	@GetMapping("getListFollower") // oo
	public List<Relation> getListFollower(@RequestParam(required = false, defaultValue = "1") int currentPage, @RequestParam(required = false) String searchKeyword,@RequestParam String relationUserId) {
		
		Search search = new Search();

		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchKeyword(searchKeyword);
		
//		String relationUserId = ((User)session.getAttribute("user")).getUserId();
		Map<String,Object> map = communityService.getListFollower(search, relationUserId);
		
		return (List<Relation>)map.get("followerList");
	}
	
	@DeleteMapping("deleteFollow/{relationNo}") // o 
	public void deleteFollow(@PathVariable int relationNo) {
		
		Relation relation = new Relation();
		relation.setRelationStatus("0");
		relation.setRelationNo(relationNo);
		
		communityService.deleteFollow(relation);
	}
	
	
	@PostMapping("insertBlock/{relationUserId}")
	public void insertBlock(@PathVariable String relationUserId, HttpSession session) {
				
		Relation relation = new Relation();
		relation.setRelationStatus("1");
		relation.setUserId(((User)session.getAttribute("user")).getUserId());
		
		User user = new User();
		user.setUserId(relationUserId);
		relation.setRelationUser(user);
		
		if(communityService.insertBlock(relation) == 1) {
			List<Relation> list = ((User)session.getAttribute("user")).getRelation();
			list.add(relation);			
		}
	}
	
	@DeleteMapping("deleteBlock/{relationNo}") 
	public void deleteBlock(@PathVariable int relationNo, HttpSession session) {
		
		Relation relation = new Relation();
		relation.setRelationStatus("1");
		relation.setRelationNo(relationNo);
		
		if(communityService.deleteBlock(relation) == 1) {
			List<Relation> list = ((User)session.getAttribute("user")).getRelation();
			list.remove(relation);
		}
	}
	
	
	
	

}

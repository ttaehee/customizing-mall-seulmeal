package shop.seulmeal.web.community;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
	
	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("insertLike/{postNo}")	// o
	public Post insertLike(@PathVariable int postNo, @RequestParam String userId) {
		
		Like like = new Like();
		
		like.setPostNo(postNo);
		like.setUserId(userId);
//		like.setUserId(((User)session.getAttribute("user")).getUserId());
		
		communityService.insertLike(like);
		Post post = communityService.getLikePost(postNo);
		
		System.out.println("/////////"+post);
		
		return post;
	}
	
	@RequestMapping("deleteLike/{postNo}")	// o
	public Post deleteLike(@PathVariable int postNo,@RequestParam String userId) {
		
		Like like = new Like();
		
		like.setPostNo(postNo);
		like.setUserId(userId);
//		like.setUserId(((User)session.getAttribute("user")).getUserId());
		
		communityService.deleteLike(like);
		Post post = communityService.getLikePost(postNo);
		
		return post;
	}
	
	
	@RequestMapping("insertFollow/{relationUserId}")
	public void insertFollow(@PathVariable String relationUserId, HttpSession session) {
		
		Relation relation = new Relation();
		relation.setUserId(((User)session.getAttribute("user")).getUserId());
		
		relation.setRelationUser(null);
		
		
	}
	
	public void deleteFollow() {
		
	}
	
	public void insertBlock() {
		
	}
	
	public void deleteBlock() {
		
	}
	
	
	
	

}

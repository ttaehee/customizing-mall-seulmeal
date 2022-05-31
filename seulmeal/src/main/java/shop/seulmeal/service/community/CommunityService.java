package shop.seulmeal.service.community;

import java.util.List;

import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;

public class CommunityService {

	
	// Post
	public int insertPost(Post post) {
		return 0;
	}
	
	public Post getPost(int postNo) {
		return null;
	}
	
	public List<Post> getListPost(){
		return null;
	}
	
	public int updatePost(int postNo, Post post) {
		return 0;
	}

	public int deletePost(int postNo) {
		return 0;
	}
	
	
	// Comment
	public int insertComment(Comment comment) {
		return 0;
	}
	
	public List<Comment> getListComment(int postNo) {
		return null;
	}
	
	public int updateComment(int commentNo, Comment comment) {
		return 0 ;
	}
	
	public int deleteComment(int commentNo) {
		return 0 ;
	}
	
	// report
	public int insertReportPost(int postNo) {//
		return 0;
	}
	
	public List<Post> getListReportPost(){
		return null;
	}
	
	public int deleteReportPost(int postNo) {
		return 0;
	}
	
	
	// follow
	public int insertFollow(String userId) {
		return 0;
	}
	
//	public List<Follow> getListFollow(){
//		return null;
//	}
//	
	public int deleteFollow(String userId) {
		return 0;
	}
	
	
	// like
	public int insertLike() {
		return 0;
	}
	
	public int deleteLike() {
		return 0;
	}
	
	
	
	
	
}

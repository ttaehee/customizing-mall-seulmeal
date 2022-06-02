package shop.seulmeal.service.community;

import java.util.List;
import java.util.Map;

import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Like;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Relation;
import shop.seulmeal.service.domain.Report;

public interface CommunityService {
	
	//Post
	public int insertPost();
	public Post getPost(int postNo);
	public List<Post> getListPost(Map<String,Object> map);
	public int updatePost(Post post);
	public int deletePost(int postNo);
	 
	//Comment
	public int insertComment(Comment comment);
	public List<Comment> getListComment(int postNo);//
	public int updateComment(Comment comment);
	public int deleteComment(int commentNo);// userId?
	
	//Report
	public int insertReportPost(Report report);
	public int deleteReportPost(int postNo);
	public List<Report> getListReportPost();//
	
	//Like
	public int insertLike(Like like);
	public int deleteLike(Like like);
	public int getPostLikeCount(int postNo);
	

	public int insertFollow(Relation relation);
	public List<String> getListFollow(String userId);//
	public List<String> getListFollower(String followingUserId);//
	public int deleteFollow(Relation relation);
	public int updateRelation(Relation relation);
	
	public int insertBlock(Relation relation);
	public List<String> getListBlock(String userId);//
	public int deleteBlock(Relation relation);
	
	//TestCode
	public int deletePostAll();
	public void deleteReportPostAll();
	public void deleteFollowAll();
	public void deleteBlockAll();	
	
}

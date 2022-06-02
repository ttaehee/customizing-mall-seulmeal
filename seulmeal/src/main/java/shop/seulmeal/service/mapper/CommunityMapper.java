package shop.seulmeal.service.mapper;

import java.util.List;
import java.util.Map;
import java.util.function.IntPredicate;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Like;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Relation;
import shop.seulmeal.service.domain.Report;

@Mapper
public interface CommunityMapper {
	
	//Post
	public int insertPost(Post post);
	public Post getPost(int postNo);
	public int postViewsUp(int postNo);//
	public List<Post> getListPost(Map<String,Object> map);// 검색 + 정렬1
	//public List<Post> getListPost(Search search);// 검색 + 정렬1
	//public List<Post> getListMyPost(String userId);//1
	public int updatePost(Post post);
	public int deletePost(int postNo);
	public int getPostTotalCount(Search search);//1

	
	//Comment
	public int insertComment(Comment comment);
	public List<Comment> getListComment(int postNo);//
	public int updateComment(Comment comment);
	public int deleteComment(int commentNo);// userId?
	public int getCommentTotalCount(int postNo);
	
	//Report
	public int insertReportPost(Report report);
	public int deleteReportPost(int postNo);
	public List<Report> getListReportPost();//

	//Like
	public int checkLike();//
	public int insertLike(Like like);
	public int deleteLike(Like like);
	public int postLikeCountUp(int postNo);
	public int postLikeCountDown(int postNo);
	public int getPostLikeCount(int postNo);
	
	//User 
	//Follow
	public int insertFollow(Relation relation);
	public List<String> getListFollow(String userId);//
	public List<String> getListFollower(String followingUserId);//
	public int deleteFollow(Relation relation);
	public int updateRelation(Relation relation);

	//User 
	//Block
	public int insertBlock(Relation relation);
	public List<String> getListBlock(String userId);//
	public int deleteBlock(Relation relation);
	
	
	//TestCode
	public int deletePostAll();
	public void deleteReportPostAll();
	public void deleteFollowAll();
	public void deleteBlockAll();	
	
}

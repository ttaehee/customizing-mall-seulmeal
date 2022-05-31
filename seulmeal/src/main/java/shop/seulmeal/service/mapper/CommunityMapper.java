package shop.seulmeal.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;

@Mapper
public interface CommunityMapper {
	
	//Post
	public int insertPost(Post post);

	public Post getPost(int postNo);
	
	public List<Post> getListPost();
	
	public int updatePost(Post post);
	
	public int deletePost(int postNo);
	
	public int deletePostAll();
	
	
	//Comment
	public int insertComment(Comment comment);
	
	public List<Comment> getListComment(int postNo);
	
	public int updateComment(Comment comment);//postNo
	
	public int deleteComment(int commentNo);// userId?
	
	

}

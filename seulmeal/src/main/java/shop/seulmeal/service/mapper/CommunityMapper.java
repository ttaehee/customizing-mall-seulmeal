package shop.seulmeal.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import shop.seulmeal.service.domain.Post;

@Mapper
public interface CommunityMapper {
	
	public int insertPost(Post post);

	public Post getPost(int postNo);
	
	public List<Post> getListPost();
	
	public int updatePost(Post post);
	
	public int deletePost(int postNo);
	
	public int deletePostAll();
	
	
	
	

}

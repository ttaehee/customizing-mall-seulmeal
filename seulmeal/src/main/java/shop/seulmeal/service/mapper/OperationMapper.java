package shop.seulmeal.service.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;

@Mapper
public interface OperationMapper {
	
	// 공지사항 + 이벤트 + 문의
	public int insertOperation(Post post);
	public Post getOperation(int no);
	public int updateOperation(Post post);
	public int deleteOperation(Post post);
	public List<Post> getListOperation(Map<String, Object> map);
	public int getTotalCount(Map<String, Object> map);
	
	// 조회수 증가
	public int updateOperationView(int no);
	
	// 답변
	public int insertAnswer(Comment comment);
	public List<Comment> getListAnswer(int no);
	public int updateAnswer(Comment comment);
	public int deleteAnswer(Comment comment);
	
}

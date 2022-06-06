package shop.seulmeal.service.operation;

import java.util.List;
import java.util.Map;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;

public interface OperationService {
	// 공지사항 + 이벤트 + 문의
	public int insertOperation(Post post);
	public Post getOperation(Post post);
	public int updateOperation(Post post);
	public int deleteOperation(Post post);
	public Map<String,Object> getListOperation(Search search, int postStatus);
	
	// 답변
	public int insertAnswer(Comment comment);
	public List<Comment> getListAnswer(int no);
	public int updateAnswer(Comment comment);
	public int deleteAnswer(Comment comment);
}

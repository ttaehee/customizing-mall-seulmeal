package shop.seulmeal.service.operation.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.mapper.OperationMapper;
import shop.seulmeal.service.operation.OperationService;

@Service("operationServiceImpl")
public class OperationServiceImpl implements OperationService {
	
	@Autowired	
	private OperationMapper operationMapper;
	
	public OperationServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	// 공지사항 + 이벤트 + 문의CustomProductCustomProduct
	@Override
	public int insertOperation(Post post) {
		// TODO Auto-generated method stub
		return operationMapper.insertOperation(post);
	}

	@Override
	public Post getOperation(Post post) {
		// TODO Auto-generated method stub
		// 조회수 증가
		operationMapper.updateOperationView(post.getPostNo());
		
		return operationMapper.getOperation(post);
	}

	@Override
	public int updateOperation(Post post) {
		// TODO Auto-generated method stub
		return operationMapper.updateOperation(post);
	}

	@Override
	public int deleteOperation(Post post) {
		// TODO Auto-generated method stub
		return operationMapper.deleteOperation(post);
	}

	@Override
	public Map<String, Object> getListOperation(Search search, int postStatus) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("postStatus", postStatus);
		
		map.put("list", operationMapper.getListOperation(map));
		map.put("totalCount",operationMapper.getTotalCount(map));
		
		return map;
	}
	

	@Override
	public int insertAnswer(Comment comment) {
		// TODO Auto-generated method stub
		// 답변 완료
		operationMapper.updateAnswerStatus(comment.getPostNo());
		
		return operationMapper.insertAnswer(comment);
	}

	@Override
	public List<Comment> getListAnswer(int no) {
		// TODO Auto-generated method stub
		return operationMapper.getListAnswer(no);
	}

	@Override
	public int updateAnswer(Comment comment) {
		// TODO Auto-generated method stub
		return operationMapper.updateAnswer(comment);
	}

	@Override
	public int deleteAnswer(Comment comment) {
		// TODO Auto-generated method stub
		return operationMapper.deleteAnswer(comment);
	}

	@Scheduled(cron = "0 49 17 * * ? ")
	public void endEvent() throws Exception {
		System.out.println("test");
		operationMapper.endEvent();
	}

}

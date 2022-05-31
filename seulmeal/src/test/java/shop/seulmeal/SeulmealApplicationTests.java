package shop.seulmeal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.AttachmentsMapper;
import shop.seulmeal.service.mapper.OperationMapper;
import shop.seulmeal.service.mapper.ProductMapper;
import shop.seulmeal.service.mapper.UserMapper;

@SpringBootTest
class SeulmealApplicationTests {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private OperationMapper operationMapper;
	
	@Autowired
	private AttachmentsMapper attachmentsMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	@Test
	void contextLoads() {
		User user = new User();
		user = userMapper.getUser("jeong");
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("공지사항");
		post.setContent("공지사항 내용");
		post.setPostStatus("1");
		
		// C
		//operationMapper.insertOperation(post);
		
		// R
		//post = operationMapper.getOperation(21);
		
		// U
		post.setContent("수정된 공지사항");
		post.setPostNo(21);
		//operationMapper.updateOperation(post);
		
		// D
		//operationMapper.deleteOperation(post);
		
		/*
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println(search);
		Map<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("postStatus", "1");
		
		List<Post> list = operationMapper.getListOperation(map);
		int rs = operationMapper.getTotalCount(map);
		
		for (Post post2 : list) {
			System.out.println("공지 : "+post2);
		}
		System.out.println("총값 : "+rs);
		
		*/
		
		/*
		Attachments a1 = new Attachments();
		Attachments a2 = new Attachments();
		Attachments a3 = new Attachments();
		Attachments a4 = new Attachments();
		Attachments a5 = new Attachments();
		
		a1.setPostNo("21");
		a2.setPostNo("21");
		a3.setPostNo("21");
		a4.setPostNo("21");
		a5.setPostNo("21");
		
		a1.setAttachmentName("test중");
		a2.setAttachmentName("test중");
		a3.setAttachmentName("test중");
		a4.setAttachmentName("test중");
		a5.setAttachmentName("test중");
		
		List<Attachments> list = new ArrayList<>();
		list.add(a1);
		list.add(a2);
		list.add(a3);
		list.add(a4);
		list.add(a5);
		attachmentsMapper.insertListAttachments(list);
		*/
		
		Parts parts = new Parts();
		parts.setName("김치3");
		parts.setCalorie(170);
		parts.setPrice(1000);
		
		//productMapper.insertParts(parts);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", "김치2");
		
		parts = productMapper.getParts(map);
		
		System.out.println("GET : "+ parts);
		
		parts.setProductNo(1);
		
		List<Parts> list = new ArrayList<Parts>();
		list.add(parts);
		list.add(parts);
		
		//int a = productMapper.insertProudctParts(list);
		
		//System.out.println(a == list.size());
		
		list = productMapper.getProductParts(1);
		
		for (Parts parts2 : list) {
			System.out.println("1번에 들어간 재료 : "+parts2);
		}
		
		Comment cm = new Comment();
		cm.setUser(user);
		cm.setPostNo(10);
		cm.setContent("문의 답변입니다.");
		int r =operationMapper.insertAnswer(cm);
		System.out.println(r == 1);
	}

}

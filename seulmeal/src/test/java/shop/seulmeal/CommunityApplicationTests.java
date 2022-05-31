package shop.seulmeal;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.CommunityMapper;

@SpringBootTest
@Transactional
class CommunityApplicationTests {

	@Autowired
	CommunityMapper communityMapper;

	@Test
	void getListPost() {
		
		communityMapper.deletePostAll();
		
		//
		User user01 = new User();
		user01.setUserId("ghm8614"); // db�뿉 �엳�뒗 userId �궗�슜�빐�빞�븿

		Post post = new Post();
		post.setUser(user01);
		post.setTitle("�젣紐�1");
		post.setContent("�궡�슜1");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : �깮�왂媛��뒫
		communityMapper.insertPost(post);
		
		
		//
		User user02 = new User();
		user02.setUserId("jeong"); // db�뿉 �엳�뒗 userId �궗�슜�빐�빞�븿

		post.setUser(user02);
		post.setTitle("�젣紐�2");
		post.setContent("�궡�슜2");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : �깮�왂媛��뒫
		communityMapper.insertPost(post);

		List<Post> list = communityMapper.getListPost();
		assertThat(list.size()).isEqualTo(1);
	}

	//@Test : 0
	void getPost() {
		
		communityMapper.deletePostAll();

		//
		User user01 = new User();
		user01.setUserId("ghm8614"); // db�뿉 �엳�뒗 userId �궗�슜�빐�빞�븿

		Post post = new Post();
		post.setUser(user01);
		post.setTitle("�젣紐�1");
		post.setContent("�궡�슜1");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : �깮�왂媛��뒫
		communityMapper.insertPost(post);
		
		//
		Post resultPost = communityMapper.getPost(post.getPostNo());//
		System.out.println(resultPost);
		
		assertThat(resultPost.getUser().getUserId()).isEqualTo("ghm8614");
	}

	//@Test: 0
	void insertPost() {
		// @Data 瑜� 遺숈뿬�빞 �뿉�윭�굹吏� �븡�쓬
		User user = new User();
		user.setUserId("ghm8614"); // db�뿉 �엳�뒗 userId �궗�슜�빐�빞�븿

		Post post = new Post();
		post.setUser(user);
		post.setTitle("媛먯옄�쟾 �젅�떆�뵾");
		post.setContent("媛먯옄�쟾留쏆엲�뼱�슂");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : �깮�왂媛��뒫

		assertThat(communityMapper.insertPost(post)).isEqualTo(1);
	}

	// @Test : 0
	void updatePost() {

		Post post = communityMapper.getPost(30);

		post.setTitle("媛먯옄�쟾 �젅�떆�뵾 �닔�젙");
		post.setContent("媛먯옄�쟾留쏆엲�뼱�슂 �닔�젙");
		post.setPostStatus("0");

		assertThat(communityMapper.insertPost(post)).isEqualTo(1);
	}

	//@Test : 0
	void deletePost() {

		communityMapper.deletePostAll();
		assertThat(communityMapper.getListPost().size()).isEqualTo(0);
		
		//
		User user01 = new User();
		user01.setUserId("ghm8614"); // db�뿉 �엳�뒗 userId �궗�슜�빐�빞�븿

		Post post = new Post();
		post.setUser(user01);
		post.setTitle("�젣紐�1");
		post.setContent("�궡�슜1");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : �깮�왂媛��뒫
		communityMapper.insertPost(post);
		assertThat(communityMapper.getListPost().size()).isEqualTo(1);
		
		
		communityMapper.deletePost(post.getPostNo());
		assertThat(communityMapper.getListPost().size()).isEqualTo(0);
	}

	//@Test : 0 
	void deletePostAll() {

		communityMapper.deletePostAll();
		assertThat(communityMapper.getListPost().size()).isEqualTo(0);

	}
	
	
	// CommentTest
	@Test
	void insertComment() {
		
		communityMapper.deletePostAll();

		//
		User user = new User();
		user.setUserId("ghm8614"); // db�뿉 �엳�뒗 userId �궗�슜�빐�빞�븿
		user.setNickName("ghm");
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("�젣紐�1");
		post.setContent("�궡�슜1");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : �깮�왂媛��뒫
		communityMapper.insertPost(post);
		
		//
		Post resultPost = communityMapper.getPost(post.getPostNo());
		
		//
		Comment comment = new Comment();
		comment.setUser(user);
		comment.setPostNo(resultPost.getPostNo());
		comment.setContent("�뙎湲��궡�슜 test");
		comment.setStatus("0");
		
		// 寃�利�
		int result = communityMapper.insertComment(comment);
		assertThat(result).isEqualTo(1);
		
		
	}
	
	void getListComment() {
		
	}
	
	void updateComment() {
		
	}
	
	
	void deleteComment() {
		
	}
	

	
	
	
	
	void contextLoads() {
	}

}

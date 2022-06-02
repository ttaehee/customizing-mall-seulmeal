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
import shop.seulmeal.service.domain.Follow;
import shop.seulmeal.service.domain.Like;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Report;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.mapper.CommunityMapper;

@SpringBootTest
@Transactional
class CommunityApplicationTests {

	@Autowired
	CommunityMapper communityMapper;

	//@Test : o
	void getListPost() {
		
		communityMapper.deletePostAll();
		
		//
		User user01 = new User();
		user01.setUserId("ghm8614"); // db에 있는 userId 사용해야함

		Post post = new Post();
		post.setUser(user01);
		post.setTitle("제목1");
		post.setContent("내용1");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : 생략가능
		communityMapper.insertPost(post);
		
		
		//
		User user02 = new User();
		user02.setUserId("jeong"); 

		post.setUser(user02);
		post.setTitle("제목2");
		post.setContent("내용2");
		post.setPostStatus("0");
		// post.setStatus("0"); default 0 : 생략가능
		communityMapper.insertPost(post);

		List<Post> list = communityMapper.getListPost();
		assertThat(list.size()).isEqualTo(1);
	}

	//@Test : o
	void getPost() {
		
		communityMapper.deletePostAll();

		//
		User user01 = new User();
		user01.setUserId("ghm8614"); 

		Post post = new Post();
		post.setUser(user01);
		post.setTitle("占쎌젫筌륅옙1");
		post.setContent("占쎄땀占쎌뒠1");
		post.setPostStatus("0");
		communityMapper.insertPost(post);
		
		//
		Post resultPost = communityMapper.getPost(post.getPostNo());//
		System.out.println(resultPost);
		
		assertThat(resultPost.getUser().getUserId()).isEqualTo("ghm8614");
	}

	//@Test: o
	void insertPost() {
		User user = new User();
		user.setUserId("ghm8614"); 

		Post post = new Post();
		post.setUser(user);
		post.setTitle("감자전 레시피");
		post.setContent("감자전맛잇어요");
		post.setPostStatus("0");

		assertThat(communityMapper.insertPost(post)).isEqualTo(1);
	}

	// @Test : o
	void updatePost() {

		Post post = communityMapper.getPost(30);

		post.setTitle("감자전 레시피 수정");
		post.setContent("감자전맛잇어요 수정");
		post.setPostStatus("0");

		assertThat(communityMapper.insertPost(post)).isEqualTo(1);
	}

	//@Test : o
	void deletePost() {

		communityMapper.deletePostAll();
		assertThat(communityMapper.getListPost().size()).isEqualTo(0);
		
		//
		User user01 = new User();
		user01.setUserId("ghm8614");

		Post post = new Post();
		post.setUser(user01);
		post.setTitle("占쎌젫筌륅옙1");
		post.setContent("占쎄땀占쎌뒠1");
		post.setPostStatus("0");
		
		communityMapper.insertPost(post);
		assertThat(communityMapper.getListPost().size()).isEqualTo(1);
		
		
		communityMapper.deletePost(post.getPostNo());
		assertThat(communityMapper.getListPost().size()).isEqualTo(0);
	}

	//@Test : o 
	void deletePostAll() {

		communityMapper.deletePostAll();
		assertThat(communityMapper.getListPost().size()).isEqualTo(0);

	}
	
	
	// CommentTest
	//@Test : o
	void insertComment() {
		
		communityMapper.deletePostAll();

		//
		User user = new User();
		user.setUserId("ghm8614"); 
		user.setNickName("ghm");
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("제목1");
		post.setContent("내용1");
		post.setPostStatus("0");
		
		communityMapper.insertPost(post);
		
		//
		Post resultPost = communityMapper.getPost(post.getPostNo());
		
		//
		Comment comment = new Comment();
		comment.setUser(user);
		comment.setPostNo(resultPost.getPostNo());
		comment.setContent("댓글내용 test");
		comment.setLayer("0");
		//comment.setParentCommentNo();
		comment.setStatus("0");
		
		// 
		int result = communityMapper.insertComment(comment);
		assertThat(result).isEqualTo(1);
		
		
	}
	//@Test : o
	void getListComment() {
		communityMapper.deletePostAll();

		//
		User user = new User();
		user.setUserId("ghm8614"); 
		user.setNickName("ghm");
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("제목1");
		post.setContent("내용1");
		post.setPostStatus("0");
		
		communityMapper.insertPost(post);
		
		//
		Post resultPost = communityMapper.getPost(post.getPostNo());
		
		Comment comment01 = new Comment();
		comment01.setUser(user);
		comment01.setPostNo(resultPost.getPostNo());
		comment01.setContent("댓글내용 test01");
		comment01.setLayer("0");
		comment01.setStatus("0");
		
		Comment comment02 = new Comment();
		comment02.setUser(user);
		comment02.setPostNo(resultPost.getPostNo());
		comment02.setContent("댓글내용 test02");
		comment02.setLayer("0");
		comment02.setStatus("0");
		
		communityMapper.insertComment(comment01);
		communityMapper.insertComment(comment02);
		
		assertThat(communityMapper.getListComment(resultPost.getPostNo()).size()).isEqualTo(2);
		

	}
	//@Test : o
	void updateComment() {
		communityMapper.deletePostAll();

		//
		User user = new User();
		user.setUserId("ghm8614"); 
		user.setNickName("ghm");
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("제목1");
		post.setContent("내용1");
		post.setPostStatus("0");
		
		communityMapper.insertPost(post);
		
		//
		Post resultPost = communityMapper.getPost(post.getPostNo());
		
		Comment comment01 = new Comment();
		comment01.setUser(user);
		comment01.setPostNo(resultPost.getPostNo());
		comment01.setContent("댓글내용 test01");
		comment01.setLayer("0");
		comment01.setStatus("0");
	
		communityMapper.insertComment(comment01);
		
		comment01.setContent("댓글 내용 업데이트");
		assertThat(communityMapper.updateComment(comment01)).isEqualTo(1);
	}
	
	//@Test : o
	void deleteComment() {
		communityMapper.deletePostAll();

		//
		User user = new User();
		user.setUserId("ghm8614"); 
		user.setNickName("ghm");
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("제목1");
		post.setContent("내용1");
		post.setPostStatus("0");
		
		communityMapper.insertPost(post);
		
		//
		Post resultPost = communityMapper.getPost(post.getPostNo());
		
		Comment comment01 = new Comment();
		comment01.setUser(user);
		comment01.setPostNo(resultPost.getPostNo());
		comment01.setContent("댓글내용 test01");
		comment01.setLayer("0");
		comment01.setStatus("0");
	
		communityMapper.insertComment(comment01);
		
		//
		communityMapper.deleteComment(comment01.getCommentNo());
		assertThat(communityMapper.getListComment(post.getPostNo()).size()).isEqualTo(0);
	}
	
	//@Test : o
	void report() {
		
		// ==== 준비 ====
		communityMapper.deleteReportPostAll();

		User user = new User();
		user.setUserId("ghm8614"); 
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("제목1");
		post.setContent("내용1");
		post.setPostStatus("0");
		
		communityMapper.insertPost(post);
		
		// ==== 준비 ====
		Report report = new Report();
		report.setReporterId("jeong");
		report.setPostNo(post.getPostNo());
		report.setReason("거짓정보");

		// ==== 검증 ====
		assertThat(communityMapper.insertReportPost(report)).isEqualTo(1);
		assertThat(communityMapper.deleteReportPost(post.getPostNo())).isEqualTo(1);
		assertThat(communityMapper.getListReportPost().size()).isEqualTo(0);
	}
	
	//@Test : o
	void like() {
		
		// ==== 준비 ====
		communityMapper.deletePostAll();

		User user = new User();
		user.setUserId("ghm8614"); 
		
		Post post = new Post();
		post.setUser(user);
		post.setTitle("제목1");
		post.setContent("내용1");
		post.setPostStatus("0");
		
		communityMapper.insertPost(post);
		
		// ==== 준비 ====
		Like like = new Like();
		like.setUserId("jeong");
		like.setPostNo(post.getPostNo());
		
		// ==== 검증 ====
		// 좋아요
		assertThat(communityMapper.insertLike(like)).isEqualTo(1);
		communityMapper.postLikeCountUp(like.getPostNo());
		assertThat(communityMapper.getPostLikeCount(post.getPostNo())).isEqualTo(1);
		
		// 좋아요 취소
		assertThat(communityMapper.deleteLike(like)).isEqualTo(1);
		communityMapper.postLikeCountDown(like.getPostNo());
		assertThat(communityMapper.getPostLikeCount(post.getPostNo())).isEqualTo(0);
	}

	//@Test : o
	void follow() {
		
		// ==== 준비 ====
		communityMapper.deleteFollowAll();
		
		Follow follow01 = new Follow();
		follow01.setUserId("ghm8614");
		
		Follow follow02 = new Follow();
		follow02.setUserId("ghm8614");

		// ==== 검증 ====
		//팔로우
		assertThat(communityMapper.insertFollow(follow01)).isEqualTo(1);
		assertThat(communityMapper.insertFollow(follow02)).isEqualTo(1);
		
		//팔로우/팔로워 목록조회
		assertThat(communityMapper.getListFollow("ghm8614").size()).isEqualTo(2);
		assertThat(communityMapper.getListFollower("minhye").size()).isEqualTo(1);
		
		//팔로우 삭제
		assertThat(communityMapper.deleteFollow(follow01)).isEqualTo(1);
	}	
	
	
	void contextLoads() {
	}

}

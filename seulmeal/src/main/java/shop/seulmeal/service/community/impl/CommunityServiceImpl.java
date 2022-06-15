package shop.seulmeal.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.seulmeal.common.Search;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Like;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Relation;
import shop.seulmeal.service.domain.Report;
import shop.seulmeal.service.mapper.CommunityMapper;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityMapper communityMapper;

	// C
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}

	// M

	// Post
	@Override
	public int insertPost(Post post) {
		return communityMapper.insertPost(post);
	}

	@Override
	public Post getPost(int postNo) {
		return communityMapper.getPost(postNo);
	}

	@Override
	public Map<String, Object> getListPost(Search search, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);

		map.put("postList", communityMapper.getListPost(map));
		map.put("postTotalCount", communityMapper.getPostTotalCount(map));

		return map;
	}

	@Override
	public int updatePost(Post post) {
		return communityMapper.updatePost(post);
	}

	@Override
	public int deletePost(int postNo) {
		return communityMapper.deletePost(postNo);
	}

	// Comment
	@Override
	public int insertComment(Comment comment) {
		communityMapper.postCommentCountUp(comment.getPostNo());
		return communityMapper.insertComment(comment);
	}

	@Override
	public Comment getComment(int commentNo) {
		return communityMapper.getComment(commentNo);
	}
	
	@Override
	public Map<String, Object> getListcomment(Search search, int postNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("postNo", postNo);

		map.put("commentList", communityMapper.getListComment(map));
		map.put("commentTotalCount", communityMapper.getCommentTotalCount(postNo));

		return map;
	}

	@Override
	public int updateComment(Comment comment) {
		return communityMapper.updateComment(comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		//communityMapper.postCommentCountUp(); Comment comment?
		return communityMapper.deleteComment(commentNo);
	}

	// Report
	@Override
	public int insertReportPost(Report report) {
		return communityMapper.insertReportPost(report);
	}

	@Override
	public Map<String, Object> getListReportPost(Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportList", communityMapper.getListReportPost(search));
		map.put("reportTotalCount", communityMapper.getReportTotalCount());

		return map;
	}

	@Override
	public int deleteReportPost(int postNo) {
		return communityMapper.deleteReportPost(postNo);
	}

	// Like
	@Override
	public int insertLike(Like like) {
		
		// userId가 like 눌렀는지 체크
		Like dbLike = communityMapper.checkLike(like);
		
		// 이미 눌렀을 때,  실행 x
		if(dbLike != null) {
			System.out.println("///////이미 좋아요 눌렀음, insert 실패");
			return -1;
		}
		
		// 누르지 않았을 때
		communityMapper.postLikeCountUp(like.getPostNo());

		return communityMapper.insertLike(like);
	}

	@Override
	public int deleteLike(Like like) {
		
		// userId가 like 눌렀는지 체크
		Like dbLike = communityMapper.checkLike(like);

		// 이미 눌렀을 때,  실행 x
		if(dbLike == null) {
			System.out.println("///////좋아요 누르지 않았음, delete 실패");
			return -1;
		}
		
		communityMapper.postLikeCountDown(like.getPostNo());
		return communityMapper.deleteLike(like);
	}

	@Override
	public Post getLikePost(int postNo) {
		return communityMapper.getPost(postNo);
	}

	// Relation
	@Override
	public int insertFollow(Relation relation) {
		
		Relation dbRelation = communityMapper.getRelation(relation);
		
		if (dbRelation == null) {
			System.out.println("db 존재 x, insert follow!");
			communityMapper.insertRelation(relation);
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("userId", relation.getUserId());
		map.put("relationStatus",relation.getRelationStatus());
		
		// 팔로워 수 구하기
		int followCnt = communityMapper.getRelationTotalCount(map);
		
		return followCnt;
	}
	
	@Override
	public int deleteFollow(Relation relation) {	//o
		
		Relation dbRelation = communityMapper.getRelation(relation);
		
		if(dbRelation != null & dbRelation.getRelationStatus().equals("0")){
			System.out.println("db 존재 o, delete follow!");
			communityMapper.deleteRelation(dbRelation);
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("userId", relation.getUserId());
		map.put("relationStatus", relation.getRelationStatus());
		
		// 팔로워 수 구하기
		int followCnt = communityMapper.getRelationTotalCount(map);
		
		return followCnt;
	}

	@Override
	public Map<String, Object> getListFollow(Search search, String userId, String relationStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		map.put("relationStatus", relationStatus);

		map.put("followList", communityMapper.getListRelation(map));
		map.put("followTotalCount", communityMapper.getRelationTotalCount(map));

		return map;
	}

	@Override
	public Map<String, Object> getListFollower(Search search, String relationUserId) {
		Map<String, Object> map = new HashMap<String, 	Object>();
		map.put("search", search);
		map.put("relationUserId", relationUserId);

		map.put("followerList", communityMapper.getListFollower(map));
		map.put("followerTotalCount", communityMapper.getFollowerTotalCount(map));

		return map;
	}



	@Override
	public int updateRelation(Relation relation) {
		return communityMapper.updateRelation(relation);
	}

	@Override
	public int insertBlock(Relation relation) {

		Relation dbRelation = communityMapper.getRelation(relation);
		
		if (dbRelation != null) {
			if(dbRelation.getRelationStatus().equals("0")) {// userId가 relationUserId를 친추한 경우, 
				communityMapper.updateRelation(dbRelation);
				System.out.println("//////db에 이미 follow 존재, 데이터 상태 변경");
				return 1;
			}else if(dbRelation.getRelationStatus().equals("1")) {// userId가 relationUserId를 이미 블락한 경우
				System.out.println("//////db에 이미 block 존재, 데이터 삽입 x");
				return -1;
			}
		}
		
		System.out.println("/////db 존재 x, insert block!");
		return communityMapper.insertRelation(relation);
	}

	@Override
	public Map<String, Object> getListBlock(Search search, String userId, String relationStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		map.put("relationStatus", relationStatus);

		map.put("blockList", communityMapper.getListRelation(map));
		map.put("blockTotalCount", communityMapper.getRelationTotalCount(map));

		return map;
	}

	@Override
	public int deleteBlock(Relation relation) {	//o
		
		Relation dbRelation = communityMapper.getRelation(relation);
		
		return (dbRelation != null & dbRelation.getRelationStatus().equals("1")) ? communityMapper.deleteRelation(dbRelation):-1;
	}

	@Override
	public int postViewsUp(int postNo) {
		return communityMapper.postViewsUp(postNo);
	}


}

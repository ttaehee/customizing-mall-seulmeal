package shop.seulmeal.service.community.impl;

import java.util.HashMap;
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
		communityMapper.postViewsUp(postNo);
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
		communityMapper.postLikeCountUp(like.getPostNo());
		return communityMapper.insertLike(like);
	}

	@Override
	public int deleteLike(Like like) {
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
		return communityMapper.insertRelation(relation);
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("relationUserId", relationUserId);

		map.put("followerList", communityMapper.getListFollower(map));
		map.put("followerTotalCount", communityMapper.getFollowerTotalCount(map));

		return map;
	}

	@Override
	public int deleteFollow(Relation relation) {
		return communityMapper.deleteRelation(relation);
	}

	@Override
	public int updateRelation(Relation relation) {
		return communityMapper.updateRelation(relation);
	}

	@Override
	public int insertBlock(Relation relation) {
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
	public int deleteBlock(Relation relation) {
		return communityMapper.deleteRelation(relation);
	}


}

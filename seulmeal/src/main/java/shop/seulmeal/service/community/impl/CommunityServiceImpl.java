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
	CommunityMapper communityMapper;
	
	@Override
	public int insertPost(Post post) {
		return communityMapper.insertPost(post);
	}

	@Override
	public Post getPost(int postNo) {
		communityMapper.postViewsUp(postNo);
		return communityMapper.getPost(postNo);
	}

	//
	@Override
	public Map<String,Object> getListPost(Search search, String userId) {
		return null;
	}

	@Override
	public int updatePost(Post post) {
		return communityMapper.updatePost(post);
	}

	@Override
	public int deletePost(int postNo) {
		return communityMapper.deletePost(postNo);
	}

	
	//Comment
	@Override
	public int insertComment(Comment comment) {
		return 0;
	}

	@Override
	public List<Comment> getListComment(int postNo) {
		return null;
	}

	@Override
	public int updateComment(Comment comment) {
		return 0;
	}

	@Override
	public int deleteComment(int commentNo) {
		return 0;
	}

	@Override
	public int insertReportPost(Report report) {
		return 0;
	}

	@Override
	public int deleteReportPost(int postNo) {
		return 0;
	}

	@Override
	public List<Report> getListReportPost() {
		return null;
	}

	@Override
	public int insertLike(Like like) {
		return 0;
	}

	@Override
	public int deleteLike(Like like) {
		return 0;
	}

	@Override
	public List<String> getListFollow(String userId) {
		return null;
	}

	@Override
	public List<String> getListFollower(String followingUserId) {
		return null;
	}

	@Override
	public int deleteFollow(Relation relation) {
		return 0;
	}

	@Override
	public int updateRelation(Relation relation) {
		return 0;
	}

	@Override
	public int insertBlock(Relation relation) {
		return 0;
	}

	@Override
	public List<Relation> getListBlock(Map<String, Object> map) {
		return null;
	}

	@Override
	public int deleteBlock(Relation relation) {
		return 0;
	}


}

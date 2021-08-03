package com.e_um.model.dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.userInfo.report.ReportFeed;
import com.e_um.model.vo.userInfo.report.ReportFeedComment;
import com.e_um.model.vo.userInfo.user.User;

@Repository
public class AdminDao implements AdminDaoInterface{

	@Override
	public List<User> manageUser(int cPage, int numPerPage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.managUser", "",new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int userTotalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.userTotalData");
	}

	@Override
	public int blockUser(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.blockUser", userId);
	}

	@Override
	public int unblockUser(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblockUser", userId);
	}

	@Override
	public int blindMovieComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
//		Movie_review_destroy
//		user_id
		return session.update("admin.blindMovieComment",userId);
	}

	@Override
	public int blindFoodComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
//		food_comment_block
//		user_id
		return session.update("admin.blindFoodComment",userId);
	}

	@Override
	public int blindFeed(String userId, SqlSession session) {
		// TODO Auto-generated method stub
//		feed_block
//		user_id
		return session.update("admin.blindFeed",userId);
	}

	@Override
	public int blindFeedComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
//		feed_comment_block
//		user_id
		return session.update("admin.blindFeedComment",userId);
	}

	@Override
	public int blindGroupComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
//		group_comment_block
//		user_id
		return session.update("admin.blindGroupComment",userId);
	}
	@Override
	public int blindGroupBoard(String userId, SqlSession session) {
		// TODO Auto-generated method stub
//		group_board_block
//		group_board_block
//		group_board_block
//		userId
		return session.update("admin.blindGroupBoardComment",userId);
	}
	
	
	
	
	@Override
	public int unblindMovieComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblindMovieComment",userId);
	}
	
	@Override
	public int unblindFoodComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblindFoodComment",userId);
	}

	@Override
	public int unblindFeed(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblindFeed",userId);
	}

	@Override
	public int unblindFeedComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblindFeedComment",userId);
	}

	@Override
	public int unblindGroupComment(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblindGroupComment",userId);
	}
	@Override
	public int unblindGroupBoard(String userId, SqlSession session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblindGroupBoardComment",userId);
	}

	@Override
	public List<Group> manageGroup(int cPage, int numPerPage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.manageGroup","",new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int groupTotalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.groupTotalData");
	}

	@Override
	public int blindGroup(String groupSeq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.blindGroup", groupSeq);
	}

	@Override
	public int unblindGroup(String groupSeq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblindGroup",groupSeq);
	}

	@Override
	public List<Food> manageFood(int cPage, int numPerPage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.manageFood","",new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int getMenCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getMenCount");
	}

	@Override
	public int getWomenCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getWomenCount");
	}

	@Override
	public List<User> statisticsUser(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.managUser");
	}

	@Override
	public List<Group> statisticsGroup(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.manageGroup");
	}

	@Override
	public int foodTotalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.foodTotalData");
	}

	@Override
	public int blockFood(String foodSeq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.blockFood",foodSeq);
	}

	@Override
	public int unblockFood(String foodSeq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.unblockFood",foodSeq);
	}

	@Override
	public List<Food> statisticsFood(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.manageFood");
	}

	@Override
	public int likeMaxiumCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.likeMaximumCount");
	}

	@Override
	public List<ReportFeed> manageFeed(int cPage, int numPerPage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.manageFeed","",new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int feedTotalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.feedTotalData");
	}

	@Override
	public int feedBlock(String seq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.feedBlock", seq);
	}

	@Override
	public int feedUnBlock(String seq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.feedUnBlock", seq);
	}

	@Override
	public List<ReportFeedComment> manageFeedComment(int cPage, int numPerPage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.manageFeedComment", "", new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int feedCommentTotalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.feedCommentTotalData");
	}

	@Override
	public int feedCommentBlock(String seq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.feedCommentBlock",seq);
	}

	@Override
	public int feedCommentUnBlock(String seq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("admin.feedCommentUnBlock",seq);
	}

}

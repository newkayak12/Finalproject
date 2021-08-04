package com.e_um.model.sevice.admin;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e_um.model.dao.admin.AdminDaoInterface;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.userInfo.report.ReportFeed;
import com.e_um.model.vo.userInfo.report.ReportFeedComment;
import com.e_um.model.vo.userInfo.report.ReportFoodComment;
import com.e_um.model.vo.userInfo.report.ReportGroupBoard;
import com.e_um.model.vo.userInfo.report.ReportGroupBoardComment;
import com.e_um.model.vo.userInfo.user.User;

@Service
public class AdminService implements AdminServiceInterface {
	@Autowired
	SqlSessionTemplate session;
	@Autowired
	AdminDaoInterface dao;
	@Override
	public List<User> manageUser(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageUser(cPage, numPerPage, session);
	}
	@Override
	public int userTotalData() {
		// TODO Auto-generated method stub
		return dao.userTotalData(session);
	}
	@Override
	@Transactional()
	public int blockUser(String userId) {
		// TODO Auto-generated method stub
			int result = dao.blockUser(userId, session);
				if(result>0) {
	//				food, feed,movie group
					dao.blindFeed(userId, session);
					dao.blindFeedComment(userId, session);
					dao.blindFoodComment(userId, session);
					dao.blindGroupComment(userId, session);
					dao.blindGroupBoard(userId, session);
					dao.blindMovieComment(userId, session);
				}
		return result;
	}
	@Override
	public int unblockUser(String userId) {
		// TODO Auto-generated method stub
		int result = dao.unblockUser(userId, session);
				if(result>0) {
					dao.unblindFeed(userId, session);
					dao.unblindFeedComment(userId, session);
					dao.unblindFoodComment(userId, session);
					dao.unblindGroupBoard(userId, session);
					dao.unblindGroupComment(userId, session);
					dao.unblindMovieComment(userId, session);
				}
		return result;
	}
	@Override
	public List<Group> manageGroup(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageGroup(cPage, numPerPage, session);
	}
	@Override
	public int groupTotalData() {
		// TODO Auto-generated method stub
		return dao.groupTotalData(session);
	}
	@Override
	public int blindGroup(String groupSeq) {
		// TODO Auto-generated method stub
		return dao.blindGroup(groupSeq, session);
	}
	@Override
	public int unblindGroup(String groupSeq) {
		// TODO Auto-generated method stub
		return dao.unblindGroup(groupSeq, session);
	}
	@Override
	public List<Food> manageFood(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageFood(cPage, numPerPage, session);
	}
	@Override
	public int getMenCount() {
		// TODO Auto-generated method stub
		return dao.getMenCount(session);
	}
	@Override
	public int getWomenCount() {
		// TODO Auto-generated method stub
		return dao.getWomenCount(session);
	}
	@Override
	public List<User> statisticsUser() {
		// TODO Auto-generated method stub
		return dao.statisticsUser(session);
	}
	@Override
	public List<Group> statisticsGroup() {
		// TODO Auto-generated method stub
		return dao.statisticsGroup(session);
	}
	@Override
	public int foodTotalData() {
		// TODO Auto-generated method stub
		return dao.foodTotalData(session);
	}
	@Override
	public int blockFood(String foodSeq) {
		// TODO Auto-generated method stub
		return dao.blockFood(foodSeq, session);
	}
	@Override
	public int unblockFood(String foodSeq) {
		// TODO Auto-generated method stub
		return dao.unblockFood(foodSeq, session);
	}
	@Override
	public List<Food> statisticsFood() {
		// TODO Auto-generated method stub
		return dao.statisticsFood(session);
	}
	@Override
	public int likeMaxiumCount() {
		// TODO Auto-generated method stub
		return dao.likeMaxiumCount(session);
	}
	@Override
	public List<ReportFeed> manageFeed(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageFeed(cPage, numPerPage, session);
	}
	@Override
	public int feedTotalData() {
		// TODO Auto-generated method stub
		return dao.feedTotalData(session);
	}
	@Override
	public int feedBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.feedBlock(seq, session);
	}
	@Override
	public int feedUnBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.feedUnBlock(seq, session);
	}
	@Override
	public List<ReportFeedComment> manageFeedComment(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageFeedComment(cPage, numPerPage, session);
	}
	@Override
	public int feedCommentTotalData() {
		// TODO Auto-generated method stub
		return dao.feedCommentTotalData(session);
	}
	@Override
	public int feedCommentBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.feedCommentBlock(seq, session);
	}
	@Override
	public int feedCommentUnBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.feedCommentUnBlock(seq, session);
	}
	@Override
	public List<ReportFoodComment> manageFoodComment(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageFoodComment(cPage, numPerPage, session);
	}
	@Override
	public int foodCommentTotalData() {
		// TODO Auto-generated method stub
		return dao.foodCommentTotalData(session);
	}
	@Override
	public int foodCommentBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.foodCommentBlock(seq, session);
	}
	@Override
	public int foodCommentUnBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.foodCommentUnBlock(seq, session);
	}
	@Override
	public List<ReportGroupBoard> manageGroupBoard(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageGroupBoard(cPage, numPerPage, session);
	}
	@Override
	public int groupBoardTotalData() {
		// TODO Auto-generated method stub
		return dao.groupBoardTotalData(session);
	}
	@Override
	public int groupBoardBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.groupBoardBlock(seq, session);
	}
	@Override
	public int groupBoardUnBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.groupBoardUnBlock(seq, session);
	}
	@Override
	public List<ReportGroupBoardComment> manageReportGroupBoardComment(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.manageReportGroupBoardComment(cPage, numPerPage, session);
	}
	@Override
	public int reportGroupBoardCommentTotalData() {
		// TODO Auto-generated method stub
		return dao.reportGroupBoardCommentTotalData(session);
	}
	@Override
	public int reportGroupBoardCommentBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.reportGroupBoardCommentBlock(seq,session);
	}
	@Override
	public int reportGroupBoardCommentUnBlock(String seq) {
		// TODO Auto-generated method stub
		return dao.reportGroupBoardCommentUnBlock(seq, session);
	}

}

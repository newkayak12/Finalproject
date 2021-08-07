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
import com.e_um.model.vo.serviceinfo.faq.Faq;
import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
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
		return dao.manageUser(cPage, numPerPage, session);
	}
	@Override
	public int userTotalData() {
		return dao.userTotalData(session);
	}
	@Override
	@Transactional()
	public int blockUser(String userId) {
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
		return dao.manageGroup(cPage, numPerPage, session);
	}
	@Override
	public int groupTotalData() {
		return dao.groupTotalData(session);
	}
	@Override
	public int blindGroup(String groupSeq) {
		return dao.blindGroup(groupSeq, session);
	}
	@Override
	public int unblindGroup(String groupSeq) {
		return dao.unblindGroup(groupSeq, session);
	}
	@Override
	public List<Food> manageFood(int cPage, int numPerPage) {
		return dao.manageFood(cPage, numPerPage, session);
	}
	@Override
	public int getMenCount() {
		return dao.getMenCount(session);
	}
	@Override
	public int getWomenCount() {
		return dao.getWomenCount(session);
	}
	@Override
	public List<User> statisticsUser() {
		return dao.statisticsUser(session);
	}
	@Override
	public List<Group> statisticsGroup() {
		return dao.statisticsGroup(session);
	}
	@Override
	public int foodTotalData() {
		return dao.foodTotalData(session);
	}
	@Override
	public int blockFood(String foodSeq) {
		return dao.blockFood(foodSeq, session);
	}
	@Override
	public int unblockFood(String foodSeq) {
		return dao.unblockFood(foodSeq, session);
	}
	@Override
	public List<Food> statisticsFood() {
		return dao.statisticsFood(session);
	}
	@Override
	public int likeMaxiumCount() {
		return dao.likeMaxiumCount(session);
	}
	@Override
	public List<ReportFeed> manageFeed(int cPage, int numPerPage) {
		return dao.manageFeed(cPage, numPerPage, session);
	}
	@Override
	public int feedTotalData() {
		return dao.feedTotalData(session);
	}
	@Override
	public int feedBlock(String seq) {
		return dao.feedBlock(seq, session);
	}
	@Override
	public int feedUnBlock(String seq) {
		return dao.feedUnBlock(seq, session);
	}
	@Override
	public List<ReportFeedComment> manageFeedComment(int cPage, int numPerPage) {
		return dao.manageFeedComment(cPage, numPerPage, session);
	}
	@Override
	public int feedCommentTotalData() {
		return dao.feedCommentTotalData(session);
	}
	@Override
	public int feedCommentBlock(String seq) {
		return dao.feedCommentBlock(seq, session);
	}
	@Override
	public int feedCommentUnBlock(String seq) {
		return dao.feedCommentUnBlock(seq, session);
	}
	@Override
	public List<ReportFoodComment> manageFoodComment(int cPage, int numPerPage) {
		return dao.manageFoodComment(cPage, numPerPage, session);
	}
	@Override
	public int foodCommentTotalData() {
		return dao.foodCommentTotalData(session);
	}
	@Override
	public int foodCommentBlock(String seq) {
		return dao.foodCommentBlock(seq, session);
	}
	@Override
	public int foodCommentUnBlock(String seq) {
		return dao.foodCommentUnBlock(seq, session);
	}
	@Override
	public List<ReportGroupBoard> manageGroupBoard(int cPage, int numPerPage) {
		return dao.manageGroupBoard(cPage, numPerPage, session);
	}
	@Override
	public int groupBoardTotalData() {
		return dao.groupBoardTotalData(session);
	}
	@Override
	public int groupBoardBlock(String seq) {
		return dao.groupBoardBlock(seq, session);
	}
	@Override
	public int groupBoardUnBlock(String seq) {
		return dao.groupBoardUnBlock(seq, session);
	}
	@Override
	public List<ReportGroupBoardComment> manageReportGroupBoardComment(int cPage, int numPerPage) {
		return dao.manageReportGroupBoardComment(cPage, numPerPage, session);
	}
	@Override
	public int reportGroupBoardCommentTotalData() {
		return dao.reportGroupBoardCommentTotalData(session);
	}
	@Override
	public int reportGroupBoardCommentBlock(String seq) {
		return dao.reportGroupBoardCommentBlock(seq,session);
	}
	@Override
	public int reportGroupBoardCommentUnBlock(String seq) {
		return dao.reportGroupBoardCommentUnBlock(seq, session);
	}
	@Override
	public int updatefood(Food food) {
		return dao.updatefood(session, food);
	}
	@Override
	public List<Faq> selectFAQ(int cPage, int numPerPage) {
		return dao.selectFAQ(session, cPage, numPerPage);
	}
	public List<Movie> movieList(int cPage, int numPerPage) {
		return dao.movieList(session,cPage,numPerPage);
	}
	@Override
	public int movieTotalData() {
		return dao.movieTotalData(session);
	}
	@Override
	public List<MovieTicketing> ticketingList(int cPage, int numPerPage) {
		return dao.ticketingList(session,cPage,numPerPage);
	}
	@Override
	public int tickectTotal() {
		return dao.tickectTotal(session);
	}
	
}

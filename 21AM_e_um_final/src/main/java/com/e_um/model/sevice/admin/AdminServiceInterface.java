package com.e_um.model.sevice.admin;

import java.util.List;

import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.serviceinfo.faq.Faq;
import com.e_um.model.vo.userInfo.report.ReportFeed;
import com.e_um.model.vo.userInfo.report.ReportFeedComment;
import com.e_um.model.vo.userInfo.report.ReportFoodComment;
import com.e_um.model.vo.userInfo.report.ReportGroupBoard;
import com.e_um.model.vo.userInfo.report.ReportGroupBoardComment;
import com.e_um.model.vo.userInfo.user.User;

public interface AdminServiceInterface {
	public List<User> manageUser(int cPage, int numPerPage);
	public int userTotalData();
	public int blockUser(String userId);
	public int unblockUser(String userId);
	public int getMenCount();
	public int getWomenCount();
	public List<User> statisticsUser();
	
	public List<Group> manageGroup(int cPage, int numPerPage);
	public int groupTotalData();
	public int blindGroup(String groupSeq);
	public int unblindGroup(String groupSeq);
	public List<Group>statisticsGroup();
	
	public List<Food> manageFood(int cPage, int numPerPage);
	public int foodTotalData();
	public int blockFood(String foodSeq);
	public int unblockFood(String foodSeq);
	public List<Food> statisticsFood();
	public int likeMaxiumCount ();
	
	public List<ReportFeed> manageFeed(int cPage, int numPerPage);
	public int feedTotalData();
	
	public int feedBlock(String seq);
	public int feedUnBlock(String seq);
	
	
	public List<ReportFeedComment> manageFeedComment(int cPage, int numPerPage);
	public int feedCommentTotalData();
	
	public int feedCommentBlock(String seq);
	public int feedCommentUnBlock(String seq);
	
	public List<ReportFoodComment> manageFoodComment(int cPage, int numPerPage);
	public int foodCommentTotalData();
	
	public int foodCommentBlock(String seq);
	public int foodCommentUnBlock(String seq); 
	
	public List<ReportGroupBoard> manageGroupBoard(int cPage, int numPerPage);
	public int groupBoardTotalData();
	
	public int groupBoardBlock(String seq);
	public int groupBoardUnBlock(String seq);
	
	public List<ReportGroupBoardComment> manageReportGroupBoardComment(int cPage, int numPerPage);
	public int reportGroupBoardCommentTotalData();
	
	public int reportGroupBoardCommentBlock(String seq);
	public int reportGroupBoardCommentUnBlock(String seq);
	public int updatefood(Food food); 
	
	public List<Faq> selectFAQ(int cPage, int numPerPage);
	
}

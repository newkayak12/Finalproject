package com.e_um.model.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.userInfo.user.User;


public interface AdminDaoInterface {
	public List<User> manageUser(int cPage, int numPerPage, SqlSessionTemplate session);
	public int userTotalData(SqlSessionTemplate session);
	public int blockUser(String userId, SqlSession session);
	public int unblockUser(String userId, SqlSession session);
	
	public int blindMovieComment(String userId, SqlSession session);
	public int blindFoodComment(String userId, SqlSession session);
	public int blindFeed(String userId, SqlSession session);
	public int blindFeedComment(String userId, SqlSession session);
	public int blindGroupComment(String userId, SqlSession session);
	public int blindGroupBoard(String userId, SqlSession session);
	
	public int getMenCount(SqlSession session);
	public int getWomenCount(SqlSession session);
	public List<User> statisticsUser(SqlSession session);
	public List<Group>statisticsGroup(SqlSession session);
	
	public int unblindMovieComment(String userId, SqlSession session);
	public int unblindFoodComment(String userId, SqlSession session);
	public int unblindFeed(String userId, SqlSession session);
	public int unblindFeedComment(String userId, SqlSession session);
	public int unblindGroupComment(String userId, SqlSession session);
	public int unblindGroupBoard(String userId, SqlSession session);
	
	public List<Group> manageGroup(int cPage, int numPerPage, SqlSessionTemplate session);
	public int groupTotalData(SqlSessionTemplate session);
	public int blindGroup(String groupSeq, SqlSessionTemplate session);
	public int unblindGroup(String groupSeq, SqlSessionTemplate session);
	
	public List<Food> manageFood(int cPage, int numPerPage,  SqlSessionTemplate session);
	public int foodTotalData(SqlSessionTemplate session);
}

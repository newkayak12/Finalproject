package com.e_um.model.sevice.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e_um.model.dao.admin.AdminDaoInterface;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.placeinfo.food.food.Food;
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

}

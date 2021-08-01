package com.e_um.model.sevice.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.admin.AdminDaoInterface;
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
	public int blockUser(String userId) {
		// TODO Auto-generated method stub
			int result = dao.blockUser(userId, session);
		return dao.blockUser(userId, session);
	}
	@Override
	public int unblockUser(String userId) {
		// TODO Auto-generated method stub
		return dao.unblockUser(userId, session);
	}

}

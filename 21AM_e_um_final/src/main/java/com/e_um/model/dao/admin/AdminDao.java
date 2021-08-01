package com.e_um.model.dao.admin;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	

}

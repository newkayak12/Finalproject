package com.e_um.model.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.userInfo.user.User;


public interface AdminDaoInterface {
	public List<User> manageUser(int cPage, int numPerPage, SqlSessionTemplate session);
	public int userTotalData(SqlSessionTemplate session);
	public int blockUser(String userId, SqlSession session);
	public int unblockUser(String userId, SqlSession session);
}

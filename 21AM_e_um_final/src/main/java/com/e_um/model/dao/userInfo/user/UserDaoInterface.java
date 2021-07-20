package com.e_um.model.dao.userInfo.user;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.userInfo.user.User;

public interface UserDaoInterface {
	public int idChecker(String userId, SqlSessionTemplate session);
	public int emailChecker(String userEmail, SqlSessionTemplate session);
	public int nickChecker(String userNick, SqlSessionTemplate session);
	public int InsertUser(User user, SqlSessionTemplate session);
	public int InsertInterest(User user, SqlSessionTemplate session);
	public User login(User user, SqlSessionTemplate session);
	public User verify(User user, SqlSessionTemplate session);
}	

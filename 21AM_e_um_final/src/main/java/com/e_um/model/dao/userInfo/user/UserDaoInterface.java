package com.e_um.model.dao.userInfo.user;

import java.util.List;

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
	public int changepw(User user, SqlSessionTemplate session);
	
	public int insertalarm1(User user, SqlSessionTemplate session);
	public int insertalarm2(User user, SqlSessionTemplate session);
	public int insertalarm3(User user, SqlSessionTemplate session);
	public int insertalarm4(User user, SqlSessionTemplate session);
	public int insertalarm5(User user, SqlSessionTemplate session);
	public int insertalarm6(User user, SqlSessionTemplate session);
	public int insertalarm7(User user, SqlSessionTemplate session);
	public int insertalarm8(User user, SqlSessionTemplate session);
	public int insertalarm9(User user, SqlSessionTemplate session);
	
	public List<User> recommandFriend(SqlSessionTemplate session, String userId);
	public int InsertKako(User user,SqlSessionTemplate session);
}	

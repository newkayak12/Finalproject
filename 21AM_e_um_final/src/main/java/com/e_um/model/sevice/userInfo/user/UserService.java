package com.e_um.model.sevice.userInfo.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e_um.model.dao.userInfo.user.UserDaoInterface;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService implements UserServiceInterface {
	@Autowired
	UserDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	@Transactional(readOnly = true)
	public int idChecker(String userId) {
		return dao.idChecker(userId, session);
	}
	@Override
	@Transactional(readOnly = true)
	public int nickChecker(String userNick) {
		return 0;
	}
	@Override
	@Transactional(readOnly = true)
	public int emailChecker(String userEmail) {
		return dao.emailChecker(userEmail, session);
	}
	@Override
	@Transactional()
	public int InsertUser(User user) {
		// TODO Auto-generated method stub
		int count = dao.InsertUser(user, session);
			count += dao.InsertInterest(user, session);
		return count;
	}
	@Override
	public User login(User user) {
		return dao.login(user, session);
	}
	@Override
	public User verify(User user) {
		// TODO Auto-generated method stub
		return dao.verify(user, session);
	}
	@Override
	public int changepw(User user) {
		// TODO Auto-generated method stub
		return dao.changepw(user, session);
	}
}

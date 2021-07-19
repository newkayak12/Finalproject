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
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	@Transactional(readOnly = true)
	public int emailChecker(String userEmail) {
		// TODO Auto-generated method stub
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
}

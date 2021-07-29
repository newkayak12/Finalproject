package com.e_um.model.sevice.userInfo.user;

import java.util.List;

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
			
			if(count>0) {
				dao.insertalarm1(user, session);
				dao.insertalarm2(user, session);
				dao.insertalarm3(user, session);
				dao.insertalarm4(user, session);
				dao.insertalarm5(user, session);
				dao.insertalarm6(user, session);
				dao.insertalarm7(user, session);
				dao.insertalarm8(user, session);
				dao.insertalarm9(user, session);
				dao.insertalarm10(user, session);
			}
		return count;
	}
	@Override
	@Transactional
	public User login(User user) {
		User users = dao.login(user, session);
		
		
		return users;
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
	@Override
	public List<User> recommandFriend( String userId) {
		// TODO Auto-generated method stub
		return dao.recommandFriend(session, userId);
	}
	@Override
	public int InsertKako(User user) {
		// TODO Auto-generated method stub
		int result = dao.InsertKako(user,session);
		if(result>0) {
			dao.insertalarm1(user, session);
			dao.insertalarm2(user, session);
			dao.insertalarm3(user, session);
			dao.insertalarm4(user, session);
			dao.insertalarm5(user, session);
			dao.insertalarm6(user, session);
			dao.insertalarm7(user, session);
			dao.insertalarm8(user, session);
			dao.insertalarm9(user, session);
			
		}
		
		return result;
	}
}

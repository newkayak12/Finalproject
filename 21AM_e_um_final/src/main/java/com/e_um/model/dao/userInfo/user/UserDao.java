package com.e_um.model.dao.userInfo.user;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class UserDao implements UserDaoInterface {@Override
	public int idChecker(String userId, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("user.idChecker",userId);
	}

	@Override
	public int emailChecker(String userEmail, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("user.emailChecker", userEmail);
	}

	@Override
	public int nickChecker(String userNick, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("user.nickChecker", userNick);
	}

	@Override
	public int InsertUser(User user, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("user.insertUser", user);
	}

	@Override
	public int InsertInterest(User user, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		HashMap info = new HashMap();
		info.put("userid", user.getUserId());
		info.put("interestName1",(String) user.getInterest().getProfileInterestName1());
		info.put("interestName2", (String) user.getInterest().getProfileInterestName2());
		info.put("interestName3",(String) user.getInterest().getProfileInterestName3());
		info.put("interestName4", (String) user.getInterest().getProfileInterestName4());
		info.put("interestName5", (String) user.getInterest().getProfileInterestName5());
		log.warn("{}",info);
		return session.insert("user.insertInterest", info);
	}

	

}

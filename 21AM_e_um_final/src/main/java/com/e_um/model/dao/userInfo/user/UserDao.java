package com.e_um.model.dao.userInfo.user;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public User login(User user, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		
		log.warn("dao{}",user);
		return session.selectOne("user.login", user);
	}

	@Override
	public User verify(User user, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("user.verify",user);
	}

	@Override
	public int changepw(User user, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("user.userchage",user);
	}

	@Override
	public int insertalarm1(User user, SqlSessionTemplate session) {
		// calendar
		
		return session.insert("user.insertAlarm1",user);
	}

	@Override
	public int insertalarm2(User user, SqlSessionTemplate session) {
		// chat
		return session.insert("user.insertAlarm2",user);	
	}

	@Override
	public int insertalarm3(User user, SqlSessionTemplate session) {
		// feed
		return session.insert("user.insertAlarm3",user);	
	}

	@Override
	public int insertalarm4(User user, SqlSessionTemplate session) {
		// feedlike
		return session.insert("user.insertAlarm4",user);	
	}

	@Override
	public int insertalarm5(User user, SqlSessionTemplate session) {
		// food
		return session.insert("user.insertAlarm5",user);	
	}

	@Override
	public int insertalarm6(User user, SqlSessionTemplate session) {
		// friend
		return session.insert("user.insertAlarm6",user);	
	}

	@Override
	public int insertalarm7(User user, SqlSessionTemplate session) {
		// group
		return session.insert("user.insertAlarm7",user);	
	}

	@Override
	public int insertalarm8(User user, SqlSessionTemplate session) {
		// movie
		return session.insert("user.insertAlarm8",user);	
	}
	
	@Override
	public int insertalarm9(User user, SqlSessionTemplate session) {
		// support
		return session.insert("user.insertAlarm9",user);	
	}

	@Override
	public List<User> recommandFriend(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("user.recommandFriend", userId);
	}

	@Override
	public int InsertKako(User user, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("user.insertUser", user);
	}

	

}

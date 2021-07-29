package com.e_um.model.sevice.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e_um.model.dao.communicateInfo.friend.FriendDaoInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FriendService implements FriendServiceInterface {
	@Autowired
	FriendDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public User selectUserOne(String userId) {
		return dao.selectUserOne(session, userId);
	}


	@Override
	@Transactional
	public int insertFriend(Map param) {
		
		Friend friend = Friend.builder().myId((String) param.get("myId")).friendId( (String)param.get("friendId")).build();
		int result = dao.insertFriend(session, friend);
		
		log.warn("{}", friend);
//		
		param.put("ref_seq", friend.getFriendSeq());
		
		if(result>0) {
			dao.insertAlarm(session, param);
		}
		return result;
	}


	@Override
	public List<User> selectAllUser(String userId,int index,int btnsu) {
		return dao.selectAllUser(session, userId, index, btnsu);
	}


	@Override
	public List<User> searchKeyword(Map param) {
		return dao.searchKeyword(session, param);
	}
	

	@Override
	public int isExist(Friend fr) {
		// TODO Auto-generated method stub
		return dao.isExist(fr, session);
	}


	@Override
	public List<Friend> fetchFriendList(String userId) {
		// TODO Auto-generated method stub
		return dao.fetchFriendList(userId, session);
	}
}

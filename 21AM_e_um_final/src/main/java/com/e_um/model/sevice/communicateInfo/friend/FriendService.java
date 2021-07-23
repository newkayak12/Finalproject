package com.e_um.model.sevice.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.communicateInfo.friend.FriendDaoInterface;
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
	public int insertFriend(Map param) {
		return dao.insertFriend(session, param);
	}


	@Override
	public List<User> selectAllUser(String userId,int index,int btnsu) {
		return dao.selectAllUser(session, userId, index, btnsu);
	}


	@Override
	public List<User> searchKeyword(Map param) {
		return dao.searchKeyword(session, param);
	}
}

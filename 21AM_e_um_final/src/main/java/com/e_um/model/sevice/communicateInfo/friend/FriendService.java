package com.e_um.model.sevice.communicateInfo.friend;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.communicateInfo.friend.FriendDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
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
	public List<User> selectAllUser() {
		return dao.selectAllUser(session);
	}
}

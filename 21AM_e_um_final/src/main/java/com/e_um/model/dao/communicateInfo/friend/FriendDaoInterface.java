package com.e_um.model.dao.communicateInfo.friend;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.userInfo.user.User;

public interface FriendDaoInterface {
	
	List<User> selectAllUser(SqlSessionTemplate session);

}

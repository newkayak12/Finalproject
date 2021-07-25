package com.e_um.model.dao.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.userInfo.user.User;

public interface FriendDaoInterface {
	
	User selectUserOne(SqlSessionTemplate session, String userId);
	
	int insertFriend(SqlSessionTemplate session, Friend friend);
	
	List<User> selectAllUser(SqlSessionTemplate session, String userId, int index, int btnsu);
	
	List<User> searchKeyword(SqlSessionTemplate session, Map param);
	
	int insertAlarm(SqlSessionTemplate session, Map param);

}

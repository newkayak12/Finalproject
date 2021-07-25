package com.e_um.model.dao.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import com.e_um.model.vo.communicateinfo.friend.Friend;

import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

public interface FriendDaoInterface {
	
	User selectUserOne(SqlSessionTemplate session, String userId);
	
	int insertFriend(SqlSessionTemplate session, Friend friend);
	
	List<User> selectAllUser(SqlSessionTemplate session, String userId, int index, int btnsu);
	
	List<User> searchKeyword(SqlSessionTemplate session, Map param);
	
	int insertAlarm(SqlSessionTemplate session, Map param);

	User selectProfileInfo(SqlSessionTemplate session, String profileId);
	
	List<Guestbook> selectGuestbook(SqlSessionTemplate session, String profileId);
	
	List<Map> selectAllFeed(SqlSessionTemplate session, String profileId, int index, int btnsu);
	
	int insertGuestbook(SqlSessionTemplate session, Guestbook gb);
	
	String selectGuestbookSeq(SqlSessionTemplate session, Guestbook gb);
	
	int insertGuestbookAlarm(SqlSessionTemplate session, Guestbook gb);

}

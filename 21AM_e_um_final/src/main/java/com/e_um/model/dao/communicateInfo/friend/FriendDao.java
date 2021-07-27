package com.e_um.model.dao.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FriendDao implements FriendDaoInterface {
	
	@Override
	public User selectUserOne(SqlSessionTemplate session, String profileId) {
		return session.selectOne("profile.selectProfileInfo",profileId);
	}


	@Override
	public int insertFriend(SqlSessionTemplate session,  Friend friend) {
		return session.insert("friend.insertFriend",friend);
	}


	@Override
	public List<User> selectAllUser(SqlSessionTemplate session, String userId, int index, int btnsu) {
		RowBounds row=new RowBounds((index-1)*btnsu,btnsu);
		return session.selectList("user.selectAllUser",userId,row);
	}


	@Override
	public List<User> searchKeyword(SqlSessionTemplate session, Map param) {
		return session.selectList("user.searchKeyword",param);
	}


	@Override
	public int insertAlarm(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		
		if(param.get("flag").equals("apply")) {
			return session.insert("alarm.insertfriend",param);			
		}else {
			return session.insert("alarm.insertfriend2",param);
		}
		
	}


	@Override
	public int isExist(Friend fr, SqlSessionTemplate session) {
		return session.selectOne("friend.isExist",fr);
	}


	@Override
	public List<Friend> fetchFriendList(String userId, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("friend.fetchFriendList", userId);
	}

}

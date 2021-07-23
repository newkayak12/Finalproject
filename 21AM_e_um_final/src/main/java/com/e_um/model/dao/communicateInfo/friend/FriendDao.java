package com.e_um.model.dao.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FriendDao implements FriendDaoInterface {
	
	@Override
	public User selectUserOne(SqlSessionTemplate session, String userId) {
		return session.selectOne("user.selectUserOne",userId);
	}


	@Override
	public int insertFriend(SqlSessionTemplate session, Map param) {
		return session.insert("friend.insertFriend",param);
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

}

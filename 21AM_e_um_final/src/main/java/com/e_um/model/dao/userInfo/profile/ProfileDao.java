package com.e_um.model.dao.userInfo.profile;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.dao.communicateInfo.friend.FriendDao;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ProfileDao implements ProfileDaoInterface {
	
	@Override
	public User selectProfileInfo(SqlSessionTemplate session, String profileId) {
		return session.selectOne("profile.selectProfileInfo",profileId);
	}
	
	
	@Override
	public List<Map> selectGuestbook(SqlSessionTemplate session, String profileId) {
		return session.selectList("profile.selectGuestbook",profileId);
	}


	@Override
	public List<Map> selectAllFeed(SqlSessionTemplate session, String profileId, int index, int btnsu) {
		RowBounds row=new RowBounds((index-1)*btnsu,btnsu);
		return session.selectList("profile.selectAllFeed",profileId,row);
	}


	@Override
	public int insertGuestbook(SqlSessionTemplate session, Guestbook gb) {
		return session.insert("profile.insertGuestbook",gb);
	}


	@Override
	public String selectGuestbookSeq(SqlSessionTemplate session, Guestbook gb) {
		return session.selectOne("profile.selectGuestbookSeq",gb);
	}


	@Override
	public int insertGuestbookAlarm(SqlSessionTemplate session, Guestbook gb) {
		return session.insert("profile.insertGuestbookAlarm",gb);

	}


	@Override
	public Friend friendCheck(SqlSessionTemplate session, Friend f) {
		return session.selectOne("profile.friendCheck",f);
	}


	@Override
	public List<Map> selectGuestbookAll(SqlSessionTemplate session, String profileId, int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("profile.selectGuestbookAll",profileId,row);
	}


	@Override
	public int guestbookListCount(SqlSessionTemplate session, String profileId) {
		return session.selectOne("profile.guestbookListCount",profileId);
	}


	@Override
	public int deleteGuestbook(SqlSessionTemplate session, String gbSeq) {
		return session.update("profile.deleteGuestbook",gbSeq);
	}

}

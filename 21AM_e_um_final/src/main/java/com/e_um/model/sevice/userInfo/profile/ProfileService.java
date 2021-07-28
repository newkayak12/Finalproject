package com.e_um.model.sevice.userInfo.profile;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.profile.ProfileDaoInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProfileService implements ProfileServiceInterface {
	
	@Autowired
	ProfileDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public User selectProfileInfo(String profileId) {
		return dao.selectProfileInfo(session, profileId);
	}


	@Override
	public List<Guestbook> selectGuestbook(String profileId) {
		return dao.selectGuestbook(session, profileId);
	}


	@Override
	public List<Map> selectAllFeed(String profileId, int index, int btnsu) {
		return dao.selectAllFeed(session, profileId, index, btnsu);
	}


	@Override
	public int insertGuestbook(Guestbook gb) {
		return dao.insertGuestbook(session, gb);
	}


	@Override
	public String selectGuestbookSeq(Guestbook gb) {
		return dao.selectGuestbookSeq(session, gb);
	}


	@Override
	public int insertGuestbookAlarm(Guestbook gb) {
		return dao.insertGuestbookAlarm(session, gb);
	}


	@Override
	public Friend friendCheck(Friend f) {
		return dao.friendCheck(session, f);
	}


	@Override
	public List<Guestbook> selectGuestbookAll(String profileId, int cPage, int numPerPage) {
		return dao.selectGuestbookAll(session, profileId, cPage, numPerPage);
	}


	@Override
	public int guestbookListCount(String profileId) {
		return dao.guestbookListCount(session, profileId);
	}

}

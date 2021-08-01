package com.e_um.model.sevice.userInfo.profile;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.profile.ProfileDaoInterface;
import com.e_um.model.vo.communicateinfo.feed.NoHasAFeed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.communicateinfo.likefeed.Likefeed;
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
	public List<Map> selectGuestbook(String profileId) {
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
	public List<Map> selectGuestbookAll(String profileId, int cPage, int numPerPage) {
		return dao.selectGuestbookAll(session, profileId, cPage, numPerPage);
	}


	@Override
	public int guestbookListCount(String profileId) {
		return dao.guestbookListCount(session, profileId);
	}


	@Override
	public int deleteGuestbook(String gbSeq) {
		return dao.deleteGuestbook(session, gbSeq);
	}


	@Override
	public NoHasAFeed selectFeed(String feedSeq) {
		return dao.selectFeed(session, feedSeq);
	}


	@Override
	public List<Likefeed> selectLike(String feedSeq) {
		return dao.selectLike(session, feedSeq);
	}


	@Override
	public List<FeedComment> selectComment(String feedSeq) {
		return dao.selectComment(session, feedSeq);
	}


	@Override
	public int deleteFeedComment(String fcSeq) {
		return dao.deleteFeedComment(session, fcSeq);
	}


	@Override
	public int deleteFeed(String feedSeq) {
		return dao.deleteFeed(session, feedSeq);
	}


	@Override
	public int feedUnlike(Likefeed likef) {
		return dao.feedUnlike(session, likef);
	}
	
	
	@Override
	public int feedLike(Likefeed likef, String profileId, String userNick) {
		return dao.feedLike(session, likef, profileId, userNick);
	}


	@Override
	public int writeFeedComment(FeedComment fc, String profileId, String userNick) {
		return dao.writeFeedComment(session, fc, profileId, userNick);
	}

}

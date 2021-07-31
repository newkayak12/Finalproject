package com.e_um.model.dao.userInfo.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.communicateinfo.feed.NoHasAFeed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.communicateinfo.likefeed.Likefeed;
import com.e_um.model.vo.userInfo.alarm.Alarm;
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


	@Override
	public NoHasAFeed selectFeed(SqlSessionTemplate session, String feedSeq) {
		return session.selectOne("profile.selectFeed",feedSeq);
	}


	@Override
	public List<Likefeed> selectLike(SqlSessionTemplate session, String feedSeq) {
		return session.selectList("profile.selectLike",feedSeq);
	}


	@Override
	public List<FeedComment> selectComment(SqlSessionTemplate session, String feedSeq) {
		return session.selectList("feed.feedComment",feedSeq);
	}


	@Override
	public int deleteFeedComment(SqlSessionTemplate session, String fcSeq) {
		return session.update("profile.deleteFeedComment",fcSeq);
	}


	@Override
	public int deleteFeed(SqlSessionTemplate session, String feedSeq) {
		return session.update("profile.deleteFeed",feedSeq);
	}


	@Override
	public int feedUnlike(SqlSessionTemplate session, Likefeed likef) {
		return session.delete("profile.feedUnlike",likef);
	}
	
	
	@Override
	public int feedLike(SqlSessionTemplate session, Likefeed likef, String profileId, String userNick) {
		int result=0;
		
		if(session.insert("profile.feedLike",likef)>0) {
			if(!profileId.equals("me")) {
				Map param=new HashMap();
				param.put("userId", profileId);
				param.put("friendNick", userNick);
				param.put("refSeq", likef.getFeedSeq());
				result=session.insert("alarm.insertFeedLike",param);
			}
		}
		return result;
	}


	@Override
	public int writeFeedComment(SqlSessionTemplate session, FeedComment fc, String profileId, String userNick) {
		int result=0;
		
		if(session.insert("profile.writeFeedComment",fc)>0) {
			if(!profileId.equals("me")) {
				Map param=new HashMap();
				param.put("userId", profileId);
				param.put("friendNick", userNick);
				param.put("refSeq", fc.getFeedSeqRef());
				result=session.insert("alarm.insertFeed",param);
			}
		}
		return result;
	}

}

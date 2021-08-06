package com.e_um.model.dao.userInfo.profile;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.feed.NoHasAFeed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.communicateinfo.likefeed.Likefeed;
import com.e_um.model.vo.userInfo.user.User;

public interface ProfileDaoInterface {
	
	User selectProfileInfo(SqlSessionTemplate session, String profileId);
	
	List<Map> selectGuestbook(SqlSessionTemplate session, String profileId);
	
	List<Map> selectAllFeed(SqlSessionTemplate session, String profileId, int index, int btnsu);
	
	int insertGuestbook(SqlSessionTemplate session, Guestbook gb);
	
	String selectGuestbookSeq(SqlSessionTemplate session, Guestbook gb);
	
	int insertGuestbookAlarm(SqlSessionTemplate session, Guestbook gb);

	Friend friendCheck(SqlSessionTemplate session, Friend f);
	
	List<Map> selectGuestbookAll (SqlSessionTemplate session, String profileId, int cPage, int numPerPage);
	
	int guestbookListCount(SqlSessionTemplate session, String profileId);
	
	int deleteGuestbook(SqlSessionTemplate session, String gbSeq);
	
	NoHasAFeed selectFeed(SqlSessionTemplate session, String feedSeq);
	
	List<Likefeed> selectLike(SqlSessionTemplate session, String feedSeq);
	
	List<FeedComment> selectComment(SqlSessionTemplate session, String feedSeq);
	
	int deleteFeedComment(SqlSessionTemplate session, String fcSeq);
	
	int deleteFeed(SqlSessionTemplate session, String feedSeq);
	
	int feedUnlike(SqlSessionTemplate session, Likefeed likef);
	
	int feedLike(SqlSessionTemplate session, Likefeed likef, String profileId, String userNick);
	
	int writeFeedComment(SqlSessionTemplate session, FeedComment fc, String profileId, String userNick);
	
	int insertFeed(SqlSessionTemplate session, NoHasAFeed nhf);
	
	int modifyFeed(SqlSessionTemplate session, NoHasAFeed nhf);
	
	int writeFeed2ndComment(SqlSessionTemplate session, FeedComment fc, String refCommentId, String userNick);

}

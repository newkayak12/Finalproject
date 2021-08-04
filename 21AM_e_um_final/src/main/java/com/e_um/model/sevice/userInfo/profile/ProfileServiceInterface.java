package com.e_um.model.sevice.userInfo.profile;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.communicateinfo.feed.NoHasAFeed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.communicateinfo.likefeed.Likefeed;
import com.e_um.model.vo.userInfo.user.User;

public interface ProfileServiceInterface {
	
User selectProfileInfo(String profileId);
	
	List<Map> selectGuestbook(String profileId);
	
	List<Map> selectAllFeed(String profileId, int index, int btnsu);
	
	int insertGuestbook(Guestbook gb);
	
	String selectGuestbookSeq(Guestbook gb);
	
	int insertGuestbookAlarm(Guestbook gb);

	Friend friendCheck(Friend f);
	
	List<Map> selectGuestbookAll(String profileId, int cPage, int numPerPage);
	
	int guestbookListCount(String profileId);
	
	int deleteGuestbook(String gbSeq);
	
	NoHasAFeed selectFeed(String feedSeq);
	
	List<Likefeed> selectLike(String feedSeq);
	
	List<FeedComment> selectComment(String feedSeq);
	
	int deleteFeedComment(String fcSeq);
	
	int deleteFeed(String feedSeq);
	
	int feedUnlike(Likefeed likef);
	
	int feedLike(Likefeed likef, String profileId, String userNick);
	
	int writeFeedComment(FeedComment fc, String profileId, String userNick);
	
	int insertFeed(NoHasAFeed nhf);

}

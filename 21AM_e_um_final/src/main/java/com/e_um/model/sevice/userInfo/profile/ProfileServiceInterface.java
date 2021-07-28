package com.e_um.model.sevice.userInfo.profile;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

public interface ProfileServiceInterface {
	
User selectProfileInfo(String profileId);
	
	List<Guestbook> selectGuestbook(String profileId);
	
	List<Map> selectAllFeed(String profileId, int index, int btnsu);
	
	int insertGuestbook(Guestbook gb);
	
	String selectGuestbookSeq(Guestbook gb);
	
	int insertGuestbookAlarm(Guestbook gb);

	Friend friendCheck(Friend f);
	
	List<Guestbook> selectGuestbookAll(String profileId, int cPage, int numPerPage);
	
	int guestbookListCount(String profileId);

}

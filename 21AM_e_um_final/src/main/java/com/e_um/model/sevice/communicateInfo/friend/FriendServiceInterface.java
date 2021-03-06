package com.e_um.model.sevice.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

public interface FriendServiceInterface {
	
	User selectUserOne(String userId);
	
	int insertFriend(Map param );
	
	List<User> selectAllUser(String userId, int index, int btnsu);
	
	List<User> searchKeyword(Map param);

	int isExist(Friend fr);
	
	List<Friend> fetchFriendList(String userId);
}

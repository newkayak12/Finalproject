package com.e_um.model.sevice.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.userInfo.user.User;

public interface FriendServiceInterface {
	
	List<User> selectAllUser(String userId);
	
	User selectUserOne(String userId);
	
	int insertFriend(Map param);

}

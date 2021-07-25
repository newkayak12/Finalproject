package com.e_um.model.sevice.communicateInfo.friend;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.userInfo.user.User;

public interface FriendServiceInterface {
	
	User selectUserOne(String userId);
	
	int insertFriend(Map param );
	
	List<User> selectAllUser(String userId,int index,int btnsu);
	
	List<User> searchKeyword(Map param);

}

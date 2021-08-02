package com.e_um.model.sevice.userInfo.mypage;

import java.util.Map;

import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

public interface MypageServiceInterface {
	
	int changeNick(User u);
	
	int changePw(User u);
	
	int changeAddr(User u);
	
	Interest selectInterest(String userId);
	
	int changeInterest(Map param);

}

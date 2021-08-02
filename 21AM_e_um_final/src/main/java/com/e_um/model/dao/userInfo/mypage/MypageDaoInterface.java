package com.e_um.model.dao.userInfo.mypage;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

public interface MypageDaoInterface {
	
	int changeNick(SqlSessionTemplate session, User u);
	
	int changePw(SqlSessionTemplate session, User u);
	
	int changeAddr(SqlSessionTemplate session, User u);
	
	Interest selectInterest(SqlSessionTemplate session, String userId);

}

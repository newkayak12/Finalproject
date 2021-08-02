package com.e_um.model.dao.userInfo.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.dao.communicateInfo.friend.FriendDao;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MypageDao implements MypageDaoInterface {
	
	@Override
	public int changeNick(SqlSessionTemplate session, User u) {
		return session.update("mypage.changeNick",u);
	}

	
	@Override
	public int changePw(SqlSessionTemplate session, User u) {
		return session.update("mypage.changePw",u);
	}


	@Override
	public int changeAddr(SqlSessionTemplate session, User u) {
		return session.update("mypage.changeAddr",u);
	}
	
	
	@Override
	public int changeEmail(SqlSessionTemplate session, User u) {
		return session.update("mypage.changeEmail",u);
	}


	@Override
	public Interest selectInterest(SqlSessionTemplate session, String userId) {
		return session.selectOne("mypage.selectInterest",userId);
	}


	@Override
	public int changeInterest(SqlSessionTemplate session, Map param) {
		return session.update("mypage.changeInterest",param);
	}


	@Override
	public List<MovieTicketing> selectMovieTicketingInfo(SqlSessionTemplate session, String userId) {
		return session.selectList("mypage.selectMovieTicketingInfo",userId);
	}

}

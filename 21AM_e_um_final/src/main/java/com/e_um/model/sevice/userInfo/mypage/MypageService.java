package com.e_um.model.sevice.userInfo.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.mypage.MypageDaoInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.userInfo.alarmToggle.AlarmToggle;
import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MypageService implements MypageServiceInterface {
	
	@Autowired
	MypageDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate session;

	
	@Override
	public int changeNick(User u) {
		return dao.changeNick(session, u);
	}


	@Override
	public int changePw(User u) {
		return dao.changePw(session, u);
	}


	@Override
	public int changeAddr(User u) {
		return dao.changeAddr(session, u);
	}
	
	
	@Override
	public int changeEmail(User u) {
		return dao.changeEmail(session, u);
	}


	@Override
	public Interest selectInterest(String userId) {
		return dao.selectInterest(session, userId);
	}


	@Override
	public int changeInterest(Map param) {
		return dao.changeInterest(session, param);
	}


	@Override
	public List<MovieTicketing> selectMovieTicketingInfo(String userId, int cPage, int numPerPage) {
		return dao.selectMovieTicketingInfo(session, userId, cPage, numPerPage);
	}


	@Override
	public int selectMovieTicketingCount(String userId) {
		return dao.selectMovieTicketingCount(session, userId);
	}


	@Override
	public int cancelMovie(String movieReservNum) {
		return dao.cancelMovie(session, movieReservNum);
	}


	@Override
	public List<Map> selectFriendList(String userId) {
		return dao.selectFriendList(session, userId);
	}


	@Override
	public int blockFriend(Friend f) {
		return dao.blockFriend(session, f);
	}


	@Override
	public List<Map> selectApplyFriendList(String userId) {
		return dao.selectApplyFriendList(session, userId);
	}


	@Override
	public List<Map> selectblockFriendList(String userId) {
		return dao.selectblockFriendList(session, userId);
	}


	@Override
	public int blockCancel(Friend f) {
		return dao.blockCancel(session, f);
	}


	@Override
	public List<Map> selectFoodBookingInfo(String userId, int cPage, int numPerPage) {
		return dao.selectFoodBookingInfo(session, userId, cPage, numPerPage);
	}


	@Override
	public int selectFoodBookingCount(String userId) {
		return dao.selectFoodBookingCount(session, userId);
	}


	@Override
	public int cancelFood(String foodBookingSeq) {
		return dao.cancelFood(session, foodBookingSeq);
	}


	@Override
	public int changeProfilePhoto(User u) {
		return dao.changeProfilePhoto(session, u);
	}


	@Override
	public List<AlarmToggle> selectAlarmToggle(String userId) {
		return dao.selectAlarmToggle(session, userId);
	}


	@Override
	public int alarmOnOff(AlarmToggle at) {
		return dao.alarmOnOff(session, at);
	}

}

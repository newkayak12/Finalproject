package com.e_um.model.dao.userInfo.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.userInfo.alarmToggle.AlarmToggle;
import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.scheduler.NoHasAScheduler;
import com.e_um.model.vo.userInfo.user.User;

public interface MypageDaoInterface {
	
	int changeNick(SqlSessionTemplate session, User u);
	
	int changePw(SqlSessionTemplate session, User u);
	
	int changeAddr(SqlSessionTemplate session, User u);
	
	int changeEmail(SqlSessionTemplate session, User u);
	
	Interest selectInterest(SqlSessionTemplate session, String userId);
	
	int changeInterest(SqlSessionTemplate session, Map param);
	
	List<MovieTicketing> selectMovieTicketingInfo(SqlSessionTemplate session, String userId, int cPage, int numPerPage);
	
	int selectMovieTicketingCount(SqlSessionTemplate session, String userId);
	
	int cancelMovie(SqlSessionTemplate session, String movieReservNum);
	
	List<Map> selectFriendList(SqlSessionTemplate session, String userId);
	
	int blockFriend(SqlSessionTemplate session, Friend f);
	
	List<Map> selectApplyFriendList(SqlSessionTemplate session, String userId);
	
	List<Map> selectblockFriendList(SqlSessionTemplate session, String userId);
	
	int blockCancel(SqlSessionTemplate session, Friend f);
	
	List<Map> selectFoodBookingInfo(SqlSessionTemplate session, String userId, int cPage, int numPerPage);
	
	int selectFoodBookingCount(SqlSessionTemplate session, String userId);
	
	int cancelFood(SqlSessionTemplate session, String foodBookingSeq);
	
	int changeProfilePhoto(SqlSessionTemplate session, User u);
	
	List<AlarmToggle> selectAlarmToggle(SqlSessionTemplate session, String userId);
	
	int alarmOnOff(SqlSessionTemplate session, AlarmToggle at);
	
	List<Map> selectDate(SqlSessionTemplate session, String userId);
	
	List<Map> selectSchedule(SqlSessionTemplate session, String userId);
	
	int deleteSchedule(SqlSessionTemplate session, String schedulerSeq);
	
	int insertSchedule(SqlSessionTemplate session, NoHasAScheduler nhs);

}

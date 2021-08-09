package com.e_um.model.sevice.userInfo.mypage;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.userInfo.alarmToggle.AlarmToggle;
import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

public interface MypageServiceInterface {
	
	int changeNick(User u);
	
	int changePw(User u);
	
	int changeAddr(User u);
	
	int changeEmail(User u);
	
	Interest selectInterest(String userId);
	
	int changeInterest(Map param);
	
	List<MovieTicketing> selectMovieTicketingInfo(String userId, int cPage, int numPerPage);
	
	int selectMovieTicketingCount(String userId);
	
	int cancelMovie(String movieReservNum);
	
	List<Map> selectFriendList(String userId);
	
	int blockFriend(Friend f);
	
	List<Map> selectApplyFriendList(String userId);
	
	List<Map> selectblockFriendList(String userId);
	
	int blockCancel(Friend f);
	
	List<Map> selectFoodBookingInfo(String userId, int cPage, int numPerPage);
	
	int selectFoodBookingCount(String userId);
	
	int cancelFood(String foodBookingSeq);
	
	int changeProfilePhoto(User u);
	
	List<AlarmToggle> selectAlarmToggle(String userId);
	
	int alarmOnOff(AlarmToggle at);

}

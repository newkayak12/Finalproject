package com.e_um.controller.communicateInfo.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.communicateInfo.friend.FriendServiceInterface;
import com.e_um.model.sevice.userInfo.profile.ProfileServiceInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FriendController {
	
	@Autowired
	FriendServiceInterface service;
	
	@Autowired
	ProfileServiceInterface proService;
	
	
	@RequestMapping("/friend/main")
	public String friendMain() {
		return "friend";
	}

	
	@RequestMapping("/friend/openmodal/start")
	public String selectUserOne(HttpServletRequest rq, @RequestParam(value="profileId", required=false) String profileId, Model m) {
		User user=(User)rq.getSession().getAttribute("userSession");
		m.addAttribute("friend",service.selectUserOne(profileId));
		
		//-----친구 신청 관련 버튼 처리 로직
		//일단 default 버튼은 친구 신청 버튼임
		String flag="applyFri";
		
		Friend f=Friend.builder().myId(user.getUserId()).friendId(profileId).build();
//				log.warn("userId가 profileId한테 친구 신청 했니? : {}",service.friendCheck(f));
		Friend userCk=proService.friendCheck(f);
		
		f=Friend.builder().myId(profileId).friendId(user.getUserId()).build();
		Friend profileCk=proService.friendCheck(f);
		
		if(userCk!=null) {
			//user가 profile한테 친구 신청한 상태
			
			if(profileCk!=null) {
				//user와 profile이 서로 친구인 상태
				
				//block 여부 체크해야 함 - profile이 user를 차단했으면 버튼 표시 X(userId가 profileId를 차단했으면 아예 친구 찾기 목록에 나오지 않으므로 처리할 필요 없음)
				if(profileCk.getFriendBlockFlag().equals("block")) {
					//profile이 userId 차단
					//버튼 표시 X
					flag="blockedFri";
					
				} else {
					//profile이 user를 차단하지 않고 서로 친구인 상태(userId가 profile을 차단한 건 상관 무)
					//'체크표시 친구' 비활성화 버튼
					flag="friend";
				}
				
			} else {
				//user만 profile한테 친구 신청한 상태
				//'친구 요청됨' 비활성화 버튼
				flag="alreadyApply";
			}
			
		} else {
			//user가 profile한테 친구 신청하지 않은 상태
			
			if(profileCk!=null) {
				//profile만 user에게 친구 신청한 상황
				//'친구 수락' 활성 버튼
				flag="acceptFri";
			}
		}
		m.addAttribute("friFlag",flag);
		
		return "components/friend/userInfoModal";
	}
	
	
	@ResponseBody
	@RequestMapping("/friend/applyfriend/start")
	public int applyFriend(HttpServletRequest rq, @RequestParam(value="friendId", required=false) String friendId,
			@RequestParam(value="flag", required=false, defaultValue="apply") String flag) {
		User user=(User)rq.getSession().getAttribute("userSession");
		Map param=new HashMap();
		param.put("myId", user.getUserId());
		param.put("myNick", user.getUserNick());
		param.put("friendId", friendId);
		param.put("flag", flag);
		return service.insertFriend(param);
	}
	
	
	@RequestMapping("/friend/infiniteScroll")
	public String infiniteUser(HttpServletRequest rq, @RequestParam(value="index", required=false) int index, Model m){
		User user=(User)rq.getSession().getAttribute("userSession");
		int btnsu=6;
		/*
		 * for(User u:service.selectAllUser(user.getUserId(),index,btnsu)) {
		 * log.warn("infinite user: {}",u); }
		 */
		m.addAttribute("list", service.selectAllUser(user.getUserId(),index,btnsu));
		return "components/friend/friendBtn";
	}
	
	
	@RequestMapping("/friend/searchKeyword")
	public String searchKeyword(HttpServletRequest rq, Model m,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="gender", required=false) String gender,
			@RequestParam(value="address", required=false) String address,
			@RequestParam(value="age", required=false) String ageStr,
			@RequestParam(value="interestArr[]", required=false) List<String> interestArr) {
		
		User user=(User)rq.getSession().getAttribute("userSession");
		
//		log.warn("검색어: {}",keyword);
//		log.warn("성별: {}",gender);
//		log.warn("주소: {}",address);
//		log.warn("나이: {}",ageStr);
//		log.warn("관심사: {}",interestArr);
		
		if(gender!=null) {
			switch(gender) {
			case "남": gender="M"; break;
			case "여": gender="F";
			}			
		}
		
		int age=0;
		if(ageStr!=null) {
			switch(ageStr) {
			case "20대": age=20; break;
			case "30대": age=30; break;
			case "40대": age=40;
			}			
		}
		int ageEnd=age+9;
		
//		log.warn("--성별: {}",gender);
//		log.warn("--나이: {}",age);
//		log.warn("--나이+9: {}",ageEnd);
		
		Map param=new HashMap();
		param.put("userId", user.getUserId());
		param.put("keyword", keyword);
		param.put("gender", gender);
		param.put("address", address);
		param.put("age", age);
		param.put("ageEnd", ageEnd);
		param.put("interestArr", interestArr);
		
//		log.warn("list 통째로 검색 결과: {}",service.searchKeyword(param));
//		log.warn("list 통째로 boolean: {}",service.searchKeyword(param).size());
//		for(User u:service.searchKeyword(param)) {			
//			log.warn("검색 결과: {}",u);
//		}
		
		if(service.searchKeyword(param).size()!=0) {
			m.addAttribute("list",service.searchKeyword(param));
			return "components/friend/friendBtn";
		}else {
			m.addAttribute("msg", "검색 결과가 없습니다.");
			return "common/msgDiv";
		}
		
	}
	
	
	@RequestMapping("/friend/isexist")
	@ResponseBody
	public int isExist(String friendId, HttpServletRequest rq) {
		User user = (User) (rq.getSession().getAttribute("userSession"));
		Friend friend = Friend.builder().myId( user.getUserId() ).friendId(friendId).build();
		return service.isExist(friend);
	}
	
	@RequestMapping("/friend/fetchfriendlist")
	@ResponseBody
	public List<Friend> fetchFriendList(String userId) {
		
		return service.fetchFriendList(userId);
	}

}

package com.e_um.controller.communicateInfo.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.communicateInfo.friend.FriendServiceInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FriendController {
	
	@Autowired
	FriendServiceInterface service;
	
	
	@RequestMapping("/friend/main")
	public String friendMain() {
		return "friend";
	}

	
	@RequestMapping("/friend/openmodal/start")
	public String selectUserOne(@RequestParam(value="userId", required=false) String userId, Model m) {
//		log.warn("boxId: {}",userId);
//		log.warn("boxId: {}",service.selectUserOne(userId));
		m.addAttribute("friend",service.selectUserOne(userId));
//		m.addAttribute("userId",userId);
		return "components/friend/userInfoModal";
	}
	
	
	@ResponseBody
	@RequestMapping("/friend/applyfriend/start")
	public int applyFriend(HttpServletRequest rq, @RequestParam(value="friendId", required=false) String friendId) {
		User user=(User)rq.getSession().getAttribute("userSession");
		Map param=new HashMap();
		param.put("myId", user.getUserId());
		param.put("friendId", friendId);
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
	
	@RequestMapping("/friend/openProfile/{profileId}")
	public String selectProfileInfo(@PathVariable("profileId") String profileId, Model m, HttpServletRequest rq){
		User user=(User)rq.getSession().getAttribute("userSession");
		m.addAttribute("userId",user.getUserId());
//		log.warn("profileId: {}",profileId);
		m.addAttribute("profileInfo",service.selectProfileInfo(profileId));
//		log.warn("profileInfo: {}",service.selectProfileInfo(profileId));
		m.addAttribute("guestbookList",service.selectGuestbook(profileId));
//		log.warn("guestbookList: {}",service.selectGuestbook(profileId));
		
		//1. userId가 profileId에게 친구 신청한 상황인 경우 '친구 요청됨' 비활성화 버튼
		Friend f=Friend.builder().myId(user.getUserId()).friendId(profileId).build();
//		log.warn("userId가 profileId한테 친구 신청 했니? : {}",service.friendCheck(f));
		Friend userCk=service.friendCheck(f);
		
		if(userCk!=null) {
			//user가 profile한테 친구 신청한 상태
			f=Friend.builder().myId(profileId).friendId(user.getUserId()).build();
			Friend profileCk=service.friendCheck(f);
			
			if(profileCk!=null) {
				//user와 profile이 서로 친구인 상태
				
				//block 여부 체크해야 함 - profileId가 userId를 차단했으면 버튼 표시 X(userId가 profileId를 차단했으면 아예 친구 찾기 목록에 나오지 않으므로 처리할 필요 없음)
				if(profileCk.getFriendBlockFlag().equals("block")) {
					//profile이 userId 차단
					
				} else {
					//profile이 userId를 차단하지 않고 서로 친구인 상태(userId가 profile을 차단한 건 상관 무)
					//'체크표시 친구' 비활성화 버튼
					
				}
			}
		} else {
			
		}
		//2. profileId가 userId에게 친구 신청한 상황인 경우 '친구 수락' 활성 버튼, 클릭 이벤트 주기
		
		//3. 서로 친구일 경우 
		
		return "profile";
	}
	
	
	@RequestMapping("/friend/infiniteFeedScroll")
	public String infiniteFeed(HttpServletRequest rq, @RequestParam(value="index", required=false) int index, Model m,
			@RequestParam(value="profileId", required=false) String profileId){
		int btnsu=6;
		m.addAttribute("list", service.selectAllFeed(profileId,index,btnsu));
		/*
		 * log.warn("하 뭔 일이야: {}",service.selectAllFeed(profileId,index,btnsu));
		 * log.warn("하 뭔 일이야 list.length: {}",service.selectAllFeed(profileId,index,
		 * btnsu).size());
		 */
		return "components/profile/feedBtn";
	}
	
	
	@RequestMapping("/friend/write/start")
	public String openWriteModal(@RequestParam(value="flag", required=false) String flag, Model m,
			@RequestParam(value="profileId", required=false) String profileId) {
//		log.warn("flag가 guestbook이니? : {}",flag=="guestbook");
//		log.warn("profileId: {}",profileId);
		if(flag.equals("guestbook")) {
			m.addAttribute("profileId",profileId);
			return "components/profile/writeGuestbookModal";
		} else {
			return "components/profile/writeFeedModal";
		}
	}
	
	
	@RequestMapping("/friend/writeGuestbook/end")
	public String insertGuestbook(HttpServletRequest rq, Model m,
			@RequestParam(value="userIdReceiver", required=false) String userIdReceiver,
			@RequestParam(value="guestbookComment", required=false) String guestbookComment) {
//		log.warn("userIdReceiver: {}",userIdReceiver);
//		log.warn("guestbookComment: {}",guestbookComment);
		User user=(User)rq.getSession().getAttribute("userSession");
		String userIdWriter=user.getUserId();
		Guestbook gb=Guestbook.builder().userIdReceiver(userIdReceiver).userIdWriter(userIdWriter).guestbookComment(guestbookComment).build();
		
		int result=service.insertGuestbook(gb);
		
		String msg="방명록이 등록되지 않았습니다.";
		m.addAttribute("loc","/friend/openProfile/"+userIdReceiver);
		if(result>0) {
			String guestbookSeq=service.selectGuestbookSeq(gb);
//			log.warn("guestbookSeq: {}",guestbookSeq);
			gb=Guestbook.builder().guestbookSeq(guestbookSeq).userIdReceiver(userIdReceiver).userIdWriter(userIdWriter).build();
			int result2=service.insertGuestbookAlarm(gb);
			
			if(result2>0) {
				msg="방명록이 등록되었습니다.";
			}
		}
		m.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/friend/isexist")
	@ResponseBody
	public int isExist(String friendId, HttpServletRequest rq) {
		User user = (User) (rq.getSession().getAttribute("userSession"));
		Friend friend = Friend.builder().myId( user.getUserId() ).friendId(friendId).build();
		return service.isExist(friend);
	}

}

package com.e_um.controller.userInfo.profile;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.e_um.model.sevice.userInfo.profile.ProfileServiceInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProfileController {
	
	@Autowired
	ProfileServiceInterface service;
	
	@RequestMapping("user/profile/start")
	public String gotoProfile(String userId) {
		return"";
	}
	
	
	@RequestMapping("/profile/open/{profileId}")
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
	
	
	@RequestMapping("/profile/infiniteFeedScroll")
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
	
	
	@RequestMapping("/profile/write/start")
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
	
	
	@RequestMapping("/profile/writeGuestbook/end")
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

}

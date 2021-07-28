package com.e_um.controller.userInfo.profile;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.e_um.common.pagebar.PageBar;
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
	
	
	@RequestMapping("/profile/open/{profileId}")
	public String selectProfileInfo(@PathVariable("profileId") String profileId, Model m, HttpServletRequest rq,
			@RequestParam(value="feedSeq", defaultValue = "none", required=false) String feedSeq){
		m.addAttribute("feedSeq", feedSeq);
		User user=(User)rq.getSession().getAttribute("userSession");
		m.addAttribute("userId",user.getUserId());
//		log.warn("profileId: {}",profileId);
		m.addAttribute("profileInfo",service.selectProfileInfo(profileId));
//		log.warn("profileInfo: {}",service.selectProfileInfo(profileId));
		m.addAttribute("guestbookList",service.selectGuestbook(profileId));
//		log.warn("guestbookList: {}",service.selectGuestbook(profileId));
		
		
		//-----친구 신청 관련 버튼 처리 로직
		//일단 default 버튼은 친구 신청 버튼임
		String flag="applyFri";
		
		Friend f=Friend.builder().myId(user.getUserId()).friendId(profileId).build();
//		log.warn("userId가 profileId한테 친구 신청 했니? : {}",service.friendCheck(f));
		Friend userCk=service.friendCheck(f);
		
		f=Friend.builder().myId(profileId).friendId(user.getUserId()).build();
		Friend profileCk=service.friendCheck(f);
		
		if(userCk!=null) {
			//user가 profile한테 친구 신청한 상태
			
			if(profileCk!=null) {
				//user와 profile이 서로 친구인 상태
				
				//block 여부 체크해야 함 - profile이 user를 차단했으면 버튼 표시 X(user가 profile를 차단했으면 아예 친구 찾기 목록에 나오지 않으므로 처리할 필요 없음)
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
	
	
	@RequestMapping("/profile/writeFeed/end")
	public String insertFeed(HttpServletRequest rq, Model m,
			@RequestParam(value="feedImage", required=false) MultipartFile[] feedImage
			) {
		User user=(User)rq.getSession().getAttribute("userSession");
		log.info("파일명: "+feedImage[0].getOriginalFilename());
		log.info("파일 크기: {}",feedImage[0].getSize());
		log.info("파일명: {}",feedImage[1].getOriginalFilename()=="");
		log.info("파일 크기: {}",feedImage[1].getSize());
		log.info("파일명: {}",feedImage[2].getOriginalFilename()==null);
		log.info("파일 크기: {}",feedImage[2].getSize());
		
		return "";
	}
	
	
	@RequestMapping("/profile/open/loadAllGb")
	public ModelAndView selectGuestbookAll(
			@RequestParam(value="profileId", required=false) String profileId,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerPage", defaultValue="10") int numPerPage,
			ModelAndView mv, HttpServletRequest rq) {
		mv.addObject("gbList",service.selectGuestbookAll(profileId,cPage,numPerPage));
		int totalData=service.guestbookListCount(profileId);
		String pageBar=PageBar.getPageBar(profileId, totalData, cPage, numPerPage, rq.getContextPath()+"/profile/open/loadAllGb", "fn_paging");
		
		log.error(pageBar);
		mv.setViewName("components/profile/guestbookAllModal");
		mv.addObject("pageBar",pageBar);
		
		return mv;
	}

}

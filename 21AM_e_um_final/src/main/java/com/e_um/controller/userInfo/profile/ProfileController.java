package com.e_um.controller.userInfo.profile;

import static com.e_um.common.renamePolicy.RenamePolicy.renamepolicy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.e_um.common.pagebar.PageBar;
import com.e_um.model.sevice.userInfo.profile.ProfileServiceInterface;
import com.e_um.model.vo.communicateinfo.feed.NoHasAFeed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.communicateinfo.likefeed.Likefeed;
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
		m.addAttribute("loc","/profile/open/"+userIdReceiver);
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
	public String insertFeed(HttpServletRequest rq, String feedContents, Model m,
			@RequestParam("file") MultipartFile[] files) {
		User user=(User)rq.getSession().getAttribute("userSession");
		//log.info("feedContents: {}",feedContents);
		String[] newFileName={null, null, null};
		for(int i=0;i<files.length;i++) {
			newFileName[i]=renamepolicy(rq, files[i], "feed");
		}
		NoHasAFeed nhf=NoHasAFeed.builder().feederId(user.getUserId()).feedContents(feedContents).feedImage1(newFileName[0]).feedImage2(newFileName[1]).feedImage3(newFileName[2]).build();
		
		m.addAttribute("loc", "/profile/open/"+user.getUserId());
		if(service.insertFeed(nhf)>0) {
			m.addAttribute("msg", "피드가 등록되었습니다.");
		}else {
			m.addAttribute("msg", "피드 등록에 실패했습니다.");
		}
		return "common/msg";
	}
	
	
	@RequestMapping("/profile/open/loadAllGb")
	public ModelAndView selectGuestbookAll(
			@RequestParam(value="profileId", required=false) String profileId,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerPage", defaultValue="10") int numPerPage,
			ModelAndView mv, HttpServletRequest rq) {
		mv.addObject("profileId", profileId);
		mv.addObject("gbList",service.selectGuestbookAll(profileId,cPage,numPerPage));
		int totalData=service.guestbookListCount(profileId);
		String pageBar=PageBar.getPageBar(profileId, totalData, cPage, numPerPage, rq.getContextPath()+"/profile/open/loadAllGb", "fn_paging");
//		log.error(pageBar);
		mv.setViewName("components/profile/guestbookAllModal");
		mv.addObject("pageBar",pageBar);
		
		return mv;
	}
	
	
	@RequestMapping("/profile/deleteGb")
	@ResponseBody
	public int deleteGuestbook(@RequestParam(value="gbSeq", required=false) String gbSeq) {
		return service.deleteGuestbook(gbSeq);
	}
	
	
	@RequestMapping("/profile/openFeedModal")
	public String openFeedModal(@RequestParam(value="feedSeq", required=false) String feedSeq, Model m) {
		m.addAttribute("feed",service.selectFeed(feedSeq));
//		log.warn("feed: {}",service.selectFeed(feedSeq));
		m.addAttribute("like", service.selectLike(feedSeq));
//		log.warn("like: {}",service.selectLike(feedSeq));
		m.addAttribute("comment",service.selectComment(feedSeq));
//		log.warn("comment: {}",service.selectComment(feedSeq));
		
//		return "";
		return "components/profile/feedDetailModal";
	}
	
	
	@RequestMapping("/profile/deleteFeedComment")
	@ResponseBody
	public int deleteFeedComment(@RequestParam(value="fcSeq", required=false) String fcSeq) {
		return service.deleteFeedComment(fcSeq);
	}
	
	
	@RequestMapping("/profile/deleteFeed")
	@ResponseBody
	public int deleteFeed(@RequestParam(value="feedSeq", required=false) String feedSeq) {
		return service.deleteFeed(feedSeq);
	}
	
	
	@RequestMapping("/profile/unlike")
	@ResponseBody
	public int feedUnlike(@RequestParam(value="feedSeq", required=false) String feedSeq, HttpServletRequest rq) {
		User user=(User)rq.getSession().getAttribute("userSession");
		Likefeed likef=Likefeed.builder().feedSeq(feedSeq).likeFeedId(user.getUserId()).build();
		return service.feedUnlike(likef);
	}
	
	
	@RequestMapping("/profile/like")
	@ResponseBody
	public int feedLike(@RequestParam(value="feedSeq", required=false) String feedSeq, HttpServletRequest rq,
			@RequestParam(value="profileId", required=false) String profileId) {
//		log.warn("profileId: {}",profileId);
		User user=(User)rq.getSession().getAttribute("userSession");
		Likefeed likef=Likefeed.builder().feedSeq(feedSeq).likeFeedId(user.getUserId()).build();
		if(profileId.equals(user.getUserId())) {
			profileId="me";
		}
		return service.feedLike(likef, profileId, user.getUserNick());
	}
	
	
	@RequestMapping("profile/writeFeedComment")
	@ResponseBody
	public int writeFeedComment(@RequestParam(value="feedSeq", required=false) String feedSeq, HttpServletRequest rq,
			@RequestParam(value="fcc", required=false) String fcc,
			@RequestParam(value="profileId", required=false) String profileId) {
		User user=(User)rq.getSession().getAttribute("userSession");
		FeedComment fc=FeedComment.builder().feedSeqRef(feedSeq).commenter(user.getUserId()).feedCommentContents(fcc).build();
		if(profileId.equals(user.getUserId())) {
			profileId="me";
		}
		return service.writeFeedComment(fc, profileId, user.getUserNick());
	}
	
	
	@RequestMapping("/profile/modifyFeed/start")
	public String modifyFeedStart(@RequestParam(value="feedSeq", required=false) String feedSeq, Model m) {
		m.addAttribute("feed",service.selectFeed(feedSeq));
		return "components/profile/modifyFeedModal";
	}
	
	
	@RequestMapping("/profile/modifyFeed/end")
	public String modifyFeed(HttpServletRequest rq, String feedContents, Model m, String feedSeq,
			@RequestParam("file") MultipartFile[] files, @RequestParam("oldFile") int[] oldFile) {
		User user=(User)rq.getSession().getAttribute("userSession");
		
		String[] newFileName={null, null, null};
		
		NoHasAFeed oldFeed=service.selectFeed(feedSeq);
		
		if(oldFile.length!=0) {
			//예전에 올린 파일이 남아있음
			
			for(int i=0;i<oldFile.length;i++) {
				switch(oldFile[i]) {
					case 1: newFileName[i]=oldFeed.getFeedImage1(); break;
					case 2: newFileName[i]=oldFeed.getFeedImage2(); break;
					case 3: newFileName[i]=oldFeed.getFeedImage3(); break;
				}
			}
		} //예전에 올린 파일이 아예 없거나 다 지움
		
		//새로 올린 파일이 있는지 확인
		if(files.length!=0) {
			//length가 1이어도 0번 인덱스에 공값이 들어있을 수 있으므로 한 번 더 체크
			if(files[0].getSize()!=0) {
				//새로 올린 파일이 존재함
				
				for(int i=0;i<files.length;i++) {
					//newFileName이 null인 곳에 입력해야 함으로 검증해야 함
					
					if(oldFile.length==0) {
						//newFileName에 모두 null값이 들어있으므로 0번 인덱스부터 넣으면 됨
						newFileName[i]=renamepolicy(rq, files[i], "feed");
						
					} else {
						//newFileName에 이미 값이 들어있을 것임
						//null값이 들어있는 자리부터 넣어야 함
						
						for(int j=1;j<3;j++) {
							//어차피 0번 인덱스에는 무조건 값이 있을 것이므로 1번 인덱스가 null인지부터 검증하면 됨
							if(newFileName[j]==null) {
								newFileName[j]=renamepolicy(rq, files[i], "feed");
								break;
							}
						}
					}
				}
			}
		}

		NoHasAFeed nhf=NoHasAFeed.builder().feedSeq(feedSeq).feedContents(feedContents).feedImage1(newFileName[0]).feedImage2(newFileName[1]).feedImage3(newFileName[2]).build();
		
		m.addAttribute("loc", "/profile/open/"+user.getUserId());
		if(service.modifyFeed(nhf)>0) {
			m.addAttribute("msg", "피드가 수정되었습니다.");
		}else {
			m.addAttribute("msg", "피드 수정에 실패했습니다.");
		}
		return "common/msg";
	}
	
	
	@RequestMapping("/profile/writeFeed2ndComment")
	@ResponseBody
	public int writeFeed2ndComment(HttpServletRequest rq,
			@RequestParam(value="feedSeq", required=false) String feedSeq,
			@RequestParam(value="feedCommentSeq", required=false) String refCommentSeq,
			@RequestParam(value="commenter", required=false) String commentId,
			@RequestParam(value="content", required=false) String content) {
		
		User user=(User)rq.getSession().getAttribute("userSession");
		FeedComment fc=FeedComment.builder().feedSeqRef(feedSeq).commenter(user.getUserId()).feedCommentRef(refCommentSeq).feedCommentContents(content).build();
		log.warn("fc: {}",fc);
		if(commentId.equals(user.getUserId())) {
			commentId="me";
		}
		int result=service.writeFeed2ndComment(fc, commentId, user.getUserNick());
		log.warn("result: {}",result);
		return result;
	}

}

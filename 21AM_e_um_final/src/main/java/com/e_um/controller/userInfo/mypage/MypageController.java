package com.e_um.controller.userInfo.mypage;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.common.pagebar.PageBar;
import com.e_um.model.sevice.userInfo.mypage.MypageServiceInterface;
import com.e_um.model.sevice.userInfo.user.UserServiceInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.placeinfo.food.booking.FoodBooking;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.userInfo.interest.Interest;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MypageController {
	
	@Autowired
	MypageServiceInterface service;
	
	@Autowired
	UserServiceInterface userService;
	BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder(); 
	

	@RequestMapping("/user/mypage/start")
	public String gotoMypage(String userId, @RequestParam(value="flag", defaultValue="none", required=false) String flag,
			Model m, @RequestParam(value="tab", defaultValue="none", required=false) String tab) {
		m.addAttribute("flag", flag);
		m.addAttribute("tab", tab);
//		log.error("flag: {}",flag);
//		log.error("tab: {}",tab);
		return "myPage";
	}
	
	
	@RequestMapping("/user/mypage/openModal")
	public String openMPModal(@RequestParam(value="modalName", required=false) String modalName,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerPage", defaultValue="10") int numPerPage,
			HttpServletRequest rq, Model m) {
		User user=(User)rq.getSession().getAttribute("userSession");
//		log.error("modalName: {}", modalName);
//		log.error("userId: {}", user.getUserId());
		
		int totalData=0;
		String pageBar="";
		switch(modalName) {
			case "movieModal":
				m.addAttribute("movieInfo",service.selectMovieTicketingInfo(user.getUserId(),cPage,numPerPage));
				//log.error("movieInfo: {}",m.addAttribute("movieInfo",service.selectMovieTicketingInfo(user.getUserId(),cPage,numPerPage)));
				totalData=service.selectMovieTicketingCount(user.getUserId());
				pageBar=PageBar.getPageBarModalName(modalName, totalData, cPage, numPerPage, rq.getContextPath()+"/user/mypage/openModal", "fn_paging");
				break;
				
			case "friendModal":
				m.addAttribute("friendList",service.selectFriendList(user.getUserId()));
				m.addAttribute("applyFriendList",service.selectApplyFriendList(user.getUserId()));
				m.addAttribute("blockFriendList",service.selectblockFriendList(user.getUserId()));
				break;
				
			case "foodModal":
				m.addAttribute("foodInfo",service.selectFoodBookingInfo(user.getUserId(),cPage,numPerPage));
				totalData=service.selectFoodBookingCount(user.getUserId());
				pageBar=PageBar.getPageBarModalName(modalName, totalData, cPage, numPerPage, rq.getContextPath()+"/user/mypage/openModal", "fn_paging");
		}
		m.addAttribute("pageBar",pageBar);
		return "components/myPage/"+modalName;
	}
	
	
	@RequestMapping("/user/mypage/changeNick")
	@ResponseBody
	public int changeNick(@RequestParam(value="newNick", required=false) String newNick, HttpServletRequest rq) {
		User user=(User)rq.getSession().getAttribute("userSession");
		User u=User.builder().userId(user.getUserId()).userNick(newNick).build();
		if(service.changeNick(u)>0) {
			User userResult = userService.login(u);
			rq.getSession().setAttribute("userSession", userResult);
			return 1;
		}else {
			return 0;
		}
	}
	
	
	@RequestMapping("/user/mypage/sameOldPw")
	@ResponseBody
	public int oldPwSameCheck(@RequestParam(value="oldpw", required=false) String oldpw, HttpServletRequest rq) {
		User user=(User)rq.getSession().getAttribute("userSession");
//		log.warn("oldpw: {}",oldpw);
//		log.warn("db pw: {}",user.getUserPassword());
//		log.warn("pwEncoder.matches(oldpw, user.getUserPassword()): {}",pwEncoder.matches(oldpw, user.getUserPassword()));
		if(pwEncoder.matches(oldpw, user.getUserPassword())) {
			return 0;
		} else {
			return 1;
		}
	}
	
	
	@RequestMapping("/user/mypage/changePw")
	@ResponseBody
	public int changePw(@RequestParam(value="newpw", required=false) String newpw, HttpServletRequest rq) {
		User user=(User)rq.getSession().getAttribute("userSession");
		User u=User.builder().userId(user.getUserId()).userPassword(pwEncoder.encode(newpw)).build();
		if(service.changePw(u)>0) {
			User userResult = userService.login(u);
			rq.getSession().setAttribute("userSession", userResult);
			return 1;
		}else {
			return 0;
		}
	}
	
	
	@RequestMapping("/user/mypage/changeAddr")
	@ResponseBody
	public int changeAddr(HttpServletRequest rq, @RequestParam(value="userAddrBasic", required=false) String userAddrBasic,
			@RequestParam(value="userAddrDetails", required=false) String userAddrDetails,
			@RequestParam(value="userAddrZip", required=false) String userAddrZip) {
		User user=(User)rq.getSession().getAttribute("userSession");
		User u=User.builder().userId(user.getUserId()).userAddrBasic(userAddrBasic).userAddrDetails(userAddrDetails).userAddrZip(userAddrZip).build();
		if(service.changeAddr(u)>0) {
			User userResult = userService.login(u);
			rq.getSession().setAttribute("userSession", userResult);
			return 1;
		}else {
			return 0;
		}
	}
	
	
	@RequestMapping("/user/mypage/changeEmail")
	@ResponseBody
	public int changeEmail(@RequestParam(value="newEmail", required=false) String newEmail, HttpServletRequest rq) {
		User user=(User)rq.getSession().getAttribute("userSession");
		User u=User.builder().userId(user.getUserId()).userEmail(newEmail).build();
		if(service.changeEmail(u)>0) {
			User userResult = userService.login(u);
			rq.getSession().setAttribute("userSession", userResult);
			return 1;
		}else {
			return 0;
		}
	}
	
	
	@RequestMapping("/user/mypage/selectInterest")
	@ResponseBody
	public Interest selectInterest(HttpServletRequest rq) {
		User user=(User)rq.getSession().getAttribute("userSession");
//		log.warn("service.selectInterest(user.getUserId(): {}",service.selectInterest(user.getUserId()));
		return service.selectInterest(user.getUserId());
	}
	
	
	@RequestMapping("/user/mypage/changeInter")
	@ResponseBody
	public int changeInterest(HttpServletRequest rq,
			@RequestParam(value="interArr[]", required=false) List<String> interArr) {
		User user=(User)rq.getSession().getAttribute("userSession");
		Map param=new HashMap();
		param.put("userId", user.getUserId());
		Interest inter=new Interest();
		if(interArr!=null) {
			inter=Interest.builder().profileInterestName1(interArr.get(0)).profileInterestName2(interArr.get(1)).profileInterestName3(interArr.get(2)).profileInterestName4(interArr.get(3)).profileInterestName5(interArr.get(4)).build();
		}else {
			inter=Interest.builder().profileInterestName1(null).profileInterestName2(null).profileInterestName3(null).profileInterestName4(null).profileInterestName5(null).build();
		}
		param.put("inter", inter);
//		log.warn("interArr: {}",interArr);
//		log.warn("interArr: {}",interArr.get(0));
		if(service.changeInterest(param)>0) {
//			User userResult = userService.login(u);
//			rq.getSession().setAttribute("userSession", userResult);
			return 1;
		}else {
			return 0;
		}
	}
	
	
	/*
	 * @RequestMapping("/user/mypage/cancelMovie")
	 * 
	 * @ResponseBody public int cancelMovie(HttpServletRequest rq,
	 * 
	 * @RequestParam(value="movieReservNum", required=false) String movieReservNum)
	 * { User user=(User)rq.getSession().getAttribute("userSession"); MovieTicketing
	 * mt=MovieTicketing.builder().userId(user.getUserId()).movieReservNum(
	 * movieReservNum).build(); return service.cancelMovie(mt); }
	 */
	
	
	@RequestMapping("/user/mypage/blockFriend")
	@ResponseBody
	public int blockFriend(HttpServletRequest rq, @RequestParam(value="friendId", required=false) String friendId) {
		User user=(User)rq.getSession().getAttribute("userSession");
		Friend f=Friend.builder().myId(user.getUserId()).friendId(friendId).build();
		return service.blockFriend(f);
	}
	
	
	@RequestMapping("/user/mypage/blockCancel")
	@ResponseBody
	public int blockCancel(HttpServletRequest rq, @RequestParam(value="friendId", required=false) String friendId) {
		User user=(User)rq.getSession().getAttribute("userSession");
		Friend f=Friend.builder().myId(user.getUserId()).friendId(friendId).build();
		return service.blockCancel(f);
	}
	
	@RequestMapping("/user/mypage/cancelFood")
	@ResponseBody
	public int cancelFood(HttpServletRequest rq,
			@RequestParam(value="foodBookingSeq", required=false) String foodBookingSeq) {
		return service.cancelFood(foodBookingSeq);
	}
	
}

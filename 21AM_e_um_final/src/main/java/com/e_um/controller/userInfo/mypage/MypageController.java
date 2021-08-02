package com.e_um.controller.userInfo.mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.userInfo.mypage.MypageServiceInterface;
import com.e_um.model.sevice.userInfo.user.UserServiceInterface;
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
	

	@RequestMapping("user/mypage/start")
	public String gotoMypage(String userId) {
		return "myPage";
	}
	
	
	@RequestMapping("user/mypage/openModal")
	public String openMPModal(@RequestParam(value="modalName", defaultValue="none", required=false) String modalName) {
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
	
	
	@RequestMapping("/user/mypage/selectInterest")
	@ResponseBody
	public Interest selectInterest(HttpServletRequest rq) {
		User user=(User)rq.getSession().getAttribute("userSession");
//		log.warn("service.selectInterest(user.getUserId(): {}",service.selectInterest(user.getUserId()));
		return service.selectInterest(user.getUserId());
	}
	
}

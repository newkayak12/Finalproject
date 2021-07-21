package com.e_um.controller.communicateInfo.friend;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.e_um.model.sevice.communicateInfo.friend.FriendServiceInterface;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FriendController {
	
	@Autowired
	FriendServiceInterface service;
	
	
	@RequestMapping("/friend/main")
	public ModelAndView friendMain(ModelAndView mv, HttpSession session) {
//		log.warn("로그인한 회원 정보: {}",session.getAttribute("user"));
		mv.addObject("list",service.selectAllUser());
		mv.setViewName("friend");
//		for(User u:service.selectAllUser()) {
//			log.warn("user: {}",u);
//		}
		return mv;
	}



}

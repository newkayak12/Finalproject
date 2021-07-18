package com.e_um.controller.userInfo.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e_um.model.sevice.userInfo.user.UserServiceInterface;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class UserController {

	@Autowired
	UserServiceInterface service;

	@RequestMapping(value="/user/login/start")
	public String loginPagin(){
		return "components/user/login";
	}
	
	@RequestMapping("/user/lostandfound/start")
	public String lostandfound() {
		
		log.warn("hh");
		return "components/user/lostandfound";
	}
	
	@RequestMapping("/user/findmyid/start")
	public String findmyid(Model model) {
		model.addAttribute("flag","id");
		return"components/user/findmyid";
	}
	@RequestMapping("/user/findmypw/start")
	public String findmypw(Model model) {
		model.addAttribute("flag","pw");
		return"components/user/findmypw";
	}
}

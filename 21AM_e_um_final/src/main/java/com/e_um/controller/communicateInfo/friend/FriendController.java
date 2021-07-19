package com.e_um.controller.communicateInfo.friend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e_um.model.sevice.communicateInfo.friend.FriendServiceInterface;

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



}

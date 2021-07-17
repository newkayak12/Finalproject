package com.e_um.controller.userInfo.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.e_um.model.sevice.userInfo.user.UserServiceInterface;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class UserController {

	@Autowired
	UserServiceInterface service;

	@RequestMapping(value="/user/login/start")
	public String loginPagin(@RequestParam(value = "testKey")Object name){
		log.warn("22");
		log.warn("{}", name);
		return "components/login";
	}
	
}

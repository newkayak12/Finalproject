package com.e_um.controller.userInfo.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.sevice.userInfo.user.UserServiceInterface;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserController {

	@Autowired
	UserServiceInterface service;
}

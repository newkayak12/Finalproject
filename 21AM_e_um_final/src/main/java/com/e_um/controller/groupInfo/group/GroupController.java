package com.e_um.controller.groupInfo.group;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.groupInfo.group.GroupServiceInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class GroupController {

	@Autowired
	GroupServiceInterface service;
}

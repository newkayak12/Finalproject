package com.e_um.controller.communicateInfo.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.communicateInfo.chat.ChatServiceInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ChatController {

	@Autowired
	ChatServiceInterface service;
}

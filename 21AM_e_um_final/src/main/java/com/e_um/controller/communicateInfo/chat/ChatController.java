package com.e_um.controller.communicateInfo.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.communicateInfo.chat.ChatServiceInterface;
import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ChatController {

	@Autowired
	ChatServiceInterface service;
	
	@ResponseBody
	@RequestMapping("/fetch/chatlist")
	public List<ChatRoom> fetchChatlist(String userId){
		
		return service.fetchChatlist(userId);
	}
}

package com.e_um.controller.communicateInfo.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.communicateInfo.chat.ChatServiceInterface;
import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@Autowired
	ChatServiceInterface service;
	
	@RequestMapping("/fetch/chatlist")
	public String fetchChatlist(String userId, Model model){
		List<ChatRoom> result = service.fetchChatlist(userId);
		model.addAttribute("chat",result);
		log.error("tesssssstttt",result);
		return "components/chat/chatlist";
	}
	
	@RequestMapping("/fetch/chatalarm")
	@ResponseBody
	public int fetchChatAlarm(String userId) {
		
		return service.fetchChatAlarm(userId);
	}
	
	@RequestMapping("/chatting/init")
	@ResponseBody
	public ChatRoom chatInit(String myId, String apartId) {
		ChatRoom chatroom = service.chatInit(myId, apartId);

		
		log.error("{}",chatroom);
		return chatroom;
	}
	@RequestMapping("/chatting/create")
	@ResponseBody
	public int createChatRoom (String myId, String apartId){
		
		return 0;
	}
}

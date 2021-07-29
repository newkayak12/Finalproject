package com.e_um.model.sevice.communicateInfo.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.communicateInfo.chat.ChatDaoInterface;
import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatService implements ChatServiceInterface {
	@Autowired
	ChatDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<ChatRoom> fetchChatlist(String userId) {
		// TODO Auto-generated method stub
		return dao.fetchChatlist(userId, session);
	}

	@Override
	public int fetchChatAlarm(String userId) {
		// TODO Auto-generated method stub
		return dao.fetchChatAlarm(userId, session);
	}

	@Override
	public ChatRoom chatInit(String myId, String apartId) {
		// TODO Auto-generated method stub
		return dao.chatInit(myId, apartId, session);
	}
}

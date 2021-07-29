package com.e_um.common.webSocketHandler;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.e_um.controller.communicateInfo.chat.ChatController;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChatHandler extends TextWebSocketHandler {
	@Autowired
	ChatController controller;
	
	Map<String,String> chatRoom = Collections.synchronizedMap(new HashMap<String,String>());
	Map<String,WebSocketSession> idSet = Collections.synchronizedMap(new HashMap<>());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
	
//	soc.send(roomseq+"/"+'${userSession.userId}'+"/"+targetId+"/"+"content");
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
			String msg = message.getPayload();
			String[] process = msg.split("/");
//			메시지 처리
			
//			init > idset에 내 아이디 넣고 room에 넣고
				if(process[3].equals("$init$")) {
					chatRoom.put(process[0], process[0]);
					idSet.put(process[1], session);
					session.sendMessage(new TextMessage("ready"));
				}
			
			
			
//			아이디1, 아이디2로 채팅방 확인하기
//			 					Map 채팅방 데이터 있는지 확인하기 
//			해당 값이 없으면 만들기
//								Map 채팅방 데이터 있는지 확인하기
			
			
				
			
			
			session.sendMessage(new TextMessage(process.toString()));
			
			
		super.handleTextMessage(session, message);
	}
	
//	public int createChatRoom (String roomSeq, String myId, String targetId) {
////		return controller.chatRoomCreate(roomSeq, myId, targetId);
//	}
//	
	public void logInId(String userId, WebSocketSession session) {
		if(idSet.get(userId)!=null) {
			idSet.put(userId, session);
		} else {
			idSet.put(userId, session);
		}
	}
	
	public boolean checkId(String userId, WebSocketSession session) {
		if(idSet.get(userId)==session) {
			return true;
		} else {
			return false;
		}
	}
}

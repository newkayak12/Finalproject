package com.e_um.common.webSocketHandler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.e_um.model.sevice.communicateInfo.chat.ChatServiceInterface;
import com.e_um.model.vo.communicateinfo.chat.ChatRoom;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class OnlineHandler extends TextWebSocketHandler {
//	@Autowired
//	FriendController friendcontroller;
	
	@Autowired
	ObjectMapper wrapper;
	@Autowired
	ChatServiceInterface service;
	
	private Map<String,WebSocketSession> listofSession = Collections.synchronizedMap(new HashMap<String,WebSocketSession>());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
			
		
		super.afterConnectionEstablished(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		
		Set<Map.Entry<String, WebSocketSession>> entries = listofSession.entrySet();
		
			for(Map.Entry<String, WebSocketSession> piece : entries) {
				if(session == piece.getValue()) {
					String closeKey = piece.getKey();
					listofSession.remove(closeKey);
				}
			}
		
		
		super.afterConnectionClosed(session, status);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		
		
		String userId = message.getPayload();
		log.error(userId);
		listofSession.put(userId, session);
		
//		List<Friend> friendlist = friendcontroller.fetchFriendList(userId);
//		log.error("{}", friendlist);
//		
//		Map<String,String> onoff = new HashMap();
//		
//		Set<Map.Entry<String, WebSocketSession>> entries = listofSession.entrySet();
//		
//		
//		for(Friend f : friendlist) {
//			onoff.put(f.getFriendId(), "offline");
//			
//			for(Map.Entry<String, WebSocketSession> piece : entries) {
//				if(piece.getKey().equals(f.getFriendId())) {
//					onoff.put(f.getFriendId(), "online");
//				}
//			}
//			
//		}
		
		
		Map passer = new HashMap();
		List <String> online = new ArrayList();
		
		Set<Map.Entry<String, WebSocketSession>> entries = listofSession.entrySet();
		
		for(Map.Entry<String, WebSocketSession> piece : entries) {
			online.add(piece.getKey());
		}
	
		passer.put("flag", "online");
		passer.put("data", online);
		
		String onlinelist = wrapper.writeValueAsString(passer);
		session.sendMessage(new TextMessage(onlinelist));
		log.warn("test__________________");
		log.warn("test__________________"+userId);
		
		int check = checkToast(userId);
		log.warn("test__________________{}",check);
		if(check>0) {
			log.warn("test_ss");
			List<ChatRoom> list = loadchat(userId);
			passer.put("flag", "toast");
			passer.put("data", list);
			String toastlist = wrapper.writeValueAsString(passer);
			session.sendMessage(new TextMessage(toastlist));
		
			
			for(ChatRoom piece: list) {
				
				okayToast(userId, piece.getChatRoomSeq());
			}
		}
		
		
		super.handleTextMessage(session, message);
	}

	
	
	public List<ChatRoom> loadchat (String userId) {
		
		return service.loadchat(userId);
	}
	public int okayToast(String userId, String chatRoomSeq) {
		
		return service.okayToast(userId, chatRoomSeq);
	}
	public int checkToast(String userId) {

		return service.checkToast(userId);
	}
	
	
}

	

package com.e_um.common.webSocketHandler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class OnlineHandler extends TextWebSocketHandler {
//	@Autowired
//	FriendController friendcontroller;
	
	
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
		
		
		List <String> online = new ArrayList();
		
		Set<Map.Entry<String, WebSocketSession>> entries = listofSession.entrySet();
		
		for(Map.Entry<String, WebSocketSession> piece : entries) {
			online.add(piece.getKey());
		}
	
		
		
		session.sendMessage(new TextMessage(online.toString()));
		
		log.error("list{}", listofSession);
		
		
		super.handleTextMessage(session, message);
	}

	
	
	
	
	
}

	

package com.e_um.common.webSocketHandler;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.json.JacksonJsonParser;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.e_um.model.sevice.communicateInfo.chat.ChatServiceInterface;
import com.e_um.model.vo.communicateinfo.chat.ChatRoom;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChatHandler extends TextWebSocketHandler {
	
	@Autowired
	ChatServiceInterface service;
	@Autowired
	ObjectMapper wrapper;
	
	
	Map<String,String[]> chatRoom = Collections.synchronizedMap(new HashMap<String,String[]>());
	Map<String,WebSocketSession> idSet = Collections.synchronizedMap(new HashMap<>());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		
		log.error("ff{}", service);
		super.afterConnectionEstablished(session);
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
	
	
//	방번호(room), 내 아이디(my), 상대 아이디(target), 플래그(flag), 메시지(msg), 데이터 타입(type)
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
			String msg = message.getPayload();
			log.error("msgsmg"+msg);
			log.error("idsetidset{}",idSet);
			JacksonJsonParser parser = new JacksonJsonParser();
			Map<String,Object> result = parser.parseMap(msg);
			log.error("resultresult{}",result);
			
			/* 채팅 시작부*/
			if(((String) result.get("flag")).equals("init")) {
				
				log.warn("init!");
//				init을 사용자가 보내면
					if(checkId((String)result.get("my"), session)) {
	//				로그인 여부 확인 (MAP)에 업로드
					} else { 
	//				안되어 있으면 로그인  (MAP)에 업로드
						logInId((String)result.get("my"), session);
					}
				
				ChatRoom chatroomdata = roomChecker((String)result.get("my"),(String)result.get("target"));
//				1:1채팅방이기에 DB에 채팅방이 있는지 확인 
				chatRoom.put((String) chatroomdata.getChatRoomSeq(), new String[] {(String)result.get("my"),(String)result.get("target")});
//				map에 채팅방 반영
				
				ChatRoom prev = fetchChatlist((String) chatroomdata.getChatRoomSeq(), (String) result.get("my"));
//				채팅방과 채팅 리스트 가져옴 
				Map map  = new HashMap();
				map.put("data", prev);
				map.put("flag", "init");
				
				log.warn("mapmapampampa{}",map);
				String prevchat = wrapper.writeValueAsString(map);
				
				
				log.warn("init{}",prevchat);
				idSet.get(((String)result.get("my"))).sendMessage(new TextMessage(prevchat));
				
				iReadit((String) chatroomdata.getChatRoomSeq(), (String) result.get("target"));
				
				
				
				/* 채팅 중반부 */
			} else if(((String) result.get("flag")).equals("running")) {
				
//	{room=CR_1, my=newkayak12, target=yejin1234, flag=running, msg=밥은 먹었어?, type=text}
//				상대방이 온라인이 아닌 경우 || 채팅방에 들어와 있지 않은 경우 
				log.warn("target{}",idSet.get((String)(result.get("target"))));
				if(idSet.get((String)(result.get("target"))) == null){
//					DB로 바로 저장
					log.warn("DB로 바로 저장");
					log.warn("{}",idSet);
					chatToOffline(result);

					ChatRoom prev = fetchChatlist((String) result.get("room"), (String) result.get("my"));
//					채팅방과 채팅 리스트 가져옴 
					Map map  = new HashMap();
					map.put("data", prev);
					map.put("flag", "init");
					String prevchat = wrapper.writeValueAsString(map);
					
					idSet.get((String) result.get("my")).sendMessage(new TextMessage(prevchat));
					
					
				} else {
//					바로 메시지 보내야함 + DB에 일정 수가 쌓이면 저장
					log.warn("서버로 보내고 나중에 DB로 저장");
					log.warn("chatchatchat{}",result);
					LocalDateTime time = LocalDateTime.now();
					
							
							
					result.put("time",LocalTime.now().format(DateTimeFormatter.ofPattern("hh:mm")));
					
					
					log.warn("targettargettarget{}",idSet.get((String)(result.get("target"))));
					idSet.get((String)result.get("my")).sendMessage(new TextMessage(wrapper.writeValueAsString(result)));
					Thread.sleep(500);
					
					if(idSet.get((String)result.get("target"))!=null) {
						idSet.get((String)result.get("target")).sendMessage(new TextMessage(wrapper.writeValueAsString(result)));
					}
					chatToOnlind(result);
					
				}
				
			} else if(((String) result.get("flag")).equals("fin")) {
				idSet.remove((String) result.get("my"));
			}
			
			
			
//			메시지 처리
			
//			init > idset에 내 아이디 넣고 room에 넣고
				
			
			
			
//			아이디1, 아이디2로 채팅방 확인하기
//			 					Map 채팅방 데이터 있는지 확인하기 
//			해당 값이 없으면 만들기
//								Map 채팅방 데이터 있는지 확인하기
			
			
		super.handleTextMessage(session, message);
	}
	

	public void logInId(String userId, WebSocketSession session) {
		idSet.put(userId, session);
	}
	
	
	
	public boolean checkId(String userId, WebSocketSession session) {
		if(idSet.get(userId)!=null && idSet.get(userId)==session) {
			//로그인이 되어 있으면
			return true;
		} else {
//			안되어있으면
			return false;
		}
	}
	
	
	
	public ChatRoom roomChecker(String userId1, String userId2) {
		log.warn("{}",service);
			ChatRoom room = service.chatInit(userId1, userId2);
			
		if(room!=null) {
			
			return room;
		} else {
			service.createChatRoom(userId1, userId2);
			
			return service.chatInit(userId1, userId2);
		}
	}
	
	
	public ChatRoom fetchChatlist(String roomseq,String myId) {
		return service.fetchChat(roomseq, myId);
	}
	
	public int iReadit(String roomseq, String targetId){
		
		return service.iReadit(roomseq, targetId);
	}
	
	
	public int chatToOffline(Map map) {
		
		return service.chatToOffline(map);
	}
	
	public int chatToOnlind(Map map) {
		return service.chatToOnline(map);
	}
}

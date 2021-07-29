package com.e_um.common.handshakeInterceptor;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.e_um.model.sevice.communicateInfo.chat.ChatService;
import com.e_um.model.sevice.communicateInfo.chat.ChatServiceInterface;

@Component
public class ChatInterceptor implements HandshakeInterceptor{
	@Autowired
	ChatServiceInterface service;
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		// TODO Auto-generated method stub
		
	}
	
	public ChatServiceInterface  getService() {
		return service;
	}

}

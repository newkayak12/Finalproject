package com.e_um.common.configure;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.e_um.common.webSocketHandler.ChatHandler;
import com.e_um.common.webSocketHandler.OnlineHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfigure  implements WebSocketConfigurer{
@Autowired
ChatHandler chatHandler;
@Autowired
OnlineHandler onlineHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(onlineHandler, "/online").setAllowedOriginPatterns("*").withSockJS();
		registry.addHandler(chatHandler,"/chat").setAllowedOriginPatterns("*").withSockJS();
		
	}

}

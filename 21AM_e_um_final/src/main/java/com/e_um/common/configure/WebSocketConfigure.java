package com.e_um.common.configure;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.e_um.common.webSocketHandler.ChatHandler;
import com.e_um.common.webSocketHandler.OnlineHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfigure  implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new OnlineHandler(), "/online").setAllowedOriginPatterns("*").withSockJS();
		registry.addHandler(new ChatHandler(),"/chat").setAllowedOriginPatterns("*").withSockJS();
		
	}

}

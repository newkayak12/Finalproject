package com.e_um.model.vo.communicateinfo.chat;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatRoom {
	
	String chatRoomSeq, chatrommId1, chatrommId2;
	
	List<Chat> chats;

}

package com.e_um.model.sevice.communicateInfo.chat;

import java.util.List;

import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

public interface ChatServiceInterface {
	public List<ChatRoom> fetchChatlist(String userId);
}

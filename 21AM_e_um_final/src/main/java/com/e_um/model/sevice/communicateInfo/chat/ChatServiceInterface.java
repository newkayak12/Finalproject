package com.e_um.model.sevice.communicateInfo.chat;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

public interface ChatServiceInterface {
	public List<ChatRoom> fetchChatlist(String userId);
	public int  fetchChatAlarm(String userId);
	public ChatRoom chatInit(String myId, String apartId);
	public int createChatRoom(String myId, String apartId);
	public ChatRoom fetchChat(String roomseq, String userId);
	public int iReadit(String roomseq, String userId);
	public int chatToOffline(Map map);
	public int chatToOnline(Map map);
}

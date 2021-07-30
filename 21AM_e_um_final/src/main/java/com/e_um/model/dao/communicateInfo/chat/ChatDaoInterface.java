package com.e_um.model.dao.communicateInfo.chat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

public interface ChatDaoInterface {
	public List<ChatRoom> fetchChatlist(String userId, SqlSessionTemplate session);
	public int fetchChatAlarm (String userId, SqlSessionTemplate session);
	public ChatRoom chatInit(String myId, String apartId, SqlSessionTemplate session);
	public int createChatRoom(String myId, String apartId,  SqlSessionTemplate session);
	public ChatRoom fetchChat(String roomseq, String userId, SqlSessionTemplate session);
	public int iReadit(String roomseq, String userId, SqlSessionTemplate session);
	public int chatToOffline(Map map, SqlSessionTemplate session);
	public int chatToOnline(Map map, SqlSessionTemplate session);
}

package com.e_um.model.dao.communicateInfo.chat;

import java.util.HashMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ChatDao implements ChatDaoInterface{@Override
	public List<ChatRoom> fetchChatlist(String userId, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("chat.fetchChatlist",userId);
	}

@Override
public int fetchChatAlarm(String userId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	return session.selectOne("alarm.fetchChatAlarm", userId);
}

@Override
public ChatRoom chatInit(String myId, String apartId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	Map<String,String> param = new HashMap();
	param.put("myId", myId);
	param.put("apartId", apartId);
	return session.selectOne("chat.chatInit", param);
}

@Override
public int createChatRoom(String myId, String apartId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	
	Map<String,String> map = new HashMap();
	map.put("myId", myId);
	map.put("apartId", apartId);
	return session.insert("chat.createChatRoom", map);
}

@Override
public ChatRoom fetchChat(String roomseq, String userId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	Map<String, String> map = new HashMap();
	map.put("roomseq", roomseq);
	map.put("userId", userId);
	return session.selectOne("chat.fetchChat",map );
}

@Override
public int iReadit(String roomseq, String userId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	Map<String,String> map = new HashMap();
	map.put("roomseq", roomseq);
	map.put("userId", userId);
	return session.update("chat.iReadit", map);
}

}

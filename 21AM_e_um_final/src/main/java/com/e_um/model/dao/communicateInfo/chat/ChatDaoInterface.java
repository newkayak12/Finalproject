package com.e_um.model.dao.communicateInfo.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.chat.ChatRoom;

public interface ChatDaoInterface {
	public List<ChatRoom> fetchChatlist(String userId, SqlSessionTemplate session);
}

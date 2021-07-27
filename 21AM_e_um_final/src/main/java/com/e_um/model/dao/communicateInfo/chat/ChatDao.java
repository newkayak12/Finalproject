package com.e_um.model.dao.communicateInfo.chat;

import java.util.List;

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

}

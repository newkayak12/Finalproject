package com.e_um.model.sevice.communicateInfo.chat;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.communicateInfo.chat.ChatDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatService implements ChatServiceInterface {
	@Autowired
	ChatDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

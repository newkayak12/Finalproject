package com.e_um.model.sevice.serviceInfo.question;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.serviceInfo.question.QuestionDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Service@Slf4j
public class QuestionService implements QuestServiceInterface {
	@Autowired
	QuestionDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

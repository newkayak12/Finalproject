package com.e_um.model.sevice.serviceInfo.question;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.serviceInfo.question.QuestionDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.serviceinfo.question.NoHasAQuestion;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QuestionService implements QuestServiceInterface {
	
	@Autowired
	QuestionDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate session;

	
	@Override
	public int insertQuestion(NoHasAQuestion nhq) {
		return dao.insertQuestion(session, nhq);
	}


	@Override
	public List<NoHasAQuestion> selectQuestionList(String userId, int cPage, int numPerPage) {
		return dao.selectQuestionList(session, userId, cPage, numPerPage);
	}


	@Override
	public int selectQuestionListCount(String userId) {
		return dao.selectQuestionListCount(session, userId);
	}

}

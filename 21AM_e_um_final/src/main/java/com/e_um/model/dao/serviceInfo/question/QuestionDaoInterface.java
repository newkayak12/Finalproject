package com.e_um.model.dao.serviceInfo.question;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.serviceinfo.question.NoHasAQuestion;

public interface QuestionDaoInterface {
	
	int insertQuestion(SqlSessionTemplate session, NoHasAQuestion nhq);
	
	List<NoHasAQuestion> selectQuestionList(SqlSessionTemplate session, String userId, int cPage, int numPerPage);
	
	int selectQuestionListCount(SqlSessionTemplate session, String userId);

}

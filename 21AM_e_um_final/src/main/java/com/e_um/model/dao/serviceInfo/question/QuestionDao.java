package com.e_um.model.dao.serviceInfo.question;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.serviceinfo.question.NoHasAQuestion;
import com.e_um.model.vo.serviceinfo.question.Question;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class QuestionDao implements QuestionDaoInterface {
	
	@Override
	public int insertQuestion(SqlSessionTemplate session, NoHasAQuestion nhq) {
		return session.insert("question.insertQuestion",nhq);
	}

	
	@Override
	public List<NoHasAQuestion> selectQuestionList(SqlSessionTemplate session, String userId, int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("question.selectQuestionList",userId,row);
	}


	@Override
	public int selectQuestionListCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("question.selectQuestionListCount",userId);
	}


	@Override
	public Question selectQNA(SqlSessionTemplate session, String queSeq) {
		return session.selectOne("question.selectQNA",queSeq);
	}

}

package com.e_um.model.vo.serviceinfo.question;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.userInfo.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Question {
	
	/*
	 * User에 대한 전체적인 정보가 필요하다고 판단.
	 */
	private String questionSeq;
	private User userId;
	private String questionCategory;
	private String questionTitle;
	private String questionContents;
	private Date questionDate;
	private String questionResponseFlag;
	private String questionImageFile;
	
	/*
	 * 어차피 join해야한다고 판단하여, answer테이블의 내용도 같이 넣음
	 */
	
	private String questionAnswerContents, questionAnswerTitle;
	private Date questionAnswerDate;
}

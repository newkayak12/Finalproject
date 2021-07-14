package com.e_um.model.vo.service.question;

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
	private String questionSeq;
	private User userId;
	private String questionCategory;
	private String questionTitle;
	private String questionContents;
	private Date questionDate;
	private String questionResponseFlag;
	private String questionImageFile;
	
	
	private String questionAnswerContents, questionAnswerTitle;
	private Date questionAnswerDate;
}

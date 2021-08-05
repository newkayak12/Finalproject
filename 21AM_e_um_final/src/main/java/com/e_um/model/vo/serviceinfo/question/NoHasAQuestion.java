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
public class NoHasAQuestion {
	
	String questionSeq, userId, questionCategory, questionTitle, questionContents;
	Date questionDate;
	String questionResponseFlag, questionImageFile;

}

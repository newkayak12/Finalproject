package com.e_um.model.vo.userInfo.report;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class ReportFoodComment {
	private String userIdShooter, userIdTarget, foodCommentContents, foodCommentPhoto1,foodCommentPhoto2,foodCommentPhoto3,foodCommentPhoto4,foodCommentPhoto5,reportContent,foodCommentBlock, reportFlag, reportTargetContent;
}

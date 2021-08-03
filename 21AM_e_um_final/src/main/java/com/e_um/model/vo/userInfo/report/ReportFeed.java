package com.e_um.model.vo.userInfo.report;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReportFeed {

	String  feedContents, feedImage1, feedImage2, feedImage3, feedBlock, userIdShooter, userIdTarget, reportContent, reportFlag, reportTargetContent;
	
}

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
public class ReportGroupBoard {
	String groupBoardTitle, groupBoardConents, groupBoardBlock, groupBoardPhoto1, groupBoardPhoto2, groupBoardPhoto3, userIdShooter, userIdTarget,  reportContent, reportFlag, reportTargetContent  ;
}

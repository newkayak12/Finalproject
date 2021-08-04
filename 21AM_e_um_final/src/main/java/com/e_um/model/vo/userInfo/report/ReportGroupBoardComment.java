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
public class ReportGroupBoardComment {
 private String  userIdShooter, userIdTarget,  reportContent, reportFlag, reportTargetContent , groupCommentFlag, groupCommentContent, groupCommentBlock ;
}

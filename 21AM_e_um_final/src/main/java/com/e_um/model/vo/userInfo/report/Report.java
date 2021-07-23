package com.e_um.model.vo.userInfo.report;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.userInfo.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Component
public class Report {
	
	/*
	 * user에 대한 전체적인 정보가 필요할 것으로 보여, User객체를 가져옴
	 * 필요 없다면 String으로 변경해도 상관없음
	 * mybatis상에서 , DB상에서 별칭으로 resultmap을 사용할 필요성이 있음
	 * association으로 두 개를 지정 해야함
	 */

	private String userIdShooter, userIdTarget;
	private Date reportDate;
	private String reportContents, reportFlag, reportTargetContent;
	
	
	
}

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

	private User userIdShooter, userIdTarget;
	private Date reportDate;
	private String reportContents, reportFlag, reportTargetContent;
	
	
	
}

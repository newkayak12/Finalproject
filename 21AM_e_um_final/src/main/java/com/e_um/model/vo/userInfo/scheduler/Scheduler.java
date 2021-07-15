package com.e_um.model.vo.userInfo.scheduler;

import java.util.Date;

import org.springframework.stereotype.Component;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Scheduler {
	
	private Date schedulerDate;
	private String userId;
	private String schedulerCategoryName;
	private String schedulerTitle, schedulerContents, schedulerFlag;
	
	
	
}

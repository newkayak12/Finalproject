package com.e_um.model.vo.userInfo.scheduler;

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
public class Scheduler {
	
	private Date schedulerDate;
//	private User user;
	private String schedulerCategoryName;
	private String schedulerTitle, schedulerContents, schedulerFlag;
	
	
	
}

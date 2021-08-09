package com.e_um.model.vo.userInfo.scheduler;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.userInfo.schedulerCategory.SchedulerCategory;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class NoHasAScheduler {
	
	private String schedulerSeq, userId, schedulerCategorySeq, schedulerTitle, schedulerFlag;
	private Date schedulerDate;

}

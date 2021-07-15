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
public class Scheduler {
	/*
	 * 스케쥴러는 카테고리 클래스 안에 있는 카테고리를 가져옴 (카테고리는 따로 뿌려줄 필요가 있어보임)
	 */
	
	
	private String userId;
	private SchedulerCategory schedulerCategoryName;
	
	private String schedulerTitle, schedulerFlag;
	private Date schedulerDate;
	
	
	
}

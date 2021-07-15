package com.e_um.model.vo.userInfo.schedulerCategory;

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
public class SchedulerCategory {
	private String  SchdulerCategoryName;
}

package com.e_um.model.vo.placeinfo.food.category;

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
public class FoodCategorySub {
	
	/*
	 * 
	 * 두 개를 기본적으로 join한다는 생각으로
	 */
	private String foodCategorySub;
}

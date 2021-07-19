package com.e_um.model.vo.placeinfo.food.menu;

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
public class FoodMenu {
	
	/*
	 * 메뉴
	 */
	private String foodMenuSeq;
	private String foodSeq;
	private String menuName;
	private int menuPrice;
	private String menuPhoto;
}

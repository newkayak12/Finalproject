package com.e_um.model.vo.placeinfo.food.menu;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.food.category.FoodCategory;

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
	private String foodMenuSeq, menuName;
	private int menuPrice;
	private String menuPhoto;
}

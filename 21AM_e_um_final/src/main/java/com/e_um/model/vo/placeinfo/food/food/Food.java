package com.e_um.model.vo.placeinfo.food.food;

import java.util.Date;

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
public class Food {
	private String foodSeq;
	private FoodCategory foodCategory;
	private String foodName, foodContents, foodAddr, foodCall;
	private String foodLongitude, foodLatitude;
	private int foodStar, foodPrice;
	private Date foodTimeFirst, foodTimeLast;
	private int foodHead;

}

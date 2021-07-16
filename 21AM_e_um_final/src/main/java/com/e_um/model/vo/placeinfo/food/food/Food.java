package com.e_um.model.vo.placeinfo.food.food;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.food.category.FoodCategory;
import com.e_um.model.vo.placeinfo.food.menu.FoodMenu;

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
	private double foodStar;
	private int  foodPrice;
	private Date foodTimeFirst, foodTimeLast;
	private int foodHead;
	
	private List<FoodMenu> menu = new ArrayList();

}

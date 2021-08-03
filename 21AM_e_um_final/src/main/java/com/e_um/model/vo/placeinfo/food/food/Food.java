package com.e_um.model.vo.placeinfo.food.food;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

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
	private String foodCategoryMain;
	private String foodCategorySub;
	private String foodName, foodContents, foodAddr, foodCall;
	private String foodLongitude, foodLatitude;
	private double foodStar;
	private int  foodPrice;
	private String foodTimeFirst, foodTimeLast;
	private int foodHead;
	private String foodUrl;
	private int foodLikeCount;
	
	// 추가된 컬럼
	private Date foodInsertDate;
	private int foodViewCount;
	private String foodStatus;
	
	// hasa관계로 설정 
	private List<FoodMenu> menus = new ArrayList();
	
	
	

}

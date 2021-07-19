package com.e_um.model.sevice.placeInfo.food;

import java.util.List;

import com.e_um.model.vo.placeinfo.food.food.Food;

public interface FoodServiceInterface {

	List<Food> selectAllFood();

	int foodInsert(Food food);

	List<String> selectFoodCategoryMain();

	List<String> selectFoodCategorySub();

}

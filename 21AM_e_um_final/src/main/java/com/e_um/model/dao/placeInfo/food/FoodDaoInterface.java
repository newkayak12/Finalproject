package com.e_um.model.dao.placeInfo.food;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.placeinfo.food.booking.FoodBooking;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.placeinfo.food.menu.FoodMenu;

public interface FoodDaoInterface {

	List<Food> selectAllFood(SqlSessionTemplate session);

	int foodInsert(SqlSessionTemplate session, Food food);
	
	int foodMenuInsert(SqlSessionTemplate session, FoodMenu menu);

	List<String> selectFoodCategoryMain(SqlSessionTemplate session);

	List<String> selectFoodCategorySub(SqlSessionTemplate session);

	Food selectFood(SqlSessionTemplate session, String foodSeq);

	int foodBooking(SqlSessionTemplate session, FoodBooking booking);

	List<FoodBooking> selectMyBookingList(SqlSessionTemplate session, String userId);

	List<Food> searchFood(SqlSessionTemplate session, Map<String, Object> param);

	

}

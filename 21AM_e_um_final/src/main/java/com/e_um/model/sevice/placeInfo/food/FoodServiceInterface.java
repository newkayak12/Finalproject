package com.e_um.model.sevice.placeInfo.food;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.placeinfo.food.LikeFood;
import com.e_um.model.vo.placeinfo.food.booking.FoodBooking;
import com.e_um.model.vo.placeinfo.food.comment.FoodComment;
import com.e_um.model.vo.placeinfo.food.food.Food;

public interface FoodServiceInterface {

	List<Food> selectAllFood();

	int foodInsert(Food food);

	List<String> selectFoodCategoryMain();

	List<String> selectFoodCategorySub();

	Food selectFood(String foodSeq);

	int foodBooking(FoodBooking booking);

	List<FoodBooking> selectMyBookingList(String userId);

	List<Food> searchFood(Map<String, Object> param);

	int insertFoodComment(Map<String, Object> map);

	List<FoodComment> selectFoodCommentList(String foodSeq, int cPage);

	int countFoodComment(String foodSeq);

	int addFoodLike(Map<String, String> param);

	LikeFood checkFoodLike(Map<String, String> param);

	int delFoodLike(Map<String, String> param);

	int deleteFoodComment(String foodCommentSeq);

	int insertReportFoodComment(Map<String, String> param);

	FoodComment selectFoodComment(String foodCommentSeq);

	int updateFoodComment(Map<String, Object> map);

	int foodViewCountUp(String foodSeq);

	int insertFoodAlarm(Map<String, String> param);

	List<Food> selectAllFoodSorting(String con, String cPage);

	int totalFoodCount();

}

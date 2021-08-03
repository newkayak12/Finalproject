package com.e_um.model.dao.placeInfo.food;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.placeinfo.food.LikeFood;
import com.e_um.model.vo.placeinfo.food.booking.FoodBooking;
import com.e_um.model.vo.placeinfo.food.comment.FoodComment;
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

	int insertFoodComment(SqlSessionTemplate session, Map<String, Object> map);

	List<FoodComment> selectFoodCommentList(SqlSessionTemplate session, String foodSeq, int cPage);

	int countFoodComment(SqlSessionTemplate session, String foodSeq);

	int addFoodLike(SqlSessionTemplate session, Map<String, String> param);

	LikeFood checkFoodLike(SqlSessionTemplate session, Map<String, String> param);

	int delFoodLike(SqlSessionTemplate session, Map<String, String> param);

	int increFoodLike(SqlSessionTemplate session, Map<String, String> param);

	int decreFoodLike(SqlSessionTemplate session, Map<String, String> param);

	int deleteFoodComment(SqlSessionTemplate session, String foodCommentSeq);

	int insertReportFoodComment(SqlSessionTemplate session, Map<String, String> param);

	int increReportFoodComment(SqlSessionTemplate session, Map<String, String> param);

	int increUserReport(SqlSessionTemplate session, Map<String, String> param);

	FoodComment selectFoodComment(SqlSessionTemplate session, String foodCommentSeq);

	int updateFoodComment(SqlSessionTemplate session, Map<String, Object> map);

	int updateFoodStar(SqlSessionTemplate session, Map<String, Object> map);

	int foodViewCountUp(SqlSessionTemplate session, String foodSeq);

	

}

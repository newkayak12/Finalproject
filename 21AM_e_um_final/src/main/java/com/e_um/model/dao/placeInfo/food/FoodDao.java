package com.e_um.model.dao.placeInfo.food;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.placeinfo.food.booking.FoodBooking;
import com.e_um.model.vo.placeinfo.food.comment.FoodComment;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.placeinfo.food.menu.FoodMenu;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FoodDao implements FoodDaoInterface {
	
	@Override
	public List<Food> selectAllFood(SqlSessionTemplate session) {
		return session.selectList("food.selectAllFood");
	}

	@Override
	public int foodInsert(SqlSessionTemplate session, Food food) {
		return session.insert("food.foodInsert", food);
	}
	
	@Override
	public int foodMenuInsert(SqlSessionTemplate session, FoodMenu menu) {
		return session.insert("food.foodMenuInsert", menu);
	}

	@Override
	public List<String> selectFoodCategoryMain(SqlSessionTemplate session) {
		return session.selectList("food.selectFoodCategoryMain");
	}

	@Override
	public List<String> selectFoodCategorySub(SqlSessionTemplate session) {
		return session.selectList("food.selectFoodCategorySub");
	}

	@Override
	public Food selectFood(SqlSessionTemplate session, String foodSeq) {
		return session.selectOne("food.selectFood", foodSeq);
	}

	@Override
	public int foodBooking(SqlSessionTemplate session, FoodBooking booking) {
		return session.insert("food.foodBooking", booking);
	}

	@Override
	public List<FoodBooking> selectMyBookingList(SqlSessionTemplate session, String userId) {
		return session.selectList("food.selectMyBookingList", userId);
	}

	@Override
	public List<Food> searchFood(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectList("food.searchFood", param);
	}

	@Override
	public int insertFoodComment(SqlSessionTemplate session, Map<String, Object> map) {
		return session.insert("food.insertFoodComment", map);
	}

	@Override
	public List<FoodComment> selectFoodCommentList(SqlSessionTemplate session, String foodSeq, int cPage) {
		
		// offset : 시작 : (cPage-1)*numPerPage ( 데이터를 가져오는 시점에서 얼만큼 떨어져있는 데이터인지 ) 
		// limit : 범위 : numPerPage ( 한페이지에 몇개의 데이터가 들어갈지 ) 
		int numPerPage = 5;
	
		return session.selectList("food.selectFoodCommentList", foodSeq, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int countFoodComment(SqlSessionTemplate session, String foodSeq) {
		return session.selectOne("food.countFoodComment", foodSeq);
	}

	

	

}

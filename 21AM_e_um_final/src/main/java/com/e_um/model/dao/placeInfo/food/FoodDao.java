package com.e_um.model.dao.placeInfo.food;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.placeinfo.food.LikeFood;
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

	@Override
	public int addFoodLike(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("food.addFoodLike", param);
	}
	
	@Override
	public int increFoodLike(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("food.increFoodLike", param);
	}

	@Override
	public int delFoodLike(SqlSessionTemplate session, Map<String, String> param) {
		return session.delete("food.delFoodLike", param);
	}

	@Override
	public int decreFoodLike(SqlSessionTemplate session, Map<String, String> param) {
		return session.delete("food.decreFoodLike", param);
	}

	@Override
	public LikeFood checkFoodLike(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectOne("food.checkFoodLike", param);
	}

	@Override
	public int deleteFoodComment(SqlSessionTemplate session, String foodCommentSeq) {
		return session.update("food.deleteFoodComment", foodCommentSeq);
	}

	@Override
	public int insertReportFoodComment(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("food.insertReportFoodComment", param);
	}

	@Override
	public int increReportFoodComment(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("food.increReportFoodComment", param);
	}

	@Override
	public int increUserReport(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("food.increUserReport", param);
	}

	@Override
	public FoodComment selectFoodComment(SqlSessionTemplate session, String foodCommentSeq) {
		return session.selectOne("food.selectFoodComment", foodCommentSeq);
	}

	@Override
	public int updateFoodComment(SqlSessionTemplate session, Map<String, Object> map) {
		return session.update("food.updateFoodComment", map);
	}

	@Override
	public int updateFoodStar(SqlSessionTemplate session, Map<String, Object> map) {
		return session.update("food.updateFoodStar", map);
	}

	@Override
	public int foodViewCountUp(SqlSessionTemplate session, String foodSeq) {
		return session.update("food.foodViewCountUp", foodSeq);
	}

	@Override
	public int insertFoodAlarm(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("food.insertFoodAlarm", param);
	}

	@Override
	public List<Food> selectAllFoodSorting(SqlSessionTemplate session, String con, String cPage) {
		int numPerPage = 12;
		return session.selectList("food.selectAllFoodSorting", con, new RowBounds((Integer.parseInt(cPage)-1)*numPerPage, numPerPage));
	}

	@Override
	public int totalFoodCount(SqlSessionTemplate session) {
		return session.selectOne("food.totalFoodCount");
	}

	@Override
	public List<LikeFood> myLikeFoodList(SqlSessionTemplate session, String userId, int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("food.myLikeFoodList", userId, row);
	}

	@Override
	public List<FoodComment> myFoodCommentList(SqlSessionTemplate session, String userId, int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("food.myFoodCommentList", userId, row);
	}



	

}

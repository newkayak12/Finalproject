package com.e_um.model.sevice.placeInfo.food;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e_um.model.dao.placeInfo.food.FoodDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.placeinfo.food.LikeFood;
import com.e_um.model.vo.placeinfo.food.booking.FoodBooking;
import com.e_um.model.vo.placeinfo.food.comment.FoodComment;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.placeinfo.food.menu.FoodMenu;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FoodService implements FoodServiceInterface {
	
	@Autowired
	FoodDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Food> selectAllFood() {
		return dao.selectAllFood(session);
	}

	
	// @Transactional
	@Override
	public int foodInsert(Food food) {
		
		int result = 0;
		result+=dao.foodInsert(session, food); 
		
		if(result > 0) {
			
			// log.warn("foodInsert에서 테스트, 방금 insert한 food의 시퀀스 : " + food.getFoodSeq());
			
			for(FoodMenu menu : food.getMenus()) {
				menu.setFoodSeq("FO_" + food.getFoodSeq());
				result+=dao.foodMenuInsert(session, menu);
			}
			
			return result;
			
		} else if(result == 1 ){
			
			session.rollback();
			return 0;
			
		} else {
			
			return result;
		}
	}

	@Override
	public List<String> selectFoodCategoryMain() {
		return dao.selectFoodCategoryMain(session);
	}

	@Override
	public List<String> selectFoodCategorySub() {
		return dao.selectFoodCategorySub(session);
	}

	@Override
	public Food selectFood(String foodSeq) {
		return dao.selectFood(session, foodSeq);
	}


	@Override
	public int foodBooking(FoodBooking booking) {	
		
		return dao.foodBooking(session, booking);

	}


	@Override
	public List<FoodBooking> selectMyBookingList(String userId) {
		return dao.selectMyBookingList(session, userId);
	}


	@Override
	public List<Food> searchFood(Map<String, Object> param) {
		return dao.searchFood(session, param);
	}


	@Override
	public int insertFoodComment(Map<String, Object> map) {
		
		// return dao.insertFoodComment(session, map);
		
		int result = dao.insertFoodComment(session, map);
		
		if(result > 0) {
			return dao.updateFoodStar(session, map);
		} else {
			return 0;
		}
		
	}


	@Override
	public List<FoodComment> selectFoodCommentList(String foodSeq, int cPage) {
		return dao.selectFoodCommentList(session, foodSeq, cPage);
	}


	@Override
	public int countFoodComment(String foodSeq) {
		return dao.countFoodComment(session, foodSeq);
	}

	@Transactional
	@Override
	public int addFoodLike(Map<String, String> param) {
		
		int result = dao.addFoodLike(session, param);
		
		if(result > 0) {
			return dao.increFoodLike(session, param);
		} else {
			return 0;
		}
		
	}
	
	@Transactional
	@Override
	public int delFoodLike(Map<String, String> param) {
		
		int result = dao.delFoodLike(session, param);
		
		if(result > 0) {
			return dao.decreFoodLike(session, param);
		} else {
			return 0;
		}
	
	}


	@Override
	public LikeFood checkFoodLike(Map<String, String> param) {
		return dao.checkFoodLike(session, param);
	}


	@Override
	public int deleteFoodComment(String foodCommentSeq) {
		return dao.deleteFoodComment(session, foodCommentSeq);
	}


	@Transactional
	@Override
	public int insertReportFoodComment(Map<String, String> param) {
		
		int result = dao.insertReportFoodComment(session, param);
		
		if(result > 0) {
			int result2 = dao.increReportFoodComment(session, param);
			if(result2 > 0) {
				return dao.increUserReport(session, param);
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	
	}


	@Override
	public FoodComment selectFoodComment(String foodCommentSeq) {
		return dao.selectFoodComment(session, foodCommentSeq);
	}


	@Override
	public int updateFoodComment(Map<String, Object> map) {
		
		// return dao.updateFoodComment(session, map);
	
		int result = dao.updateFoodComment(session, map);
		
		if(result > 0) {
			return dao.updateFoodStar(session, map);
		} else {
			return 0;
		}
		
	}


	@Override
	public int foodViewCountUp(String foodSeq) {
		return dao.foodViewCountUp(session, foodSeq);
	}


	@Override
	public int insertFoodAlarm(Map<String, String> param) {
		return dao.insertFoodAlarm(session, param);
	}


	@Override
	public List<Food> selectAllFoodSorting(String con, String cPage) {
		return dao.selectAllFoodSorting(session, con, cPage);
	}



}

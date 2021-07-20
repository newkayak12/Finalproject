package com.e_um.model.sevice.placeInfo.food;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e_um.model.dao.placeInfo.food.FoodDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
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
}

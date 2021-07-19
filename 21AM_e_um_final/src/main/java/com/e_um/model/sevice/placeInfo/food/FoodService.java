package com.e_um.model.sevice.placeInfo.food;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.placeInfo.food.FoodDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.placeinfo.food.food.Food;

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

	@Override
	public int foodInsert(Food food) {
		
//		if(dao.foodInsert(session, food) != null) {
//			return dao.foodMenuInsert();
//		}
		return dao.foodInsert(session, food);
	}

	@Override
	public List<String> selectFoodCategoryMain() {
		return dao.selectFoodCategoryMain(session);
	}

	@Override
	public List<String> selectFoodCategorySub() {
		return dao.selectFoodCategorySub(session);
	}
}

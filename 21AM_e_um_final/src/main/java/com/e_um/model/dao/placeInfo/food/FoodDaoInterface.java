package com.e_um.model.dao.placeInfo.food;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.placeinfo.food.food.Food;

public interface FoodDaoInterface {

	List<Food> selectAllFood(SqlSessionTemplate session);

}

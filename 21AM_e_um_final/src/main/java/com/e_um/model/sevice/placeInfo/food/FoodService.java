package com.e_um.model.sevice.placeInfo.food;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.placeInfo.food.FoodDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FoodService implements FoodServiceInterface {
	@Autowired
	FoodDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

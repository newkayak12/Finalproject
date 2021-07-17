package com.e_um.controller.placeInfo.food;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e_um.model.sevice.placeInfo.food.FoodServiceInterface;
import com.e_um.model.vo.placeinfo.food.food.Food;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FoodController {

	@Autowired
	FoodServiceInterface service;
	
	@RequestMapping("/test")
	public String test(Model m) {
		
		List<Food> list = service.selectAllFood();
		
		m.addAttribute("list", list);
		
		return "food";
	}
}

package com.e_um.controller.userInfo.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.e_um.model.sevice.userInfo.mypage.MypageServiceInterface;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MypageController {
	
	@Autowired
	MypageServiceInterface service;
	

	@RequestMapping("user/mypage")
	public String gotoMypage(String userId) {
		
		return "myPage";
	}
	
	
	@RequestMapping("user/mypage/openModal")
	public String openMPModal(@RequestParam(value="modalName", defaultValue = "none", required=false) String modalName) {
		return "components/myPage/"+modalName;
	}
	
}

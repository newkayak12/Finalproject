package com.e_um.controller.userInfo.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("user/mypage")
	public String gotoMypage(String userId) {
		
		return "";
	}
	
}

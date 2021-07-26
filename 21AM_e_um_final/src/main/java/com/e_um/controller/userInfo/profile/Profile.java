package com.e_um.controller.userInfo.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Profile {
	
	@RequestMapping("user/profile/start")
	public String gotoProfile(String userId) {
		return"";
	}
	

}

package com.e_um.controller.userInfo.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping("/user/calendar")
	public String calendar() {
		return "cal/calendar";
	}
}

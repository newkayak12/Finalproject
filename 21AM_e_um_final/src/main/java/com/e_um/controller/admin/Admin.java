package com.e_um.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Admin {

	@RequestMapping("/admin/enter")
	public String adminPageEnter() {
		return "admin";
	}
}

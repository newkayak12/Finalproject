package com.e_um.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {

	
	@RequestMapping("/")
	public String main() {
		System.out.println("22");
		return "main";
	}
}

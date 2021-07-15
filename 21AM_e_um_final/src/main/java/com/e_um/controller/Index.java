package com.e_um.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class Index {

	
	@RequestMapping("/test")
	public String main() {
		
		
		log.warn("help");
		return "main";
	}
}

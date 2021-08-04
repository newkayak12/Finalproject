package com.e_um.controller.serviceInfo.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e_um.model.sevice.serviceInfo.faq.FaqServiceInterface;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FaqController {
	
	@Autowired
	FaqServiceInterface service;
	
	
	@RequestMapping("/faq/open")
	public String faqMain() {
		return "faq";
	}
	
}

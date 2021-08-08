package com.e_um.controller.serviceInfo.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	@RequestMapping("faq/view")
	public String openFaqDetailView(Model m, String flag){
		m.addAttribute("flag", flag);
		//log.warn("flag: {}", flag);
		
		return "faq/faqView";
	}
	
	
	@RequestMapping("/faq/getList")
	public String getFaqList(Model m, String flag) {
		m.addAttribute("list", service.selectFAQList(flag));
		//log.warn("list: {}", service.selectFAQList(flag));
		return "components/faq/faqList";
	}
	
	
	@RequestMapping("/faq/searchResult")
	public String searchFAQ(Model m, String keyword) {
		//log.warn("keyword: {}", keyword);
		m.addAttribute("list", service.searchFAQ(keyword));
		m.addAttribute("keyword", keyword);
		return "faq/searchFAQ";
	}
	
}

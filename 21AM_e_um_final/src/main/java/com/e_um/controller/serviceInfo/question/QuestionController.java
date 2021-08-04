package com.e_um.controller.serviceInfo.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e_um.model.sevice.serviceInfo.question.QuestServiceInterface;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class QuestionController {
	
	@Autowired
	QuestServiceInterface service;
	
	
	@RequestMapping("/qna/write/start")
	public String faqMain() {
		return "qna/writeQ";
	}
	
	
	@RequestMapping("/qna/openList")
	public String openQuesList() {
		return "qna/quesList";
	}
	
}

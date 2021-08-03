package com.e_um.controller.userInfo.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.userInfo.report.ReportServiceInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.userInfo.report.Report;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReportController {
	@Autowired
	ReportServiceInterface service;
	
	
	@RequestMapping("/report/reportfeed")
	@ResponseBody
	public int ReportFeed(Report report) {
		
		log.warn("report{}",report);
		
		switch (report.getReportContents()) {
		case "advertisement":
			report.setReportContents("광고성 게시글");
			break;
		case "language":
			report.setReportContents("부적절한 언어 사용");
			break;
		case "imposter":
			report.setReportContents("타인을 사칭합니다.");
			break;
		case "profilePhoto":
			report.setReportContents("부적절한 프로필 사진");
			break;
		case "feed":
			report.setReportContents("부적절한 게시글 사진 및 내용");
			
			break;

		default:
			break;
		}
		
		
		return service.insertReport(report);
	}
	
	
	@RequestMapping("/report/reportprifile")
	@ResponseBody
	public int ReportProfile(Report report) {
		report.setReportTargetContent("user");
		return service.insertReport(report);
	}
}

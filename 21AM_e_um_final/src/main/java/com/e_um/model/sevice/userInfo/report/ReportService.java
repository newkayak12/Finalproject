package com.e_um.model.sevice.userInfo.report;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.report.ReportDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.userInfo.report.Report;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReportService implements ReportServiceInterface {
	@Autowired
	ReportDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	@Override
	public int insertReport(Report report) {
		// TODO Auto-generated method stub
		return dao.insertReport(report, session);
	}
}

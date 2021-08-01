package com.e_um.model.dao.userInfo.report;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;
import com.e_um.model.vo.userInfo.report.Report;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ReportDao implements ReportDaoInterface {@Override
	public int insertReport(Report report, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("report.insertReport", report);
	}

@Override
public int reportCountUpdate(Report report, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	return session.update("report.reportCountUpdate",report);
}


}

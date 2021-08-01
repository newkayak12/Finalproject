package com.e_um.model.dao.userInfo.report;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;
import com.e_um.model.vo.userInfo.report.Report;

public interface ReportDaoInterface {
	public int insertReport(Report report, SqlSessionTemplate session);
	public int reportCountUpdate(Report report, SqlSessionTemplate session);
}

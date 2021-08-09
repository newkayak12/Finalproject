package com.e_um.model.dao.serviceInfo.faq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.serviceinfo.faq.Faq;

public interface FaqDaoInterface {
	
	List<Faq> selectFAQList(SqlSessionTemplate session, String flag);
	
	List<Faq> searchFAQ(SqlSessionTemplate session, String keyword);

}

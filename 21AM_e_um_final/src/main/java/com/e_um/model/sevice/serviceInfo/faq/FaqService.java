package com.e_um.model.sevice.serviceInfo.faq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.serviceInfo.faq.FaqDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.serviceinfo.faq.Faq;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FaqService implements FaqServiceInterface {
	
	@Autowired
	FaqDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public List<Faq> selectFAQList(String flag) {
		return dao.selectFAQList(session, flag);
	}


	@Override
	public List<Faq> searchFAQ(String keyword) {
		return dao.searchFAQ(session, keyword);
	}
	
}

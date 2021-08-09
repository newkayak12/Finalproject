package com.e_um.model.dao.serviceInfo.faq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.serviceinfo.faq.Faq;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FaqDao implements FaqDaoInterface {
	
	@Override
	public List<Faq> selectFAQList(SqlSessionTemplate session, String flag) {
		return session.selectList("faq.selectFAQList",flag);
	}

	
	@Override
	public List<Faq> searchFAQ(SqlSessionTemplate session, String keyword) {
		return session.selectList("faq.searchFAQ",keyword);
	}

}

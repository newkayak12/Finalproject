package com.e_um.model.sevice.serviceInfo.faq;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.serviceInfo.faq.FaqDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FaqService implements FaqServiceInterface {
	@Autowired
	FaqDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

package com.e_um.model.sevice.userInfo.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.mypage.MypageDaoInterface;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MypageService implements MypageServiceInterface {
	
	@Autowired
	MypageDaoInterface dao;
	
	@Autowired
	SqlSessionTemplate session;

}

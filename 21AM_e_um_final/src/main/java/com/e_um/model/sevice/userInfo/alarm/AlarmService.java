package com.e_um.model.sevice.userInfo.alarm;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.alarm.AlarmDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AlarmService implements AlarmServiceInterface {
	@Autowired
	AlarmDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

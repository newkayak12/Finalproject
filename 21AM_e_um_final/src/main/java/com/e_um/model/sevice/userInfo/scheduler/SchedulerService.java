package com.e_um.model.sevice.userInfo.scheduler;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SchedulerService implements SchedulerServiceInterface {
	@Autowired
	SchedulerServiceInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

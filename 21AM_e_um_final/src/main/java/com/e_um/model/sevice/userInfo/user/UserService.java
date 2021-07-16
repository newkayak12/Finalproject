package com.e_um.model.sevice.userInfo.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.user.UserDaoInterface;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService implements UserServiceInterface {
	@Autowired
	UserDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

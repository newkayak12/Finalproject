package com.e_um.model.sevice.groupInfo.group;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.groupInfo.group.GroupDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GroupService implements GroupServiceInterface {
	@Autowired
	GroupDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
}

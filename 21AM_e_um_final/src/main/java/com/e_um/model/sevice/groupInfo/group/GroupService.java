package com.e_um.model.sevice.groupInfo.group;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.groupInfo.group.GroupDaoInterface;
import com.e_um.model.vo.groupinfo.group.Group;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GroupService implements GroupServiceInterface {
	@Autowired
	GroupDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public List<Group> selectGroupList() {
		List<Group> group = dao.selectGroupList(session);
		return group;
	}
	
	@Override
	public int groupInsert(Map param, String userId) {
		return dao.groupInsert(session, param, userId);
	}
	
	@Override
	public List<Group> selectGroupListTop(){
		return dao.selectGroupListTop(session);
	}
	
	
}

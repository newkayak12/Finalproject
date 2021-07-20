package com.e_um.model.dao.groupInfo.group;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.groupinfo.group.Group;

public interface GroupDaoInterface {
	
	List<Group> selectGroupList(SqlSessionTemplate session);
	
	int groupInsert(SqlSessionTemplate session, Map param, String userId);
	
	List<Group> selectGroupListTop(SqlSessionTemplate session);
	
	
}

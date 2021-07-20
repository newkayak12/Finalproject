package com.e_um.model.dao.groupInfo.group;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.groupinfo.group.Group;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class GroupDao implements GroupDaoInterface {
	
	@Override
	public List<Group> selectGroupList(SqlSessionTemplate session) {
		return session.selectList("group.selectGroupList");
	}
	
	@Override 
	public int groupInsert(SqlSessionTemplate session, Map param, String userId) {
		HashMap map = new HashMap();
		map.put("param", param);
		map.put("userId", userId);
		return session.insert("group.groupInsert",map);
	}
	
	@Override
	public List<Group> selectGroupListTop(SqlSessionTemplate session){
		return session.selectList("group.selectGroupListTop");
	}

	
	
	
}

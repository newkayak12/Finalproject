package com.e_um.model.sevice.groupInfo.group;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.groupinfo.group.Group;

public interface GroupServiceInterface {
	
	List<Group> selectGroupList();
	
	int groupInsert(Map param, String userId);
	
	List<Group> selectGroupListTop();
	

}

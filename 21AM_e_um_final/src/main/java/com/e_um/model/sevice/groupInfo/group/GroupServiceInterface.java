package com.e_um.model.sevice.groupInfo.group;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.groupinfo.member.Member;
import com.e_um.model.vo.userInfo.user.User;

public interface GroupServiceInterface {
	
	List<Group> selectGroupList();
	List<Group> selectGroupListConditional(User user);
	
	int groupInsert(Map param, String userId);
	int groupInsert2(Map param);
	
	List<Group> selectGroupListTop();
	
	int groupJoin(Map param);
	
	List<Member> selectGroupUseridCheck(String groupSeq);

}

package com.e_um.model.sevice.groupInfo.group;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.group.Category;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.userInfo.user.User;

public interface GroupServiceInterface {
	
	List<Group> selectGroupList();
	List<Group> selectGroupListConditional(User user);
	
	int groupInsert(Map param, String userId);
	int groupInsert2(Map param);
	
	List<Group> selectGroupListTop();
	
	int groupJoin(Map param);
	
	Group selectGroupUseridCheck(String groupSeq);
	List<Group> selectGrouplistNew();
	List<Category> selectGroupCategory();
	List<Group> selectgamelist();
	List<Group> selectgymlist();
	List<Group> selectmovielist();
	List<Group> selectshoppinglist();
	List<Group> selectreadlist();
	List<Group> selectresturantlist();
	List<Group> selectcooklist();
	List<Group> selectcodinglist();
	
	
	
}

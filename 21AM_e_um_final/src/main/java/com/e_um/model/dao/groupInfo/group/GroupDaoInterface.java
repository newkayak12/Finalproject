package com.e_um.model.dao.groupInfo.group;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.group.Category;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.groupinfo.member.Member;
import com.e_um.model.vo.userInfo.user.User;

public interface GroupDaoInterface {
	
	List<Group> selectGroupList(SqlSessionTemplate session);
	List<Group> selectGroupListConditional(User user,SqlSessionTemplate session);
	
	int groupInsert(SqlSessionTemplate session, Map param, String userId);
	int groupInsert2(SqlSessionTemplate session, Map param);
	
	List<Group> selectGroupListTop(SqlSessionTemplate session);
	
	
	int groupJoin(SqlSessionTemplate session, Map param);
	
	Group selectGroupUseridCheck(SqlSessionTemplate session, String groupSeq);
	List<Group> selectGroupListNew(SqlSessionTemplate session);
	List<Category> selectGroupCategory(SqlSessionTemplate session);
	List<Group> selectgamelist(SqlSessionTemplate session);
	List<Group> selectgymlist(SqlSessionTemplate session);
	List<Group> selectmovielist(SqlSessionTemplate session);
	List<Group> selectshoppinglist(SqlSessionTemplate session);
	List<Group> selectresturantlist(SqlSessionTemplate session);
	List<Group> selectreadlist(SqlSessionTemplate session);
	List<Group> selectcooklist(SqlSessionTemplate session);
	List<Group> selectcodinglist(SqlSessionTemplate session);
	
}

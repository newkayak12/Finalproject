package com.e_um.model.dao.groupInfo.group;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.group.Category;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.groupinfo.member.Member;
import com.e_um.model.vo.userInfo.user.User;

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
		param.put("userId", userId);
		
		log.error("이거맞음?{}",param);
		return session.insert("group.groupInsert",param);
	}
	
	@Override
	public int groupInsert2(SqlSessionTemplate session, Map param) {
		return session.insert("group.groupInsert2",param);
	}

	@Override
	public List<Group> selectGroupListTop(SqlSessionTemplate session){
		return session.selectList("group.selectGroupListTop");
	}

	@Override
	public List<Group> selectGroupListConditional(User user, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("group.selectGroupListConditional", user);
	}

	@Override
	public int groupJoin(SqlSessionTemplate session, Map param) {
		return session.insert("group.groupJoin",param);
	}

	@Override
	public Group selectGroupUseridCheck(SqlSessionTemplate session, String groupSeq) {
		
		return session.selectOne("group.selectGroupUseridCheck", groupSeq);
	}

	@Override
	public List<Group> selectGroupListNew(SqlSessionTemplate session) {
		
		return session.selectList("group.selectGroupListNew");
	}

	@Override
	public List<Category> selectGroupCategory(SqlSessionTemplate session) {
		
		return session.selectList("group.selectGroupCategory");
	}
	
	
}

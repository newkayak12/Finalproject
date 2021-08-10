package com.e_um.model.sevice.groupInfo.group;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.e_um.model.dao.groupInfo.group.GroupDaoInterface;
import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.group.Category;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.groupinfo.member.Member;
import com.e_um.model.vo.userInfo.user.User;

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
	@Transactional
	public int groupInsert(Map param, String userId) {
		int result = dao.groupInsert(session, param, userId);
		if(result>0) {
			dao.groupInsert2(session, param);
			log.warn("asdasdsad{}", param);
		}
		return result;
	}
	
	@Override
	public int groupInsert2(Map param) {
		int result = dao.groupInsert2(session, param);
		return result ;
	}
	
	@Override
	public List<Group> selectGroupListTop(){
		return dao.selectGroupListTop(session);
	}

	@Override
	public List<Group> selectGroupListConditional(User user) {
		// TODO Auto-generated method stub
		return dao.selectGroupListConditional(user, session);
	}

	

	@Override
	public int groupJoin(Map param) { 
		return dao.groupJoin(session, param);
	}

	@Override
	public Group selectGroupUseridCheck(String groupSeq) {
		 
		return dao.selectGroupUseridCheck(session,groupSeq);
	}

	@Override
	public List<Group> selectGrouplistNew() {
		
		return dao.selectGroupListNew(session);
	}

	@Override
	public List<Category> selectGroupCategory() {
		
		return dao.selectGroupCategory(session);
	}

	@Override
	public List<Group> selectgamelist() {
		
		List<Group> group = dao.selectgamelist(session);
		return group;
	}

	@Override
	public List<Group> selectgymlist() {
		List<Group> group = dao.selectgymlist(session);
		return group;
	}

	@Override
	public List<Group> selectmovielist() {
		List<Group> group = dao.selectmovielist(session);
		return group;
	}

	@Override
	public List<Group> selectshoppinglist() {
		List<Group> group = dao.selectshoppinglist(session);
		return group;
	}

	@Override
	public List<Group> selectreadlist() {
		List<Group> group = dao.selectreadlist(session);
		return group;
	}

	@Override
	public List<Group> selectresturantlist() {
		List<Group> group = dao.selectresturantlist(session);
		return group;
	}

	@Override
	public List<Group> selectcooklist() {
		List<Group> group = dao.selectcooklist(session);
		return group;
	}

	@Override
	public List<Group> selectcodinglist() {
		List<Group> group = dao.selectcodinglist(session);
		return group;
	}

	
	
	
	
	
}

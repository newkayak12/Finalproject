package com.e_um.model.dao.groupInfo.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.groupinfo.board.Board;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardDao implements BoardDaoInterface {
	@Override
	public int groupboardinsert(SqlSessionTemplate session, Board board) {
		// TODO Auto-generated method stub
		return session.insert("group.groupboardinsert", board);
	}

}

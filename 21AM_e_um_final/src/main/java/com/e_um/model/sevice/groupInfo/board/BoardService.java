package com.e_um.model.sevice.groupInfo.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.groupInfo.board.BoardDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.groupinfo.board.Board;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService implements BoardServiceInterface {
	@Autowired
	BoardDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	
	@Override
	public int groupboardinsert(Board board) {
		return dao.groupboardinsert(session,board);
		
	}
}

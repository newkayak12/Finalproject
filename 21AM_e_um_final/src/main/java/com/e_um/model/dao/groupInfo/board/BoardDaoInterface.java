package com.e_um.model.dao.groupInfo.board;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.groupinfo.board.Board;

public interface BoardDaoInterface {

	int groupboardinsert(SqlSessionTemplate session, Board board);

}

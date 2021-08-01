package com.e_um.model.sevice.groupInfo.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.groupInfo.board.BoardDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.comment.Comment;

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



	@Override
	public List<Board> selectBoardList(String groupSeq) {
		// TODO Auto-generated method stub
		return dao.selectBoardList(session,groupSeq);
	}



	@Override
	public Board selectGroupBoard(String groupBoardSeq) {
		// TODO Auto-generated method stub
		return dao.selectGroupBoard(session,groupBoardSeq);
	}



	@Override
	public List<Comment> selectGroupBoardComment(String groupBoardSeq) {
		// TODO Auto-generated method stub
		return dao.selectGroupBoardComment(session, groupBoardSeq);
	}



	@Override
	public int groupboardfileinsert(Map<String, Object> map) {
		
		return dao.groupboardfileinsert(session, map);
	}
	
	
	

	
	
}

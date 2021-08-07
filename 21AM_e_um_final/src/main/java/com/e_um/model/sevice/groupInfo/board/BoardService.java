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
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.groupinfo.likeBoard.LikeBoard;

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
		log.warn("sevievievievie{}",groupBoardSeq);
		return dao.selectGroupBoardComment(session, groupBoardSeq);
	}



	@Override
	public int groupboardfileinsert(Map<String, Object> map) {
		
		return dao.groupboardfileinsert(session, map);
	}



	@Override
	public int addBoardLike(Map<String, String> param) {
	
		return dao.addBoardLike(session, param);
	}



	@Override
	public int delBoardLike(Map<String, String> param) {
	
		return dao.delBoardLike(session, param);
	}



	@Override
	public LikeBoard checkBoardLike(Map<String, String> param) {
		
		return dao.checkBoardLike(session, param);
	}



	@Override
	public List<Board> selectBoardListBest(String groupSeq) {
		return dao.selectBoardListBest(session, groupSeq);
	}



	@Override
	public List<Board> selectBoardSearchList(Map param) {
		
		return dao.selectBoardSearchList(session,param);
	}



	@Override
	public int groupboardinsertmaster(Board board) {
		
		return dao.groupboardinsertmaster(session, board);
	}



	@Override
	public Group selectGroupMaster(String groupSeq) {
		
		return dao.selectGroupMaster(session, groupSeq);
	}



	@Override
	public List<Board> selectBoardListNotice(String groupSeq) {
	
		return dao.selectBoardListNotice(session, groupSeq);
	}



	@Override
	public int groupCountToday(String groupSeq) {
		log.warn("servicecece{}",groupSeq);
		return dao.groupCountToday(session, groupSeq);
	}



	@Override
	public List<Comment> selectBoardCommentList(String groupBoardSeq) {
		log.warn("commentservice{}",groupBoardSeq);
		return dao.selectBoardCommentList(session, groupBoardSeq);
	}



	@Override
	public int addComment(Map param) {
		 
		return dao.addComment(session, param);
	}



	@Override
	public int delComment(String groupCommentSeq) {
		
		return dao.delComment(session, groupCommentSeq);
	}



	@Override
	public int checkCommentReport(Map<String, String> param) {

		return dao.checkCommentReport(session, param);
	}



	@Override
	public int CommentReport(Map<String, String> param) {
		 
		return dao.CommentReport(session, param);
	}
	
	
	 
	
	
	
	
}

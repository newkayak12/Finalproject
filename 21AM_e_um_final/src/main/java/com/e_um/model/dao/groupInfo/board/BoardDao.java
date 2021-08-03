package com.e_um.model.dao.groupInfo.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.comment.Comment;
import com.e_um.model.vo.groupinfo.likeBoard.LikeBoard;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardDao implements BoardDaoInterface {
	@Override
	public int groupboardinsert(SqlSessionTemplate session, Board board) {
		// TODO Auto-generated method stub
		return session.insert("group.groupboardinsert", board);
	}

	@Override
	public List<Board> selectBoardList(SqlSessionTemplate session,String groupSeq) {
		// TODO Auto-generated method stub
		return session.selectList("group.selectBoardList",groupSeq);
	}

	@Override
	public Board selectGroupBoard(SqlSessionTemplate session, String groupBoardSeq) {
		// TODO Auto-generated method stub
		return session.selectOne("group.selectGroupBoard",groupBoardSeq);
	}

	@Override
	public List<Comment> selectGroupBoardComment(SqlSessionTemplate session, String groupBoardSeq) {
		// TODO Auto-generated method stub
		
		log.warn("daodaodaodao{}",groupBoardSeq);
		return session.selectList("group.selectGroupBoardComment",groupBoardSeq);
	}

	@Override
	public int groupboardfileinsert(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("group.groupboardfileinsert",map);
	}

	@Override
	public int addBoardLike(SqlSessionTemplate session, Map<String, String> param) {
//		int result = session.insert("group.insertAddBoardLike",param);
		
		log.error("mapmpampamapmapmapmapamp{}",param);
		return session.insert("group.insertAddBoardLike",param) ; 
	}

	@Override
	public int delBoardLike(SqlSessionTemplate session, Map<String, String> param) {
	
		return session.delete("group.insertDelBoardLike",param);
	}

	@Override
	public LikeBoard checkBoardLike(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectOne("group.checkBoardLike", param);
	}

	@Override
	public List<Board> selectBoardListBest(SqlSessionTemplate session, String groupSeq) {
		
		return session.selectList("group.selectBoardListBest",groupSeq);
	}

	@Override
	public List<Board> selectBoardSearchList(SqlSessionTemplate session, Map param) {
		
		return session.selectList("group.selectBoardSearchList",param);
	}

	@Override
	public int groupboardinsertmaster(SqlSessionTemplate session, Board board) {
		// TODO Auto-generated method stub
		return session.insert("group.groupboardinsertmaster",board);
	}
	
	
	
	

}

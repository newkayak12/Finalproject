package com.e_um.model.dao.groupInfo.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.comment.Comment;

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
		return session.selectList("group.selectGroupBoardComment",groupBoardSeq);
	}
	
	
	

}

package com.e_um.model.dao.groupInfo.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.comment.Comment;
import com.e_um.model.vo.groupinfo.likeBoard.LikeBoard;

public interface BoardDaoInterface {

	int groupboardinsert(SqlSessionTemplate session, Board board);

	List<Board> selectBoardList(SqlSessionTemplate session, String groupSeq);
	
	Board selectGroupBoard(SqlSessionTemplate session, String groupBoardSeq);

	List<Comment> selectGroupBoardComment(SqlSessionTemplate session, String groupBoardSeq);

	int groupboardfileinsert(SqlSessionTemplate session, Map<String, Object> map);

	int addBoardLike(SqlSessionTemplate session, Map<String, String> param);

	int delBoardLike(SqlSessionTemplate session, Map<String, String> param);

	LikeBoard checkBoardLike(SqlSessionTemplate session, Map<String, String> param);

}

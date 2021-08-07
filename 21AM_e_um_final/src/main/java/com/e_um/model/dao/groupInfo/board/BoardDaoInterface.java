package com.e_um.model.dao.groupInfo.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.comment.Comment;
import com.e_um.model.vo.groupinfo.group.Group;
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

	List<Board> selectBoardListBest(SqlSessionTemplate session, String groupSeq);

	List<Board> selectBoardSearchList(SqlSessionTemplate session, Map param);

	int groupboardinsertmaster(SqlSessionTemplate session, Board board);

	Group selectGroupMaster(SqlSessionTemplate session, String groupSeq);

	List<Board> selectBoardListNotice(SqlSessionTemplate session, String groupSeq);

	int groupCountToday(SqlSessionTemplate session, String groupSeq);

	List<Comment> selectBoardCommentList(SqlSessionTemplate session, String groupBoardSeq);

	int addComment(SqlSessionTemplate session, Map param);

	int delComment(SqlSessionTemplate session, String groupCommentSeq);

	int checkCommentReport(SqlSessionTemplate session, Map<String, String> param);

	int CommentReport(SqlSessionTemplate session, Map<String, String> param);

}

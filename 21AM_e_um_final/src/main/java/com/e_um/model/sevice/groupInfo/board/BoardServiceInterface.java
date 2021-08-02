package com.e_um.model.sevice.groupInfo.board;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.groupinfo.board.Board;
import com.e_um.model.vo.groupinfo.comment.Comment;
import com.e_um.model.vo.groupinfo.likeBoard.LikeBoard;

public interface BoardServiceInterface {

	int groupboardinsert(Board board);

	List<Board> selectBoardList(String groupSeq);
	
	Board selectGroupBoard(String groupBoardSeq);
	
	List<Comment> selectGroupBoardComment(String groupBoardSeq);

	int groupboardfileinsert(Map<String, Object> map);

	int addBoardLike(Map<String, String> param);

	int delBoardLike(Map<String, String> param);

	LikeBoard checkBoardLike(Map<String, String> param);

	List<Board> selectBoardListBest(String groupSeq);
	
}

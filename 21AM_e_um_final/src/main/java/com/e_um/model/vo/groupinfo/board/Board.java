package com.e_um.model.vo.groupinfo.board;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.groupinfo.photo.Photo;
import com.e_um.model.vo.userInfo.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Board {
	/*
	 * user를 join 할 떄, 전체를 다 가져와야하는지를 고민해볼 필요가 있음
	 */
	
	private String groupSeq;
	private String groupBoardSeq;
	private User groupBoardUser;
	private String groupBoardTitle, groupBoardContents;
	private Date groupBoardDate;
	private String groupBoardLevel, groupBoardFlag, groupBoardBlock;
	
	private Photo groupBoardPhoto;
	
	private int groupBest;
	
	
//	private List<LikeBoard> likeBoard = new ArrayList<>();
	/*
	 * 보류
	 */
	
}

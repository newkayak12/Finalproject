package com.e_um.model.vo.groupinfo.board;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.groupinfo.member.Member;

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
	private String groupBoardSeq, userId, groupBoardTitle, groupBoardContents;
	private Date groupBoardDate;
	private String groupBoardFile, groupBoardFlag, groupBoardBlock;
	
	
}

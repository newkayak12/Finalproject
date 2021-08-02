package com.e_um.model.vo.groupinfo.likeBoard;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class LikeBoard {
	private String groupSeq;
	private String groupBoardSeq;
	private String likeBoardId;
	private Date likeGroupDate;
}

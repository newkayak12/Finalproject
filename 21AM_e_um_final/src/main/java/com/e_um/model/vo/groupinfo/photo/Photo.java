package com.e_um.model.vo.groupinfo.photo;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.groupinfo.board.Board;
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
public class Photo {
	private String groupBoardSeq;
	private String groupBoardPhoto1;
	private String groupBoardPhoto2;
	private String groupBoardPhoto3;
}

package com.e_um.model.vo.groupinfo.comment;

import java.util.Date;

import org.springframework.stereotype.Component;

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
public class Comment {
	
	private String groupCommentSeq;
	/*
	 * 사용자 프로필 로드를 위한 User 
	 * 불필요하다면 String으로 변경 가능
	 */
	private User groupCommentUser;
	
	/*
	 *  대댓글에 대한 ref와 level
	 */
	private String groupCommentRef;
	private int groupCommentLevel;
	private String groupBoardSeq;
	
	private String groupCommentContents, groupCommentBlock, groupCommentFlag;
	private Date groupCommentDate;

}

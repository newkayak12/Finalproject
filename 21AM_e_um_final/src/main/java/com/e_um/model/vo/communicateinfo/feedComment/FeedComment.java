package com.e_um.model.vo.communicateinfo.feedComment;

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
public class FeedComment {
	
	private String feedCommentSeq;
	private String feedSeqRef;
	private String commenter, commenterNick, commenterProfile;
	private String feedCommentRef;
	private Date feedCommentDate;
	private int feedCommentLevel;
	private String feedCommentContents, feedCommentFlag, feedCommentBlock;
	
}

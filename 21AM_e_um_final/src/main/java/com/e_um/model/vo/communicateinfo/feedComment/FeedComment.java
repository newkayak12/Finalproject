package com.e_um.model.vo.communicateinfo.feedComment;

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
	
	private User user;
	private String feedCommentRef;
	private int feedCommentLevel;
	private String feedCommentContents, feedCommentFlag, feedCommentBlock;
	
}

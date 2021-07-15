package com.e_um.model.vo.groupinfo.comment;

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
public class Comment {
	
	private String groupCommentSeq, groupCommentContents, groupCommentBlock;

}

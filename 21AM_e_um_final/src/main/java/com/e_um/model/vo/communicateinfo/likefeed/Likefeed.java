package com.e_um.model.vo.communicateinfo.likefeed;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.groupinfo.comment.Comment;
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
public class Likefeed {
	private String feedSeq;
	private String likeFeedId;
}

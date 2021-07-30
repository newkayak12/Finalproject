package com.e_um.model.vo.communicateinfo.feed;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class NoHasAFeed {
	
	private String feedSeq, feederId, feedContents;
	private Date feedDate;
	private String feedImage1, feedImage2, feedImage3, feedFlag, feedBlock;

}

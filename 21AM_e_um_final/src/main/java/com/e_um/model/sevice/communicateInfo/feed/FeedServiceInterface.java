package com.e_um.model.sevice.communicateInfo.feed;

import java.util.List;

import com.e_um.model.vo.communicateinfo.feed.Feed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;

public interface FeedServiceInterface {
	public List<Feed> feedList(String userId, int cPage) ;
	public List<FeedComment>feedComment(String foodSeq);
	public int likeFeed(String seq, String userId);
	public int unlikeFeed(String seq, String userId);
	public int insertComment(FeedComment feedComment) ;
	public int deleteComment(FeedComment feedComment) ;
}

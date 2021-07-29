package com.e_um.model.dao.communicateInfo.feed;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.feed.Feed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;

public interface FeedDaoInterface {

	 public List<Feed> feedList(String userId,int cPage, SqlSessionTemplate session) ;
	 public List<FeedComment>feedComment(String foodSeq,  SqlSessionTemplate session);
	 public int likeFeed(String seq, String userId,  SqlSessionTemplate session);
	public int unlikeFeed(String seq, String userId,  SqlSessionTemplate session);
	public int insertComment(FeedComment feedComment, SqlSessionTemplate session);
	public int deleteComment(FeedComment feedComment, SqlSessionTemplate session);
}

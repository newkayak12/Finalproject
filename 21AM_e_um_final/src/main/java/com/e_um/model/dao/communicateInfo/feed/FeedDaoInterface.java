package com.e_um.model.dao.communicateInfo.feed;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.feed.Feed;

public interface FeedDaoInterface {

	 public List<Feed> feedList(String userId,int cPage, SqlSessionTemplate session) ;
}

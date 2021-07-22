package com.e_um.model.sevice.communicateInfo.feed;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.communicateinfo.feed.Feed;

public interface FeedServiceInterface {
	public List<Feed> feedList(String userId, int cPage) ;
}

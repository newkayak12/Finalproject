package com.e_um.model.sevice.communicateInfo.feed;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.communicateInfo.feed.FeedDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.communicateinfo.feed.Feed;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FeedService implements FeedServiceInterface {
	@Autowired
	FeedDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	@Override
	public List<Feed> feedList(String userId, int cPage) {
		// TODO Auto-generated method stub
		return dao.feedList(userId, cPage, session);
	}
}

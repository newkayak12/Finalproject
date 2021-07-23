package com.e_um.model.sevice.communicateInfo.feed;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.communicateInfo.feed.FeedDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.communicateinfo.feed.Feed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;

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
		
		List<Feed> result = dao.feedList(userId, cPage, session);
		
			for(int i =0; i<result.size(); i++) {
				
				log.warn("시간이 얼마가 걸리든{}", result.get(i).getFeedSeq());
				log.warn("시간이 얼마가 걸리든{}", dao.feedComment(result.get(i).getFeedSeq(), session));
				result.get(i).setCommentlist(dao.feedComment(result.get(i).getFeedSeq(), session));
				
			}
			
			
		log.warn("결과는?{}",result);
		return result;
	}
	@Override
	public List<FeedComment> feedComment(String foodSeq) {
		// TODO Auto-generated method stub
		return dao.feedComment(foodSeq, session);
	}
	@Override
	public int likeFeed(String seq, String userId) {
		// TODO Auto-generated method stub
		return dao.likeFeed(seq, userId, session);
	}
	@Override
	public int unlikeFeed(String seq, String userId) {
		// TODO Auto-generated method stub
		return dao.unlikeFeed(seq, userId, session);
	}
}

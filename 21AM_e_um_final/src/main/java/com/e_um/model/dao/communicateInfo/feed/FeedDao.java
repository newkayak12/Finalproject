package com.e_um.model.dao.communicateInfo.feed;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.communicateinfo.feed.Feed;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class FeedDao implements FeedDaoInterface {@Override
	public List<Feed> feedList(String userId, int cPage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
//		numberPerPage ==5
		int numberPerPage =5;
		return session.selectList("feed.feedList",userId, new RowBounds((cPage-1)*numberPerPage, numberPerPage));
	}

}

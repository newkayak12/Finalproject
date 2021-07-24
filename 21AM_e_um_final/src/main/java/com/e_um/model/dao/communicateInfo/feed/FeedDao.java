package com.e_um.model.dao.communicateInfo.feed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.vo.communicateinfo.feed.Feed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;

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



@Override
public List<FeedComment> feedComment(String feedSeq, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	return session.selectList("feed.feedComment",feedSeq);
}



@Override
public int likeFeed(String seq, String userId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	
	Map param = new HashMap();
	param.put("seq", seq);
	param.put("userId", userId);
	
	return session.insert("feed.like", param);
}



@Override
public int unlikeFeed(String seq, String userId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	Map param = new HashMap();
	param.put("seq", seq);
	param.put("userId", userId);
	
	return session.insert("feed.unlike", param);
}



@Override
public int insertComment(FeedComment feedComment, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	return session.insert("feed.insertComment", feedComment);
}



@Override
public int deleteComment(FeedComment feedComment, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	return session.delete("feed.deleteComment", feedComment);
}

}

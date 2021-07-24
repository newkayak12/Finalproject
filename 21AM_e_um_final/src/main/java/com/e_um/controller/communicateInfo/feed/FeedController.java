package com.e_um.controller.communicateInfo.feed;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.communicateInfo.feed.FeedServiceInterface;
import com.e_um.model.vo.communicateinfo.feed.Feed;
import com.e_um.model.vo.communicateinfo.feedComment.FeedComment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FeedController {

		@Autowired
		FeedServiceInterface service;
		
		
		
		@RequestMapping("/feed/feedList")
		public String feedList(@RequestParam(value="userId", defaultValue = "newkayak12")String userId, @RequestParam(value = "cPage", defaultValue = "1") int cPage, Model model) {
			List<Feed> result =  service.feedList(userId,cPage);
			log.warn("{}",result);
			List<Integer> index = new ArrayList();
			for(int i = (cPage-1)*5+1; i<=cPage*5; i++  ) {
				index.add(i);
			}
			model.addAttribute("index",index);
			model.addAttribute("list",result);
			return "components/feed/feed";
		}
		
		@ResponseBody
		@RequestMapping("/feed/likeunlike")
		public int likeUnlike(String seq, String flag, String userId) {
			
			log.warn(userId);
			log.warn(seq);
			log.warn(flag);
			int result = 0;
			
			if(flag.equals("unlike")) {
//				안좋아요 상태에서 좋아요로 변경
				result = service.likeFeed(seq, userId);
				
				
			}else if(flag.equals("like")) {
//				좋아요 상태에서 안좋아요로 변경
				result = service.unlikeFeed(seq, userId);
			}
			
			
			return result;
		}
		
		@ResponseBody
		@RequestMapping("/feed/comment")
		public int insertComment(FeedComment feedComment, String feedCommentContent) {
			feedComment.setFeedCommentContents(feedCommentContent);
			log.warn("ㅇㅎㄴㅇㄴㅇ{}",feedComment);
			return service.insertComment(feedComment);
		}
		
		@ResponseBody
		@RequestMapping("/feed/deletecomment")
		public int deleteComment(FeedComment feedComment) {
			log.warn("{}", feedComment);
			return service.deleteComment(feedComment);
		}
		
}

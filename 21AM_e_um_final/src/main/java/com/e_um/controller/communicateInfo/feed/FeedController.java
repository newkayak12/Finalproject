package com.e_um.controller.communicateInfo.feed;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.communicateInfo.feed.FeedServiceInterface;
import com.e_um.model.vo.communicateinfo.feed.Feed;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class FeedController {

		@Autowired
		FeedServiceInterface service;
		
		
		
		@RequestMapping("/feed/feedList")
		public String feedList(@RequestParam(value="userId", defaultValue = "newkayak12")String userId, @RequestParam(value = "cPage", defaultValue = "1") int cPage, Model model) {
			List<Feed> result =  service.feedList(userId,cPage);
			log.warn("{}",result);
			log.warn("{}",result.size());
			model.addAttribute("list",result);
			return "components/feed/feedlist";
		}
}

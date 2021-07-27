package com.e_um.controller.communicateInfo.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.communicateInfo.friend.FriendServiceInterface;
import com.e_um.model.vo.communicateinfo.friend.Friend;
import com.e_um.model.vo.communicateinfo.guestbook.Guestbook;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FriendController {
	
	@Autowired
	FriendServiceInterface service;
	
	
	@RequestMapping("/friend/main")
	public String friendMain() {
		return "friend";
	}

	
	@RequestMapping("/friend/openmodal/start")
	public String selectUserOne(@RequestParam(value="userId", required=false) String userId, Model m) {
//		log.warn("boxId: {}",userId);
//		log.warn("boxId: {}",service.selectUserOne(userId));
		m.addAttribute("friend",service.selectUserOne(userId));
//		m.addAttribute("userId",userId);
		return "components/friend/userInfoModal";
	}
	
	
	@ResponseBody
	@RequestMapping("/friend/applyfriend/start")
	public int applyFriend(HttpServletRequest rq, @RequestParam(value="friendId", required=false) String friendId) {
		User user=(User)rq.getSession().getAttribute("userSession");
		Map param=new HashMap();
		param.put("myId", user.getUserId());
		param.put("friendId", friendId);
		return service.insertFriend(param);
	}
	
	
	@RequestMapping("/friend/infiniteScroll")
	public String infiniteUser(HttpServletRequest rq, @RequestParam(value="index", required=false) int index, Model m){
		User user=(User)rq.getSession().getAttribute("userSession");
		int btnsu=6;
		/*
		 * for(User u:service.selectAllUser(user.getUserId(),index,btnsu)) {
		 * log.warn("infinite user: {}",u); }
		 */
		m.addAttribute("list", service.selectAllUser(user.getUserId(),index,btnsu));
		return "components/friend/friendBtn";
	}
	
	
	@RequestMapping("/friend/searchKeyword")
	public String searchKeyword(HttpServletRequest rq, Model m,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="gender", required=false) String gender,
			@RequestParam(value="address", required=false) String address,
			@RequestParam(value="age", required=false) String ageStr,
			@RequestParam(value="interestArr[]", required=false) List<String> interestArr) {
		
		User user=(User)rq.getSession().getAttribute("userSession");
		
//		log.warn("검색어: {}",keyword);
//		log.warn("성별: {}",gender);
//		log.warn("주소: {}",address);
//		log.warn("나이: {}",ageStr);
//		log.warn("관심사: {}",interestArr);
		
		if(gender!=null) {
			switch(gender) {
			case "남": gender="M"; break;
			case "여": gender="F";
			}			
		}
		
		int age=0;
		if(ageStr!=null) {
			switch(ageStr) {
			case "20대": age=20; break;
			case "30대": age=30; break;
			case "40대": age=40;
			}			
		}
		int ageEnd=age+9;
		
//		log.warn("--성별: {}",gender);
//		log.warn("--나이: {}",age);
//		log.warn("--나이+9: {}",ageEnd);
		
		Map param=new HashMap();
		param.put("userId", user.getUserId());
		param.put("keyword", keyword);
		param.put("gender", gender);
		param.put("address", address);
		param.put("age", age);
		param.put("ageEnd", ageEnd);
		param.put("interestArr", interestArr);
		
//		log.warn("list 통째로 검색 결과: {}",service.searchKeyword(param));
//		log.warn("list 통째로 boolean: {}",service.searchKeyword(param).size());
//		for(User u:service.searchKeyword(param)) {			
//			log.warn("검색 결과: {}",u);
//		}
		
		if(service.searchKeyword(param).size()!=0) {
			m.addAttribute("list",service.searchKeyword(param));
			return "components/friend/friendBtn";
		}else {
			m.addAttribute("msg", "검색 결과가 없습니다.");
			return "common/msgDiv";
		}
		
	}
	
	
	@RequestMapping("/friend/isexist")
	@ResponseBody
	public int isExist(String friendId, HttpServletRequest rq) {
		User user = (User) (rq.getSession().getAttribute("userSession"));
		Friend friend = Friend.builder().myId( user.getUserId() ).friendId(friendId).build();
		return service.isExist(friend);
	}
	
	@RequestMapping("/friend/fetchfriendlist")
	@ResponseBody
	public List<Friend> fetchFriendList(String userId, Model model) {
		
		return service.fetchFriendList(userId);
	}

}

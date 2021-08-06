package com.e_um.controller.admin;

import static com.e_um.common.pagebar.PageBar.getPageBar;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e_um.model.sevice.admin.AdminServiceInterface;
import com.e_um.model.sevice.placeInfo.food.FoodServiceInterface;
import com.e_um.model.vo.groupinfo.group.Group;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.userInfo.report.ReportFeed;
import com.e_um.model.vo.userInfo.user.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@Autowired
	AdminServiceInterface service;
	
	@Autowired
	FoodServiceInterface fservice;
	
	@Autowired
	ObjectMapper obj;
	
	@RequestMapping("/admin/enter")
	public String adminPageEnter() {
		return "admin";
	}
	
	@RequestMapping("/admin/menu")
	public String adminMenu() {
		return "components/admin/adminmenu";
	}

	@RequestMapping("/admin/manageuser")
	public String manageUser(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
		
		List<User> list = service.manageUser(Integer.parseInt(cPage), numPerPage);
		List<User> statistics = service.statisticsUser();
		int men = service.getMenCount();
		int women =service.getWomenCount();
		log.warn("{}",list);
		
		int seoul = 0;
		int busan = 0;
		int daegu = 0;
		int incheon =0;
		int gwangju =0;
		int daejeon = 0;
		int ulsan =0;
		int gyeonggi = 0;
		int gangwon = 0;
		int chungbuk  = 0;
		int chungnam = 0;
		int jeonbuk =0;
		int jeonnam =0;
		int gyeongbuk =0;
		int gyeonnam =0;
		int jeju =0; 
		
		for(User u : statistics) {
			switch (u.getUserAddrBasic().substring(0, 2)) {
			case "서울":
				seoul+=1;
				break;
			case "부산":
				busan+=1;
				break;
			case "대구":
				daegu+=1;
				break;
			case "인천":
				incheon+=1;
				break;
			case "광주":
				gwangju+=1;
				break;
			case "대전":
				daejeon+=1;
				break;
			case "울산":
				ulsan+=1;
				break;
			case "경기":
				gyeonggi+=1;
				break;
			case "강원":
				gangwon+=1;
				break;
			case "충북":
				chungbuk+=1;
				break;
			case "충남":
				chungnam+=1;
				break;
			case "전북":
				jeonbuk+=1;
				break;
			case "전남":
				jeonnam+=1;
				break;
			case "경북":
				gyeongbuk+=1;
				break;
			case "경남":
				gyeonnam+=1;
				break;
			case "제주":
				jeju+=1;
				break;
			}
			
			
		}
		
		model.addAttribute("seoul", seoul);
		model.addAttribute("busan", busan);
		model.addAttribute("daegu", daegu);
		model.addAttribute("incheon", incheon);
		model.addAttribute("gwangju", gwangju);
		model.addAttribute("daejeon", daejeon);
		model.addAttribute("ulsan", ulsan);
		model.addAttribute("gyeonggi", gyeonggi);
		model.addAttribute("gangwon", gangwon);
		model.addAttribute("chungbuk", chungbuk);
		model.addAttribute("chungnam", chungnam);
		model.addAttribute("jeonbuk", jeonbuk);
		model.addAttribute("jeonnam", jeonnam);
		model.addAttribute("gyeongbuk", gyeongbuk);
		model.addAttribute("gyeonnam", gyeonnam);
		model.addAttribute("jeju", jeju);
		
		
		
		model.addAttribute("men",men);
		model.addAttribute("women",women);
		model.addAttribute("list",list);
		
		model.addAttribute("pageBar", getPageBar(service.userTotalData(), Integer.parseInt(cPage) ,numPerPage ,"manageUser"));
		return "components/admin/manageuser";
	}
	
	@RequestMapping("/admin/blockuser")
	@ResponseBody
	public int blockUser(String userId) {
		return service.blockUser(userId);
	}
	
	@RequestMapping("/admin/unblockuser")
	@ResponseBody
	public int unblockUser(String userId) {
		return service.unblockUser(userId);
	}
	
	@RequestMapping("/admin/managegroup")
	public String manageGroup(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
		model.addAttribute("list",service.manageGroup(Integer.parseInt(cPage), numPerPage));
		List<Group> statistics = service.statisticsGroup();
		
		int game = 0;
		int athletics =0;
		int cook =0;
		int movie =0;
		int food = 0;
		int book = 0;
		int shopping = 0;
		int coding = 0;
		
		int genderAll = 0;
		int men = 0;
		int women = 0;
		
		
		int ageAll =0;
		int twenty = 0;
		int thirty = 0;
		int fourty = 0;
		
		
		for(Group g : statistics){
			switch (g.getGroupTheme()) {
			case "게임":
				game+=1;
				break;
			case "운동":
				athletics+=1;
				break;
			case "요리":
				cook+=1;
				break;
			case "영화":
				movie+=1;
				break;
			case "맛집":
				food+=1;
				break;
			case "독서":
				book+=1;
				break;
			case "쇼핑":
				shopping+=1;
				break;
			case "코딩":
				coding+=1;
				break;
			}
			
			switch (g.getGroupGender()) {
			case "all":
				genderAll+=1;
				break;
			case "M":
				men+=1;
				break;
			case "F":
				women+=1;
				break;

			}
			
			switch (g.getGroupAge()) {
			case "ageall":
				ageAll+=1;
				break;
			case "agea20":
				twenty+=1;
				break;
			case "age30":
				thirty+=1;
				break;
			case "agea40":
				fourty+=1;
				break;

			
			}
		}
		
		
		
		
		
		int[] ageList = {ageAll, twenty, thirty, fourty};
		int[] genderList = {genderAll, men, women};
		int[] themeList = {game, athletics, cook, movie, food, book, shopping, coding};
		model.addAttribute("ageList", ageList);
		model.addAttribute("genderList", genderList);
		model.addAttribute("themeList", themeList);
		model.addAttribute("pageBar",getPageBar(service.groupTotalData(), Integer.parseInt(cPage), numPerPage, "managerGroup"));
		
		return "components/admin/managegroup";
	}
	@RequestMapping("/admin/blindgroup")
	@ResponseBody
	public int blindGroup(String groupSeq) {
		return service.blindGroup(groupSeq);
	}
	@RequestMapping("/admin/unblindgroup")
	@ResponseBody
	public int unblindGroup(String groupSeq) {
		return service.unblindGroup(groupSeq);
	}
	
	@RequestMapping("/admin/managefood")
	public String manageFood(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage =10;
		List<Food> statistics=service.statisticsFood();
		
		List<double[]> like_star = new ArrayList();
		List<double[]> price_star = new ArrayList();
		
		for(Food f : statistics) {
			double[] temp = {f.getFoodPrice(), f.getFoodStar()};
			price_star.add(temp);
			
			double[] temp2 = {f.getFoodLikeCount(), f.getFoodStar()};
			like_star.add(temp2);
		}
		
		String parsed = "";
		String paresed2 = "";
		
		try {
			parsed = obj.writeValueAsString(price_star);
			paresed2 = obj.writeValueAsString(like_star);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("likeMaximum",service.likeMaxiumCount());
		model.addAttribute("like_star",paresed2);
		model.addAttribute("price_star",parsed);
		model.addAttribute("list",service.manageFood(Integer.parseInt(cPage), numPerPage));
		model.addAttribute("pageBar",getPageBar(service.foodTotalData(), Integer.parseInt(cPage), numPerPage, "manageFood"));
		return "components/admin/managefood";
	}
	@RequestMapping("/admin/blockfood")
	@ResponseBody
	public int blockFood(String foodSeq) {
		return service.blockFood(foodSeq);
	}
	@RequestMapping("/admin/unblockfood")
	@ResponseBody
	public int unblockFood(String foodSeq) {
		return service.unblockFood(foodSeq);
	}
	
	@RequestMapping("/admin/writefood")
	public String writeFood(Model model) {
		// 카테고리 대분류, 중분류 데이터 가져오기 
				List<String> CategoryMainList = fservice.selectFoodCategoryMain();
				List<String> CategorySubList = fservice.selectFoodCategorySub();
						
				model.addAttribute("CategoryMainList", CategoryMainList);
				model.addAttribute("CategorySubList", CategorySubList);
				
		return "components/admin/foodForm";
	}
	
	
	@RequestMapping("/admin/manageFAQ")
	public String manageFAQ(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage =10;
		model.addAttribute("list",service.selectFAQ(Integer.parseInt(cPage), numPerPage));
		//model.addAttribute("pageBar", getPageBar(service.faqTotalData(), Integer.parseInt(cPage) ,numPerPage ,"manageFAQ"));
		return "components/admin/manageFAQ";
	}
	

	@RequestMapping("/admin/managemovie")
	public String manageMovie(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
		model.addAttribute("pageBar",getPageBar(service.movieTotalData(), Integer.parseInt(cPage), numPerPage, "manageMovie"));
		List<Movie> list = service.movieList(Integer.parseInt(cPage), numPerPage);
		model.addAttribute("list",list);
		return "components/admin/manageMovie";
	}
	
	@RequestMapping("/admin/enrollMovie")
	public String enrollMovie(Model model) {
		return "components/admin/enrollMovie";
	}
	
	@RequestMapping("/admin/ShowTicketingList")
	public String showTicketingList(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
		model.addAttribute("pageBar",getPageBar(service.tickectTotal(), Integer.parseInt(cPage), numPerPage, "showTicketingList"));
		List<MovieTicketing> list = service.ticketingList(Integer.parseInt(cPage),numPerPage);
		model.addAttribute("list",list);
		System.out.println(list);
		return "components/admin/showTicketingList";
	}
	
	
	@RequestMapping("/admin/managefeed")
	public String manageFeed(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage =10;
		model.addAttribute("pageBar",getPageBar(service.feedTotalData(), Integer.parseInt(cPage), numPerPage, "manageReport"));
		List<ReportFeed> list = service.manageFeed(Integer.parseInt(cPage), numPerPage);
		log.error("listlsitlsitsltistslislit{}",list);
		model.addAttribute("list",list);
		return "components/admin/adminfeed";
	}
	
	@RequestMapping("/admin/feedblock")
	@ResponseBody
	public int feedBlock(String seq) {
		return service.feedBlock(seq);
	}
	@RequestMapping("/admin/feedunblock")
	@ResponseBody
	public int feedUnBlock(String seq) {
		return service.feedUnBlock(seq);
	}
	
	
	@RequestMapping("/admin/managefeedComment")
	public String manageFeedComment(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage =10;
		model.addAttribute("pageBar", getPageBar(service.feedCommentTotalData(), Integer.parseInt(cPage), numPerPage, "manageFeedComment"));
		model.addAttribute("list", service.manageFeedComment(Integer.parseInt(cPage), numPerPage));
		
		return "components/admin/adminfeedComment";
	}
	
	@RequestMapping("/admin/feedCommentblock")
	@ResponseBody
	public int feedCommentBlock(String seq) {
		
		return service.feedCommentBlock(seq);
	}
	@RequestMapping("/admin/feedCommentunblock")
	@ResponseBody
	public int feedCommentUnBlock(String seq) {
		return service.feedCommentUnBlock(seq);
	}
	
	
	@RequestMapping("/admin/managefoodreview")
	public String manageFoodReview(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
			model.addAttribute("list", service.manageFoodComment(Integer.parseInt(cPage), numPerPage));
			model.addAttribute("pageBar",getPageBar(service.foodCommentTotalData(), Integer.parseInt(cPage), numPerPage, "manageFoodReview"));
		return "components/admin/managefoodreview";
	}
	
	@RequestMapping("/admin/foodblock")
	@ResponseBody
	public int foodBlock(String seq) {
		return service.foodCommentBlock(seq);
	}
	@RequestMapping("/admin/foodunblock")
	@ResponseBody
	public int foodunBlock(String seq) {
		return service.foodCommentUnBlock(seq);
	}
	
	@RequestMapping("/admin/managegroupboard")
	public String manageGroupBoard(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
			model.addAttribute("list", service.manageGroupBoard(Integer.parseInt(cPage), numPerPage));
			model.addAttribute("pageBar",getPageBar(service.groupBoardTotalData(), Integer.parseInt(cPage), numPerPage, "manageGroupBoard"));
		return "components/admin/admingroupboard";
	}
	
	@RequestMapping("/admin/groupboardblock")
	@ResponseBody
	public int groupBoardBlock(String seq) {
		return service.groupBoardBlock(seq);
	}
	@RequestMapping("/admin/groupboardunblock")
	@ResponseBody
	public int groupBoardunBlock(String seq) {
		return service.groupBoardUnBlock(seq);
	}
	@RequestMapping("/admin/managegroupboardcomment")
	public String manageGroupBoardComment(@RequestParam(defaultValue = "1", value = "cPage")String cPage, Model model) {
		int numPerPage = 10;
		model.addAttribute("list", service.manageGroupBoard(Integer.parseInt(cPage), numPerPage));
		model.addAttribute("pageBar",getPageBar(service.groupBoardTotalData(), Integer.parseInt(cPage), numPerPage, "manageGroupBoard"));
		return "components/admin/admingroupboardComment";
	}
	
	@RequestMapping("/admin/groupboardcommentblock")
	@ResponseBody
	public int groupBoardCommentBlock(String seq) {
		return service.groupBoardBlock(seq);
	}
	@RequestMapping("/admin/groupboardcommentunblock")
	@ResponseBody
	public int groupBoardCommentunBlock(String seq) {
		return service.groupBoardUnBlock(seq);
	}
	
	// 맛집 정보 수정 
	@RequestMapping("/admin/updatefood/start")
	public String updatefoodpage(String foodSeq, Model model) {
		
		List<String> CategoryMainList = fservice.selectFoodCategoryMain();
		List<String> CategorySubList = fservice.selectFoodCategorySub();
		Food f = fservice.selectFood(foodSeq);
		
		model.addAttribute("CategoryMainList", CategoryMainList);
		model.addAttribute("CategorySubList", CategorySubList);
		model.addAttribute("f", f);
		
		return "components/admin/foodUpdate";
	}
	
	@RequestMapping("/admin/updatefood/end")
	@ResponseBody
	public int updatefood(Food food, Model model) {
		
		return  service.updatefood(food);
	}
	
	
	
}

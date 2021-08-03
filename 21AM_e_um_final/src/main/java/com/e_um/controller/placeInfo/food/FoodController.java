package com.e_um.controller.placeInfo.food;

import static com.e_um.common.renamePolicy.RenamePolicy.renamepolicy;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.e_um.model.sevice.placeInfo.food.FoodServiceInterface;
import com.e_um.model.vo.placeinfo.food.LikeFood;
import com.e_um.model.vo.placeinfo.food.booking.FoodBooking;
import com.e_um.model.vo.placeinfo.food.comment.FoodComment;
import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.placeinfo.food.menu.FoodMenu;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FoodController {

	
	
	
	@Autowired
	FoodServiceInterface service;
	
	
	
	// 맛집 메인페이지로 이동
	@RequestMapping("/food/foodMain")
	public String food(Model m) {
		
		List<Food> list = service.selectAllFood();
		
		m.addAttribute("list", list);
		
		return "food";
	}
	
	
	
	
	// 맛집 등록 시작 
	@RequestMapping("/food/foodForm/start")
	public String foodFormStart(Model model) {
		
		// 카테고리 대분류, 중분류 데이터 가져오기 
		List<String> CategoryMainList = service.selectFoodCategoryMain();
		List<String> CategorySubList = service.selectFoodCategorySub();
				
		model.addAttribute("CategoryMainList", CategoryMainList);
		model.addAttribute("CategorySubList", CategorySubList);
		
		return "food/foodForm";
	}
	
	
	
	// 맛집 등록 끝 
	@RequestMapping("/food/foodForm/end")
	public String foodInsert(HttpServletRequest rq, Food food, String[] menuName, 
								String[] menuPrice, MultipartFile[] menuPhoto, Model model) {
				 
		FoodMenu foodMenu;
		List<FoodMenu> menuList = new ArrayList<>();
		
		for(int i=0; i<menuName.length; i++) {
		
//			log.warn("{}",menuName[i]);
//			log.warn("{}",menuPrice[i]);
//			log.warn("{}",menuPhoto[i].getOriginalFilename());
			
			foodMenu = new FoodMenu();
					 
			if(!menuName[i].equals("")) {
				foodMenu.setMenuName(menuName[i]);
			}
			if(!menuPrice[i].equals("")) {
				foodMenu.setMenuPrice(Integer.parseInt(menuPrice[i]));
			}
			if(!menuPhoto[i].getOriginalFilename().equals("")) {
				foodMenu.setMenuPhoto(renamepolicy(rq, menuPhoto[i], "food"));
			}
					 
			food.getMenus().add(foodMenu);
			menuList.add(foodMenu);
		}
				 
				 // System.out.println("test, food : " + food);
		
		int result = service.foodInsert(food);
		
		model.addAttribute("msg", result > 0 ? "맛집이 등록되었습니다" : "맛집이 등록되지않았습니다. 다시 시도해주세요.");
		model.addAttribute("loc", "/food/foodMain");
		
		return "/common/msg";
	}
	
	
	
	
	// 맛집 모달 보기 
	@RequestMapping("/food/foodModal")
	@ResponseBody
	public Food openFoodModal(String foodSeq) throws Exception {
		
		// log.warn("{}", req.getParameter("foodSeq"));
				// log.warn("{}", foodSeq);
		
		Food food = service.selectFood(foodSeq);
		
				// log.warn("{}", food);
		
		return food;
		
	}
	
	
	
	
	// 맛집 상세보기 
	@RequestMapping("/food/foodView")
	public String foodView(String foodSeq, Model model, HttpServletRequest req) throws Exception {
		
		// foodSeq에 해당하는 맛집 추출 
		Food food = service.selectFood(foodSeq);
		
		// foodSeq에 해당하는 맛집 리뷰 추출
		int foodCommentCount = service.countFoodComment(foodSeq);
		
		User loginUser = (User) req.getSession().getAttribute("userSession");
		String userId = loginUser.getUserId();
		
		Map<String, String> param = new HashMap<>();
		param.put("foodSeq", foodSeq);
		param.put("userId", userId);
		
		// foodSeq와 user에 해당하는 좋아요 추출 
		LikeFood like = service.checkFoodLike(param);
		
		model.addAttribute("food", food);
		model.addAttribute("foodCommentCount", foodCommentCount);
		model.addAttribute("likecheck", like);
		
		return "/food/foodView";
		
	}
	
	
	
	// 맛집 리뷰 작성 시작 
	@RequestMapping("/food/foodReview/start")
	public String foodReview(String foodSeq, Model model) {
		
		Food food = service.selectFood(foodSeq);
		
		model.addAttribute("food", food);
		
		return "/food/foodReview";
	}
	
	
	
	// 맛집 리뷰작성 끝 
	@RequestMapping("/food/foodReview/end")
	public String insertFoodComment(String foodSeq, String foodCommentContents, String rating, 
									@RequestParam("file") MultipartFile[] files, 
									HttpServletRequest req, 
									Model model) {
		
		User loginUser = (User) req.getSession().getAttribute("userSession");
		String userId = loginUser.getUserId();
		
		
//		if(files != null) {
//			for(MultipartFile f : files) {
//				System.out.println("파일이름 : " + f.getOriginalFilename()); // 정상적으로 출력된다
//				
//			}
//		}
		
		FoodComment comment = new FoodComment();
		User user = User.builder().userId(userId).build();
		Food food = Food.builder().foodSeq(foodSeq).build();
		
		
		comment.setUser(user);
		comment.setFood(food);
		comment.setFoodCommentContents(foodCommentContents);
		comment.setFoodCommentStar(Double.parseDouble(rating));
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("comment", comment);
		map.put("foodPhoto1", null);
		map.put("foodPhoto2", null);
		map.put("foodPhoto3", null);
		map.put("foodPhoto4", null);
		map.put("foodPhoto5", null);
		
		
		int i =1;
		
			// System.out.println("테스트 : " + files.length + " " + files[0]);
			
		for(MultipartFile f : files) {
			
			if(f.getSize()==0) break;
			
			map.put("foodPhoto"+i, renamepolicy(req, f, "foodComment"));
			
			i+=1;
			
		}
			
		int result = service.insertFoodComment(map);
		
		System.out.println(result > 0 ? "성공" : "실패");
		
		model.addAttribute("msg", result > 0 ? "리뷰가 등록되었습니다" : "리뷰를 등록하지 못했습니다. 다시 시도해주세요");
		model.addAttribute("loc", "/food/foodView?foodSeq="+foodSeq);
		
		return "/common/msg";
	}
	
	
	
	// 맛집 예약 시작 
	@RequestMapping("/food/foodBooking/start")
	public String foodBookingStart(String foodSeq, Model model) throws ParseException {
		
		Food food = service.selectFood(foodSeq);
		
		// 문자열
		String timeStr1 = food.getFoodTimeFirst();
		String timeStr2 = food.getFoodTimeLast();
		
		Date date1 = new SimpleDateFormat("HH:mm").parse(timeStr1);
		Date date2 = new SimpleDateFormat("HH:mm").parse(timeStr2);
	
		long diff = date2.getTime() - date1.getTime();
		
		long result = diff / 60000;
		
			System.out.println("영업시간(분) : " + result);
			System.out.println("영업시간(시간) : " + result/60);
			
		List<String> timeList  = new ArrayList();
		
		long lData = 0;
		
		lData = date1.getTime();
		
			
		for(int i=0; i < result/30; i++) {
			
			
			Date dData = new Date(lData);
			
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		
			String sData = sdf.format(dData);
			
				System.out.println("30분 후 시간 : " + sData);
				
			timeList.add(sData);
		
			lData += 1800000;
		}
	
		model.addAttribute("realTimeList", timeList);
		
		model.addAttribute("food", food);
		
		return "/food/foodBooking";
	}
	
	
	
	// 맛집 예약 끝 
	@RequestMapping("/food/foodBooking/end")
	public String foodBookingEnd(Date bookingDateDay, Date bookingDateTime, 
									@RequestParam(value = "userId") String userId, 
									String foodSeq, String bookingHead, String bookingContents, Model model) {

		FoodBooking booking = new FoodBooking();
		booking.setFood(Food.builder().foodSeq(foodSeq).build());
		booking.setUser(User.builder().userId(userId).build());
		booking.setBookingContents(bookingContents);
		booking.setBookingDateDay(bookingDateDay);
		booking.setBookingDateTime(bookingDateTime);
		booking.setBookingHead(Integer.parseInt(bookingHead));
		
				System.out.println("예약정보 확인 : " + booking);
		
		int result = service.foodBooking(booking);
		
		model.addAttribute("msg", result > 0 ? "예약이 완료되었습니다." : "예약에 실패했습니다. 다시 시도해주세요.");
		model.addAttribute("loc", "/food/foodBooking/start?foodSeq=" + foodSeq);
		
		return "/common/msg";
	}

	
	
	// 맛집 예약 조회 
	@RequestMapping("/food/foodBookingView")
	public String foodBookingView(String userId, Model model) {
		
		List<FoodBooking> bookingList = service.selectMyBookingList(userId);
		
		model.addAttribute("bookingList", bookingList);
		
		return "/food/bookingList";
	}
	
	
	
	// 맛집 카테고리 조회
	@RequestMapping("/food/selectFoodCategoryList")
	@ResponseBody
	public Map selectFoodSearchCategory(Model model) {
		
		Map<String, List> foodCategoryMap = new HashMap<>();
		
		List<String> CategoryMainList = service.selectFoodCategoryMain();
		List<String> CategorySubList = service.selectFoodCategorySub();
		
		foodCategoryMap.put("CategoryMainList", CategoryMainList);
		foodCategoryMap.put("CategorySubList", CategorySubList);

		return foodCategoryMap;
		
	}
	
	
	
	// 맛집 검색 
	@RequestMapping("/food/foodSearch")
	@ResponseBody
	public List<Food> foodSearch(@RequestParam Map<String, Object> param) {	
		
		// log.error("{}", param); // {keyword=파스타, priceCon=1만원대, cateMainCon=이탈리아, addrCon=연남, starCon=3점이상}
		
		if(param.get("priceCon") != null) {
			String price = (String) param.get("priceCon");
			
			List priceRange = new ArrayList();
			
			switch (price) {
				case "1만원미만":
					priceRange.add(0);
					priceRange.add(9999);
					param.put("priceCon", priceRange);
					break;
				case "1만원대":
					priceRange.add(10000);
					priceRange.add(19999);
					param.put("priceCon", priceRange);
					break;
				case "2만원대":
					priceRange.add(20000);
					priceRange.add(29999);
					param.put("priceCon", priceRange);
					break;
				case "3만원이상":
					priceRange.add(30000);
					priceRange.add(1000000);
					param.put("priceCon", priceRange);
					break;
			}
		}
		
		if(param.get("starCon") != null) {
			String star = (String) param.get("starCon");

			switch (star) {
				case "1점이상":
					param.put("starCon", 1);
					break;
				case "2점이상":
					param.put("starCon", 2);
					break;
				case "3점이상":
					param.put("starCon", 3);
					break;
				case "4점이상":
					param.put("starCon", 4);
					break;
			}
		}
		
		List<Food> foodSearchList = service.searchFood(param);
		
		// log.error("{}", foodSearchList);
		
		return foodSearchList;
		
	}
	
	
	
	
	// 리뷰 목록 출력 
	@RequestMapping("/food/selectFoodCommentList")
	public String selectFoodCommentList(@RequestParam(value="foodSeq") String foodSeq, 
										@RequestParam(value="cPage", defaultValue = "1") String cPage,
										Model model) {
		
		log.error("{}", cPage);
		
		List<FoodComment> foodCommentList = service.selectFoodCommentList(foodSeq, Integer.parseInt(cPage));
		
		// 리뷰 총 개수 
		int totalFoodComment = service.countFoodComment(foodSeq);
		
		// log.error("리뷰목록{}", foodCommentList);
		// log.error("리뷰총개수{}", totalFoodComment);
		
		// 페이징처리된 범위중에서 리뷰 개수
		log.error("리뷰개수{}", foodCommentList.size());
		
		model.addAttribute("foodCommentList", foodCommentList);
		model.addAttribute("totalFoodComment", totalFoodComment);
		model.addAttribute("cPage", cPage);
		
		return "components/food/foodCommentList";
		
	}
	
	
	
	// 좋아요 추가 
	@RequestMapping("/food/addFoodLike")
	@ResponseBody
	public String addFoodLike(String foodSeq, String userId) {
		
			log.warn("좋아요{}", foodSeq);
			log.warn("좋아요{}", userId);
		
		Map<String, String> param = new HashMap<>();
		param.put("foodSeq", foodSeq);
		param.put("userId", userId);
		
		int result = service.addFoodLike(param);
		
			log.warn("좋아요 insert결과 {}", result);		
		
		return "success";
		
	}
	
	
	// 좋아요 삭제 
	@RequestMapping("/food/delFoodLike")
	@ResponseBody
	public String delFoodLike(String foodSeq, String userId) {
		
			log.warn("좋아요{}", foodSeq);
			log.warn("좋아요{}", userId);
		
		Map<String, String> param = new HashMap<>();
		param.put("foodSeq", foodSeq);
		param.put("userId", userId);
		
		int result = service.delFoodLike(param);
		
			log.warn("좋아요 delete결과 {}", result);		
		
		return "success";
		
	}
	
	
	
	// 좋아요 되어있는지 확인 
	@RequestMapping("/food/checkFoodLike")
	public String checkFoodLike(String foodSeq, String userId, Model model) {
		
		Map<String, String> param = new HashMap<>();
		param.put("foodSeq", foodSeq);
		param.put("userId", userId);
		
		LikeFood like = service.checkFoodLike(param);
		
		model.addAttribute("likecheck", like);
		
		return "/food/foodView";
		
	}
	
	
	
	// 리뷰 삭제 
	@RequestMapping("/food/deleteFoodComment")
	@ResponseBody
	public int deleteFoodComment(String foodCommentSeq) {
		
		int result = service.deleteFoodComment(foodCommentSeq);
		
		return result;
		
	}
	
	
	
	// 리뷰 신고 
	@RequestMapping("/food/FCReport")
	@ResponseBody
	public int openFCReportModal(String foodSeq, String foodCommentSeq, String userId, String targetId, String reportContent, Model model) {
		
		Map<String, String> param = new HashMap<>();
		param.put("foodSeq", foodSeq);
		param.put("userId", userId);
		param.put("foodCommentSeq", foodCommentSeq);
		param.put("targetId", targetId);
		param.put("reportContent", reportContent);
		
		log.error("{}", param); 
		 
		int result = service.insertReportFoodComment(param);
		
		return result;
	}
	
	
	// 리뷰 수정 시작 
	@RequestMapping("/food/updateFoodComment/start")
	public String updateFoodCommentStart(String foodCommentSeq, Model model) {
		
		FoodComment fc = service.selectFoodComment(foodCommentSeq);
		
		log.error("리뷰업데이트{}", fc);
		
		model.addAttribute("fc", fc);
		
		return "/food/foodReviewUpdate";
		
	}
	
	// 리뷰 수정 끝 
	@RequestMapping("/food/updateFoodComment/end")
	public String updateFoodCommentEnd(String foodCommentSeq, String foodSeq, String foodCommentContents, String rating, 
										@RequestParam("file") MultipartFile[] files, HttpServletRequest req, Model model) {
		
		// 이전의 파일 삭제 
		FoodComment fc = service.selectFoodComment(foodCommentSeq);
		
		if(fc.getFoodPhoto1() != null) {
			File deleteFile = new File(req.getServletContext().getRealPath("/resources/upload/foodComment/" + fc.getFoodPhoto1()));
	        if(deleteFile.exists()) {
	        	deleteFile.delete();
	        	log.error("삭제완료");
	        }
		}
		if(fc.getFoodPhoto2() != null) {
			File deleteFile = new File(req.getServletContext().getRealPath("/resources/upload/foodComment/" + fc.getFoodPhoto2()));
			if(deleteFile.exists()) {
				deleteFile.delete();
				log.error("삭제완료");
			}
		}
		if(fc.getFoodPhoto3() != null) {
			File deleteFile = new File(req.getServletContext().getRealPath("/resources/upload/foodComment/" + fc.getFoodPhoto3()));
			if(deleteFile.exists()) {
				deleteFile.delete();
				log.error("삭제완료");
			}
		}
		if(fc.getFoodPhoto4() != null) {
			File deleteFile = new File(req.getServletContext().getRealPath("/resources/upload/foodComment/" + fc.getFoodPhoto4()));
			if(deleteFile.exists()) {
				deleteFile.delete();
				log.error("삭제완료");
			}	
		}
		if(fc.getFoodPhoto5() != null) {
			File deleteFile = new File(req.getServletContext().getRealPath("/resources/upload/foodComment/" + fc.getFoodPhoto5()));
			if(deleteFile.exists()) { 
				deleteFile.delete();
				log.error("삭제완료");
			}
		}

		
		// 리뷰 수정
		User loginUser = (User) req.getSession().getAttribute("userSession");
		String userId = loginUser.getUserId();
		
		User user = User.builder().userId(userId).build();
		Food food = Food.builder().foodSeq(foodSeq).build();
		
		FoodComment comment = new FoodComment();
		
		comment.setUser(user);
		comment.setFood(food);
		comment.setFoodCommentSeq(foodCommentSeq);
		comment.setFoodCommentContents(foodCommentContents);
		comment.setFoodCommentStar(Double.parseDouble(rating));
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("comment", comment);
		map.put("foodPhoto1", null);
		map.put("foodPhoto2", null);
		map.put("foodPhoto3", null);
		map.put("foodPhoto4", null);
		map.put("foodPhoto5", null);
		
		
		int i =1;
		
			// System.out.println("테스트 : " + files.length + " " + files[0]);
			
		for(MultipartFile f : files) {
			
			if(f.getSize()==0) break;
			
			map.put("foodPhoto"+i, renamepolicy(req, f, "foodComment"));
			
			i+=1;
			
		}
			
		int result = service.updateFoodComment(map);
		
		System.out.println(result > 0 ? "성공" : "실패");
		
		model.addAttribute("msg", result > 0 ? "리뷰가 수정되었습니다" : "리뷰를 수정하지 못했습니다. 다시 시도해주세요");
		model.addAttribute("loc", result > 0 ? "/food/foodView?foodSeq="+foodSeq : "/food/updateFoodComment/start?foodCommentSeq=" + foodCommentSeq);
		
		return "/common/msg";
		
	}
	
	// 조회수 증가
	@RequestMapping("/food/foodViewCountUp")
	@ResponseBody
	public int foodViewCountUp(String foodSeq) {
		
		return service.foodViewCountUp(foodSeq);
	}
	
	
	
	
	
	
	
	
	
	
}

package com.e_um.controller.placeInfo.movie;

import java.text.DecimalFormat;
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

import com.e_um.model.sevice.placeInfo.movie.MovieServiceInterface;
import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;
import com.e_um.model.vo.placeinfo.movie.screen.MovieBox;
import com.e_um.model.vo.placeinfo.movie.screen.MovieSeatStatus;
import com.e_um.model.vo.placeinfo.movie.screen.MovieTime;
import com.e_um.model.vo.placeinfo.movie.seat.Seat;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class MovieController {
	@Autowired
	MovieServiceInterface service;
	
   //영화 메인페이지	
	@RequestMapping("/movie/movieInfo")
	public String movieInfo(Model m) {
		List<Movie> list = service.movieList();
		m.addAttribute("list",list);
		return "movie";
	}
	
	//modal화면에 띄울 정보
	@RequestMapping("/movie/moviePoster")
	@ResponseBody
	public Movie moviePoster(@RequestParam(value="movieSeq")String movieSeq){
		
		Movie m = service.moviePoster(movieSeq);
		return  m;
	}
	
	//예매율 1등 영화 정보
	@RequestMapping("/movie/movieVideo")
	@ResponseBody
	public Movie movieVideo() {
		return service.movieVideo();
	}
	
	//영화 상세화면 정보
	@RequestMapping("/movie/movieDetail")
	public String movieDetail(@RequestParam(value="movieSeq")String movieSeq, Model model) {
		Movie movie = service.movieDetail(movieSeq);
		model.addAttribute(movie);
		return "movie/movieDetail";
	}
	
	//검색 영화 정보
	@RequestMapping("/movie/searchMovie")
	public String movieSearch(@RequestParam(value="search")String search,Model model) {
		List<Movie> list = service.movieSearch(search);	
		model.addAttribute("list",list);
		return "movie/movieSearch";
	}
	
	//영화속 인물에 대한 정보 가져오기
	@RequestMapping("/movie/moviePerson")
	@ResponseBody
	public MoviePersonInfo moviePerson(@RequestParam(value="moviePersonName")String person) {			
		return service.moviePerson(person);
	}
	
	//영화상세페이지 예고편
	@RequestMapping("/movie/selectMovieVideo")
	@ResponseBody
	public Movie selectMovieVideo(@RequestParam(value="movieSeq")String movieSeq) {
		Movie m = service.moviePoster(movieSeq);
		return m;
	}
	
	
	//영화상세페이지 리뷰 가져오기
	@RequestMapping("/movie/movieReview")
	@ResponseBody
	public List<MovieReview> movieReview(@RequestParam(value="movieSeq")String movieSeq) {
		List<MovieReview> list = service.movieReview(movieSeq);
		
		return list;
	}
	
	//영화상세페이지 리뷰작성페이지 전환
	@RequestMapping("/movie/movieWriteStart")
	public String movieWritePage(@RequestParam(value="movieSeq")String movieSeq, Model m) {
		m.addAttribute("movieSeq",movieSeq);
		return "movie/reviewWrite";
	}
	
	//영화상세페이지 리뷰작성 저장
	@RequestMapping("/movie/movieWriteEnd")
	public String movieWriteEnd(@RequestParam Map param, HttpServletRequest hsr, Model m) {
		
		User user = (User)hsr.getSession().getAttribute("userSession");
		String userId=user.getUserId();
		 
		int direct = Integer.parseInt((String)param.get("direct"));
		int visual = Integer.parseInt((String)param.get("visual"));
		int story = Integer.parseInt((String)param.get("story"));
		int acting = Integer.parseInt((String)param.get("acting"));
		int ost = Integer.parseInt((String)param.get("ost"));
		double total = (direct+visual+story+acting+ost)/5.0;
		String movieSeq = (String)param.get("movieSeq");
		String content = (String)param.get("content");
		//System.out.println(userId);
		param.clear();
		param.put("movieSeq",movieSeq);
		param.put("userId", userId);
		param.put("content", content);
		param.put("direct", direct);
		param.put("visual", visual);
		param.put("story", story);
		param.put("acting", acting);
		param.put("ost", ost);
		param.put("total", total);
		int movieReview = service.movieWrite(param);
		
		List<MovieReview> list = service.movieReviewList(param);
		int count = service.movieReviewCount2(param);
		double evgtotal = 0;
		for(MovieReview mr : list) {
			evgtotal += mr.getMovieEvaluationAvg();
		}
		DecimalFormat dc = new DecimalFormat("##.#");
		double totalEvg = Double.parseDouble(dc.format(evgtotal/count));
		Map map = new HashMap();
		map.put("movieSeq", movieSeq);
		map.put("totalEvg", totalEvg);
		int update = service.updateTotal(map);
		
		String msg = "";
		String loc = "";
		if(movieReview>0) {
			msg = "입력이 완료되었습니다.";
			loc="/movie/movieDetail?movieSeq="+movieSeq;
		}else {
			msg = "입력이 실패했습니다.";
			loc="/movie/movieWriteStart?movieSeq"+movieSeq;
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "/common/msg";
	}
	
	//리뷰에 대한 정보(평균평점,오각형그래프)
	@RequestMapping("/movie/movieReviewData")
	@ResponseBody
	public Map movieReviewData(@RequestParam(value="movieSeq")String movieSeq) {
		
		List<MovieReview> list = service.movieReview(movieSeq);
		int count = service.movieReviewCount(movieSeq);
		Map<String, Double> param = new HashMap();
		double evg = 0;
		double ost = 0;
		double story = 0;
		double visual = 0;
		double direct = 0;
		double acting = 0;
		for(MovieReview mr : list) {
			evg += mr.getMovieEvaluationAvg();
			story += mr.getMovieStroy();
			visual += mr.getMovieVisualQuality();
			ost += mr.getMovieOst();
			direct += mr.getMovieDirect();
			acting += mr.getMovieActingPerformance();
		}
		
		DecimalFormat dc = new DecimalFormat("##.#");
		
		double total=Double.parseDouble(dc.format(evg/count));
		double ostEvg = Double.parseDouble(dc.format(ost/count));
		double storyEvg = Double.parseDouble(dc.format(story/count));
		double visualEvg = Double.parseDouble(dc.format(visual/count));
		double directEvg = Double.parseDouble(dc.format(direct/count));
		double actingEvg = Double.parseDouble(dc.format(acting/count));
		
		param.put("total", total);
		param.put("ostEvg", ostEvg);
		param.put("storyEvg", storyEvg);
		param.put("visualEvg", visualEvg);
		param.put("directEvg", directEvg);
		param.put("actingEvg", actingEvg);
		
		return param;
	}
	
	//영화 예약페이지 이동
	@RequestMapping("/movie/movieReserve")
	public String movieReserve() {
		
		return "movie/movieReserve";
	}
	
	//영화 예약페이지 영화정보
	@RequestMapping("/movie/movieList")
	@ResponseBody
	public List<Movie> movieList(){
		return service.movieList();
	}
	
	
	@RequestMapping("/movie/movieBox")
	@ResponseBody public List<MovieSeatStatus>movieBox(@RequestParam(value="movieSeq")String movieSeq){
	 List<MovieSeatStatus> list = service.movieBox(movieSeq);
	 	
	 return list;
	}
	 
	@RequestMapping("/movie/movieTime")
	@ResponseBody
	public List<MovieTime> movieTime(){
		List<MovieTime> list = service.movieTime();
	 return list;
	}
	
	@RequestMapping("/movie/seatStart")
	public String seatStart(@RequestParam Map param,Model model) {
	  model.addAttribute("param",param);
	  return "movie/movieSeat";
	}
	  
	  @RequestMapping("/movie/movieReserveEnd")
	  public String movieReserveEnd(@RequestParam Map param,Model model) {
		  Movie movieName = service.movieName(param);
		  String movieTitle = movieName.getMovieTitleKr();
		  
		  Map newParam = param;
		  newParam.put("movieTitle", movieTitle);

		  model.addAttribute("newParam" , newParam);
		  
		  return "movie/moviePay";
	  }
	  
	  @RequestMapping("/movie/movieSeat")
	  @ResponseBody
	  public MovieBox getMovieSeat(String movieSeq, String movieLocation, String movieBox ) {
		  
		  Map param = new HashMap();
		  param.put("movieSeq", movieSeq);
		  param.put("movieBox", movieBox);
		  param.put("movieLocation", movieLocation);
		  MovieBox mb = service.getMovieSeat(param);
		  
		  return mb; 
	  }
	  
	  
	  @RequestMapping("/movie/payEnd")
	  @ResponseBody
	  public Map payEnd(@RequestParam Map param,HttpServletRequest hsr,Model model) {
		  
		  User user = (User)hsr.getSession().getAttribute("userSession");
		  String userId=user.getUserId();
		  String movieSeq = (String)param.get("movieSeq");
		  String movieLocation = (String)param.get("movieLocation");
		  String movieBox = (String)param.get("movieBox");
		  String movieDate = (String)param.get("movieDate");
		  String movieTime = (String)param.get("movieTime");
		  String moviePrice = (String)param.get("moviePrice");
		  String movieTitle = (String)param.get("movieTitle");
		  String movieSeats = (String)param.get("movieSeats");
		  System.out.println(param);
		  
		  param.clear();
		  param.put("userId", userId);
		  param.put("movieSeq", movieSeq);
		  param.put("movieLocation", movieLocation);
		  param.put("movieBox", movieBox);
		  param.put("movieDate", movieDate);
		  param.put("movieTime", movieTime);
		  param.put("moviePrice", moviePrice);
		  param.put("movieTitle", movieTitle);
		  param.put("movieSeat1", null);
		  param.put("movieSeat2", null);
		  param.put("movieSeat3", null);
		  param.put("movieSeat4", null);
		  
		  String[] seats = movieSeats.split(",");
		  int i=1;
		  for(String seat : seats) {
			  if(seats.length==0) break;
			  param.put("movieSeat"+i,seats[i-1]);
			  i+=1;
		  }
		  System.out.println(param);
		 int result = service.payEnd(param); 
		 
			/* param.put("movieReserveNum", MovieTicketing.); */
		 
		 model.addAttribute("param",param);
		  
		
		 return param;
	  }
	  
	  
	  
	  
	  
	  
	  
	  
		  
	  
}

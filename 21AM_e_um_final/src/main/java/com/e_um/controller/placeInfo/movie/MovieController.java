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
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;
import com.e_um.model.vo.placeinfo.movie.screen.MovieSeatStatus;
import com.e_um.model.vo.placeinfo.movie.screen.MovieTime;
import com.e_um.model.vo.userInfo.user.User;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class MovieController {
	@Autowired
	MovieServiceInterface service;
	
	
	@RequestMapping("/movie/movieInfo")
	public String movieInfo(Model m) {
		List<Movie> list = service.movieList();
		m.addAttribute("list",list);
		return "movie";
	}
	
	@RequestMapping("/movie/moviePoster")
	@ResponseBody
	public Movie moviePoster(@RequestParam(value="movieSeq")String movieSeq){
		
		Movie m = service.moviePoster(movieSeq);
		
		
		return  m;
		
	}
	
	@RequestMapping("/movie/movieVideo")
	@ResponseBody
	public Movie movieVideo() {
		return service.movieVideo();
	}
	
	@RequestMapping("/movie/movieDetail")
	public String movieDetail(@RequestParam(value="movieSeq")String movieSeq, Model model) {
		Movie movie = service.movieDetail(movieSeq);
		model.addAttribute(movie);
		return "movie/movieDetail";
	}
	
	@RequestMapping("/movie/searchMovie")
	public String movieSearch(@RequestParam(value="search")String search,Model model) {
		List<Movie> list = service.movieSearch(search);	
		model.addAttribute("list",list);
		return "movie/movieSearch";
	}
	
	@RequestMapping("/movie/moviePerson")
	@ResponseBody
	public MoviePersonInfo moviePerson(@RequestParam(value="moviePersonName")String person) {			
		return service.moviePerson(person);
	}
	
	@RequestMapping("/movie/selectMovieVideo")
	@ResponseBody
	public Movie selectMovieVideo(@RequestParam(value="movieSeq")String movieSeq) {
		Movie m = service.moviePoster(movieSeq);
		return m;
	}
	
	@RequestMapping("/movie/movieReview")
	@ResponseBody
	public List<MovieReview> movieReview(@RequestParam(value="movieSeq")String movieSeq) {
		System.out.println(movieSeq);
		List<MovieReview> list = service.movieReview(movieSeq);
		
		return list;
	}
	
	@RequestMapping("/movie/movieWriteStart")
	public String movieWritePage(@RequestParam(value="movieSeq")String movieSeq, Model m) {
		m.addAttribute("movieSeq",movieSeq);
		return "movie/reviewWrite";
	}
	
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
		System.out.println(total);
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
		System.out.println(param);
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
	
	
	@RequestMapping("/movie/movieReserve")
	public String movieReserve() {
		
		return "movie/movieReserve";
	}
	
	
	
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
		  System.out.println(list);
		  return list;
	  }
	  
	  
	  
	  
	  
}

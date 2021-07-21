package com.e_um.controller.placeInfo.movie;

import java.util.List;

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
		System.out.println(m);
		return m;
	}
	
	@RequestMapping("/movie/movieReview")
	@ResponseBody
	public List<MovieReview> movieReview(@RequestParam(value="movieSeq")String movieSeq) {
		List<MovieReview> list = service.movieReview(movieSeq);
		System.out.println(list);
		return list;
	}
	
}

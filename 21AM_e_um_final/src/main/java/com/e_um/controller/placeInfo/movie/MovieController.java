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
		
		log.warn("{}",m.getMovieOpenDate());
		return  m;
		
	}
	
}

package com.e_um.model.sevice.placeInfo.movie;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;

public interface MovieServiceInterface {
	List<Movie> movieList();

	Movie moviePoster(String movieSeq);

	Movie movieVideo();
	
	Movie movieDetail(String movieSeq);
	
	List<Movie> movieSearch(String search);
	
	MoviePersonInfo moviePerson(String person);
	
	List<MovieReview> movieReview(String movieSeq);
	
	int movieWrite(Map param); 
}

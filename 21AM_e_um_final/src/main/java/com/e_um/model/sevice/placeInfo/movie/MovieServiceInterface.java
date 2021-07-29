package com.e_um.model.sevice.placeInfo.movie;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;
import com.e_um.model.vo.placeinfo.movie.screen.MovieSeatStatus;
import com.e_um.model.vo.placeinfo.movie.screen.MovieTime;

public interface MovieServiceInterface {
	List<Movie> movieList();

	Movie moviePoster(String movieSeq);

	Movie movieVideo();
	
	Movie movieDetail(String movieSeq);
	
	List<Movie> movieSearch(String search);
	
	MoviePersonInfo moviePerson(String person);
	
	List<MovieReview> movieReview(String movieSeq);
	
	int movieWrite(Map param); 
	
	int movieReviewCount(String movieSeq);
	
	int updateTotal(Map map);
	
	List<MovieReview> movieReviewList(Map param);
	
	int movieReviewCount2(Map param);
	
	List<MovieSeatStatus> movieBox();
	
	List<MovieTime> movieTime();
	
	
	
	
}

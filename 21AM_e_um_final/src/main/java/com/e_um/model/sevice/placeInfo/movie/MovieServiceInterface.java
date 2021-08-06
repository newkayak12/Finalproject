package com.e_um.model.sevice.placeInfo.movie;

import java.util.List;
import java.util.Map;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;
import com.e_um.model.vo.placeinfo.movie.screen.MovieBox;
import com.e_um.model.vo.placeinfo.movie.screen.MovieSeatStatus;
import com.e_um.model.vo.placeinfo.movie.screen.MovieTime;
import com.e_um.model.vo.placeinfo.movie.seat.Seat;
import com.e_um.model.vo.userInfo.report.Report;

public interface MovieServiceInterface {
	List<Movie> movieList();
	
	List<Movie> movieList2();
	
	Movie moviePoster(String movieSeq);

	Movie movieVideo();
	
	Movie movieDetail(String movieSeq);
	
	List<Movie> movieSearch(String search);
	
	MoviePersonInfo moviePerson(String person);
	
	List<MovieReview> movieReview(String movieSeq);
	
	int maleCount(String movieSeq);
	
	int femaleCount(String movieSeq);
	
	int movieWrite(Map param); 
	
	int movieReviewCount(String movieSeq);
	
	int updateTotal(Map map);
	
	List<MovieReview> movieReviewList(Map param);
	
	int movieReviewCount2(Map param);
	
	List<MovieSeatStatus> movieBox(String movieSeq);
	
	List<MovieTime> movieTime();
	
	List<Seat> movieSeatList();
	
	Movie movieName(Map param);
	
	MovieBox getMovieSeat(Map param);
	
	int payEnd(Map param);
	
	MovieTicketing movieTicket(Map param);
	
	MovieReview movieReviewOne(String movieReviewSeq);
	
	int insertReport(Report report);
	
	int totalCount();
	int movieCount(Map param);
	
	int updateRate(Map map);
	
	int enrollMovie(Map param);
	
	
}

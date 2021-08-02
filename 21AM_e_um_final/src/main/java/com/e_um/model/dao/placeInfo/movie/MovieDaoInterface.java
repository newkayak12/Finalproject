package com.e_um.model.dao.placeInfo.movie;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;
import com.e_um.model.vo.placeinfo.movie.screen.MovieBox;
import com.e_um.model.vo.placeinfo.movie.screen.MovieSeatStatus;
import com.e_um.model.vo.placeinfo.movie.screen.MovieTime;
import com.e_um.model.vo.placeinfo.movie.seat.Seat;

public interface MovieDaoInterface {
	List<Movie> movieList(SqlSessionTemplate session);
	
	Movie moviePoster(String movieSeq, SqlSessionTemplate session);
	
	Movie movieVideo(SqlSessionTemplate session);
	
	Movie movieDetail(String movieSeq,SqlSessionTemplate session);
	
	List<Movie> movieSearch(String search,SqlSessionTemplate session);
	
	MoviePersonInfo moviePerson(String person, SqlSessionTemplate session);
	
	List<MovieReview> movieReview(String movieSeq,SqlSessionTemplate session);

	int movieWrite(Map param, SqlSessionTemplate session);
	
	int movieReviewCount(SqlSessionTemplate session,String movieSeq);

	int updateTotal(SqlSessionTemplate session, Map map);

	List<MovieReview> movieReviewList(SqlSessionTemplate session, Map param);
	
	int movieReviewCount2(SqlSessionTemplate session, Map param);

	List<MovieSeatStatus> movieBox(SqlSessionTemplate session, String movieSeq);

	List<MovieTime> movieTime(SqlSessionTemplate session);
	
	List<Seat> movieSeatList(SqlSessionTemplate session);
	
	Movie movieName(SqlSessionTemplate session, Map param);
	
	MovieBox getMovieSeat(SqlSessionTemplate session, Map param);
	
	int payEnd(SqlSessionTemplate session, Map param);
	
	
	
	
	
	
	
}

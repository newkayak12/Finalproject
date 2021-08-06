package com.e_um.model.dao.placeInfo.movie;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;
import com.e_um.model.vo.placeinfo.movie.screen.MovieBox;
import com.e_um.model.vo.placeinfo.movie.screen.MovieSeatStatus;
import com.e_um.model.vo.placeinfo.movie.screen.MovieTime;
import com.e_um.model.vo.placeinfo.movie.seat.Seat;
import com.e_um.model.vo.userInfo.report.Report;

public interface MovieDaoInterface {
	List<Movie> movieList(SqlSessionTemplate session);
	
	List<Movie> movieList2(SqlSessionTemplate session);
	
	Movie moviePoster(String movieSeq, SqlSessionTemplate session);
	
	Movie movieVideo(SqlSessionTemplate session);
	
	Movie movieDetail(String movieSeq,SqlSessionTemplate session);
	
	List<Movie> movieSearch(String search,SqlSessionTemplate session);
	
	MoviePersonInfo moviePerson(String person, SqlSessionTemplate session);
	
	List<MovieReview> movieReview(String movieSeq,SqlSessionTemplate session);

	int maleCount(SqlSessionTemplate session, String movieSeq);
	
	int femaleCount(SqlSessionTemplate session, String movieSeq);
	
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
	
	MovieTicketing movieTicket(SqlSessionTemplate session, Map param);
	
	MovieReview movieReviewOne(SqlSessionTemplate session, String movieReviewSeq);
	
	int insertReport(SqlSessionTemplate session, Report report);
	
	int reportCountUpdate(SqlSessionTemplate session, Report report);

	int totalCount(SqlSessionTemplate session);
	int movieCount(SqlSessionTemplate session, Map param);

	int updateRate(SqlSessionTemplate session, Map map);
	
	int enrollMovie(SqlSessionTemplate session, Map param);
	
	
	
	
}

package com.e_um.model.dao.placeInfo.movie;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;

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








}

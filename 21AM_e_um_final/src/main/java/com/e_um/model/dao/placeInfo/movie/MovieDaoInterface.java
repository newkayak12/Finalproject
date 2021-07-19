package com.e_um.model.dao.placeInfo.movie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;

public interface MovieDaoInterface {
	public List<Movie> movieList(SqlSessionTemplate session);
	
	public Movie moviePoster(String movieSeq, SqlSessionTemplate session);
	
	public Movie movieVideo(SqlSessionTemplate session);
	
	public Movie movieDetail(String movieSeq,SqlSessionTemplate session);
	
	public List<Movie> movieSearch(String search,SqlSessionTemplate session);
	
}

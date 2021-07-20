package com.e_um.model.dao.placeInfo.movie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MovieDao implements MovieDaoInterface {
	@Override
	public List<Movie> movieList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieList");
	}

	@Override
	public Movie moviePoster(String movieSeq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.moviePoster",movieSeq);
	}

	@Override
	public Movie movieVideo(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieVideo");
	}

	@Override
	public Movie movieDetail(String movieSeq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieDetail",movieSeq);
	}

	@Override
	public List<Movie> movieSearch(String search, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieSearch",search);
	}

	@Override
	public MoviePersonInfo moviePerson(String person, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.moviePerson",person);
	}
	
	
	
	
	
	
	
}

package com.e_um.model.sevice.placeInfo.movie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.placeInfo.movie.MovieDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.placeinfo.movie.movie.Movie;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MovieService implements MovieServiceInterface {
	@Autowired
	MovieDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	@Override
	public List<Movie> movieList() {
		// TODO Auto-generated method stub
		return dao.movieList(session);
	}
	@Override
	public Movie moviePoster(String movieSeq) {
		// TODO Auto-generated method stub
		return dao.moviePoster(movieSeq, session);
	}
	
	
	
}

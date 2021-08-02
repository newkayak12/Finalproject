package com.e_um.model.sevice.placeInfo.movie;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.placeInfo.movie.MovieDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;
import com.e_um.model.vo.placeinfo.movie.reserv.MovieTicketing;
import com.e_um.model.vo.placeinfo.movie.review.MovieReview;
import com.e_um.model.vo.placeinfo.movie.screen.MovieBox;
import com.e_um.model.vo.placeinfo.movie.screen.MovieSeatStatus;
import com.e_um.model.vo.placeinfo.movie.screen.MovieTime;
import com.e_um.model.vo.placeinfo.movie.seat.Seat;

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
	@Override
	public Movie movieVideo() {
		// TODO Auto-generated method stub
		return dao.movieVideo(session);
	}
	@Override
	public Movie movieDetail(String movieSeq) {
		// TODO Auto-generated method stub
		return dao.movieDetail(movieSeq,session);
	}
	@Override
	public List<Movie> movieSearch(String search) {
		// TODO Auto-generated method stub
		return dao.movieSearch(search,session);
	}
	@Override
	public MoviePersonInfo moviePerson(String person) {
		// TODO Auto-generated method stub
		return dao.moviePerson(person , session);
	}
	@Override
	public List<MovieReview> movieReview(String movieSeq) {
		// TODO Auto-generated method stub
		return dao.movieReview(movieSeq,session);
	}
	@Override
	public int movieWrite(Map param) {
		// TODO Auto-generated method stub
		return dao.movieWrite(param,session);
	}
	@Override
	public int movieReviewCount(String movieSeq) {
		// TODO Auto-generated method stub
		return dao.movieReviewCount(session,movieSeq);
	}
	@Override
	public int updateTotal(Map map) {
		// TODO Auto-generated method stub
		return dao.updateTotal(session,map);
	}
	@Override
	public List<MovieReview> movieReviewList(Map param) {
		// TODO Auto-generated method stub
		return dao.movieReviewList(session,param);
	}
	@Override
	public int movieReviewCount2(Map param) {
		// TODO Auto-generated method stub
		return dao.movieReviewCount2(session, param);
	}
	@Override
	public List<MovieSeatStatus> movieBox(String movieSeq) {
		// TODO Auto-generated method stub
		return dao.movieBox(session,movieSeq);
	}
	@Override
	public List<MovieTime> movieTime() {
		// TODO Auto-generated method stub
		return dao.movieTime(session);
	}
	@Override
	public List<Seat> movieSeatList() {
		// TODO Auto-generated method stub
		return dao.movieSeatList(session);
	}
	@Override
	public Movie movieName(Map param) {
		// TODO Auto-generated method stub
		return dao.movieName(session,param);
	}
	@Override
	public MovieBox getMovieSeat(Map param) {
		// TODO Auto-generated method stub
		return dao.getMovieSeat(session,param);
	}
	@Override
	public int payEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.payEnd(session,param);
	}
	
	@Override
	public MovieTicketing movieTicket(Map param) {
		// TODO Auto-generated method stub
		return dao.movieTicket(session,param);
	}
	
	
	
	
	
}

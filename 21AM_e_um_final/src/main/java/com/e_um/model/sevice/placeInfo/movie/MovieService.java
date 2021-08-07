package com.e_um.model.sevice.placeInfo.movie;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import com.e_um.model.vo.userInfo.report.Report;

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
		return dao.movieList(session);
	}
	
	@Override
	public List<Movie> movieList2() {
		return dao.movieList2(session);
	}


	@Override
	public Movie moviePoster(String movieSeq) {
		return dao.moviePoster(movieSeq, session);
	}
	
	@Override
	public Movie movieVideo() {
		return dao.movieVideo(session);
	}
	
	@Override
	public Movie movieDetail(String movieSeq) {
		return dao.movieDetail(movieSeq,session);
	}
	
	@Override
	public List<Movie> movieSearch(String search) {
		return dao.movieSearch(search,session);
	}
	
	@Override
	public MoviePersonInfo moviePerson(String person) {
		return dao.moviePerson(person , session);
	}
	
	@Override
	public List<MovieReview> movieReview(String movieSeq) {
		return dao.movieReview(movieSeq,session);
	}
	
	@Override
	public int movieWrite(Map param) {
		return dao.movieWrite(param,session);
	}
	
	@Override
	public int movieReviewCount(String movieSeq) {
		return dao.movieReviewCount(session,movieSeq);
	}
	
	@Override
	public int updateTotal(Map map) {
		return dao.updateTotal(session,map);
	}
	
	@Override
	public List<MovieReview> movieReviewList(Map param) {
		return dao.movieReviewList(session,param);
	}
	
	@Override
	public int maleCount(String movieSeq) {
		return dao.maleCount(session,movieSeq);
	}

	@Override
	public int femaleCount(String movieSeq) {
		return dao.femaleCount(session,movieSeq);
	}

	@Override
	public int movieReviewCount2(Map param) {
		return dao.movieReviewCount2(session, param);
	}
	
	@Override
	public List<MovieSeatStatus> movieBox(String movieSeq) {
		return dao.movieBox(session,movieSeq);
	}
	
	@Override
	public List<MovieTime> movieTime() {
		return dao.movieTime(session);
	}
	
	@Override
	public List<Seat> movieSeatList() {
		return dao.movieSeatList(session);
	}
	
	@Override
	public Movie movieName(Map param) {
		return dao.movieName(session,param);
	}
	
	@Override
	public MovieBox getMovieSeat(Map param) {
		return dao.getMovieSeat(session,param);
	}
	
	@Override
	public int payEnd(Map param) {
		return dao.payEnd(session,param);
	}
	
	@Override
	public MovieTicketing movieTicket(Map param) {
		return dao.movieTicket(session,param);
	}

	@Override
	public MovieReview movieReviewOne(String movieReviewSeq) {
		return dao.movieReviewOne(session,movieReviewSeq);
	}
	
	@Override
	public int insertReport(Report report) {
		// TODO Auto-generated method stub
		int result = dao.insertReport(session,report);
		if(result>0) {
			dao.reportCountUpdate(session,report);
		}
		
		return result;
	}

	@Override
	public int totalCount() {
		return dao.totalCount(session);
	}

	@Override
	public int movieCount(Map param) {
		return dao.movieCount(session,param);
	}

	@Override
	public int updateRate(Map map) {
		return dao.updateRate(session,map);
	}

	@Override
	public int enrollMovie(Map param) {
		return dao.enrollMovie(session,param);
	}

	@Override
	public List<Movie> movieAll() {
		return dao.movieAll(session);
	}

	@Override
	public int registPerson(Map param) {
		return dao.registPerson(session,param);
	}

	@Override
	public int insertCross(Map param) {
		return dao.insertCross(session,param);
	}

	@Override
	public int personTotalData() {
		return dao.personTotalData(session);
	}

	@Override
	public List<MoviePersonInfo> personList(int cPage, int numPerPage) {
		return dao.personList(session, cPage, numPerPage);
	}

	@Override
	public int movieDelete(String movieSeq) {
		return dao.movieDelete(session,movieSeq);
	}

	@Override
	public int movieLive(String movieSeq) {
		return dao.movieLive(session,movieSeq);
	}

	@Override
	public int movieUpdate(Map param) {
		return dao.movieUpdate(session,param);
	}

	@Override
	public int moviePersonDelete(String moviePersonSeq) {
		return dao.moviePersonDelete(session,moviePersonSeq);
	}

	@Override
	public int moviePersonLive(String moviePersonSeq) {
		return dao.moviePersonLive(session,moviePersonSeq);
	}

	@Override
	public MoviePersonInfo moviePersonInfo(String moviePersonSeq) {
		return dao.moviePersonInfo(session,moviePersonSeq);
	}

	@Override
	public int updatePerson(Map param) {
		return dao.updatePerson(session,param);
	}

	@Override
	public int reserveCancel(String movieReservNum) {
		return dao.reserveCancel(session,movieReservNum);
	}
	
	
	
	
	
}

package com.e_um.model.dao.placeInfo.movie;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
@Slf4j
public class MovieDao implements MovieDaoInterface {
	@Override
	public List<Movie> movieList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieList");
	}
	
	@Override
	public List<Movie> movieList2(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieList2");
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

	@Override
	public List<MovieReview> movieReview(String movieSeq, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieReview",movieSeq);
	}

	@Override
	public int movieWrite(Map param, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("movie.movieWrite",param);
	}

	@Override
	public int movieReviewCount(SqlSessionTemplate session,String movieSeq) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieReviewCount",movieSeq);
	}

	@Override
	public int updateTotal(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.update("movie.updateTotal",map);
	}

	@Override
	public List<MovieReview> movieReviewList(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieReviewList",param);
	}
	
	@Override
	public int maleCount(SqlSessionTemplate session, String movieSeq) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.maleCount",movieSeq);
	}

	@Override
	public int femaleCount(SqlSessionTemplate session, String movieSeq) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.femaleCount",movieSeq);
	}

	@Override
	public int movieReviewCount2(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieReviewCount2",param);
	}

	@Override
	public List<MovieSeatStatus> movieBox(SqlSessionTemplate session,String movieSeq) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieBox",movieSeq);
	}

	@Override
	public List<MovieTime> movieTime(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieTime");
	}

	@Override
	public List<Seat> movieSeatList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieSeatList");
	}

	@Override
	public Movie movieName(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieName",param);
	}

	@Override
	public MovieBox getMovieSeat(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.getMovieSeat",param);
	}

	@Override
	public int payEnd(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("movie.payEnd",param);
	}

	@Override
	public MovieTicketing movieTicket(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieTicket",param);
	}

	@Override
	public MovieReview movieReviewOne(SqlSessionTemplate session, String movieReviewSeq) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieReviewOne",movieReviewSeq);
	}

	@Override
	public int insertReport(SqlSessionTemplate session, Report report) {
		// TODO Auto-generated method stub
		return session.insert("report.insertReport", report);
	}

	@Override
	public int reportCountUpdate(SqlSessionTemplate session, Report report) {
		// TODO Auto-generated method stub
		return session.update("report.reportCountUpdate",report);
	}

	@Override
	public int totalCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.totalCount");
	}

	@Override
	public int movieCount(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.movieCount",param);
	}

	@Override
	public int updateRate(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.update("movie.updateRate",map);
	}

	@Override
	public int enrollMovie(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("movie.enrollMovie",param);
	}

	@Override
	public List<Movie> movieAll(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("movie.movieAll");
	}

	@Override
	public int registPerson(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("movie.registPerson",param);
	}

	@Override
	public int insertCross(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("movie.insertCross",param);
	}

	@Override
	public int personTotalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.personTotalData");
	}

	@Override
	public List<MoviePersonInfo> personList(SqlSessionTemplate session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("movie.personList","",new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int movieDelete(SqlSessionTemplate session, String movieSeq) {
		// TODO Auto-generated method stub
		return session.update("movie.movieDelete",movieSeq);
	}

	@Override
	public int movieLive(SqlSessionTemplate session, String movieSeq) {
		// TODO Auto-generated method stub
		return session.update("movie.movieLive",movieSeq);
	}

	@Override
	public int movieUpdate(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("movie.movieUpdate",param);
	}

	@Override
	public int moviePersonDelete(SqlSessionTemplate session, String moviePersonSeq) {
		// TODO Auto-generated method stub
		return session.update("movie.moviePersonDelete",moviePersonSeq);
	}

	@Override
	public int moviePersonLive(SqlSessionTemplate session, String moviePersonSeq) {
		// TODO Auto-generated method stub
		return session.update("movie.moviePersonLive",moviePersonSeq);
	}

	@Override
	public MoviePersonInfo moviePersonInfo(SqlSessionTemplate session, String moviePersonSeq) {
		// TODO Auto-generated method stub
		return session.selectOne("movie.moviePersonInfo",moviePersonSeq);
	}

	@Override
	public int updatePerson(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("movie.updatePerson",param);
	}

	@Override
	public int reserveCancel(SqlSessionTemplate session, String movieReservNum) {
		// TODO Auto-generated method stub
		return session.update("movie.reserveCancel",movieReservNum);
	}

	@Override
	public int movieAlarm(SqlSessionTemplate session, Map param) {
		return session.insert("movie.movieAlarm",param);
	}

	@Override
	public int movieScheduler(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("movie.movieScheduler",param);
	}
	
	
	
	
	
	
	
}

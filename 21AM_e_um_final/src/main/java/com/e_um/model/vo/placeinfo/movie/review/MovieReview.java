package com.e_um.model.vo.placeinfo.movie.review;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
import com.e_um.model.vo.userInfo.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class MovieReview {
	private String movieReviewSeq;
	private Movie movieSeq;
	private User userId;
	private String movieReviewTitle, movieReviewContent;
	private int movieDirect,movieVisualQuality,movieStroy, movieActingPerformance, movieOst;
	private double movieEvaluationAvg;
	private Date movieReviewWriteDate;
	private String movieReviewDelete, movieReviewDestroy;
}

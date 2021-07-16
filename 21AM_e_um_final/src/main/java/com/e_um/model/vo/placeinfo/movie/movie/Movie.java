package com.e_um.model.vo.placeinfo.movie.movie;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.movie.personInfo.MoviePersonInfo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Movie {
	private String movieSeq;
	private String movieTitleKr, movieTitleEn;
	private int movieTotalEvalution;
	private String movieDirector; 
	private Date movieOpenDate ;
	private String movieRunningTime;
	private int movieAge;
	private String moviePhoto1,moviePhoto2,moviePhoto3;
	private String movieVideo;
	private String movieContents, movieStatus;
	private double movieReservRate;
	
	
	private List<MoviePersonInfo> persons = new ArrayList();
	
	
	
}

package com.e_um.model.vo.placeinfo.movie.reserv;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class MovieInfo {
	
	private String movieReservNum;
	private String userId;
	private String seats1, seat2, seat3,seat4; 
	private String movieSeq, movieBox, movieLocation,movieTime;
	private int moviePrice;
	private Date movieReservDate;
	private String movieReservCancel;
	private String movieTitle;
	private int dateMinus;
	private String payStatus;

}

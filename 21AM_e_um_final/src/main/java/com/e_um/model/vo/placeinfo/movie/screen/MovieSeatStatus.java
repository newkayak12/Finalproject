package com.e_um.model.vo.placeinfo.movie.screen;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.movie.seat.Seat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class MovieSeatStatus {
	
	/*
	 * 좌석을 뿌려줄 때 한 번에 여러개를 가져오자!
	 */
	private String boxOfficeSeq, movieLocation, movieBox, movieSeq, movieTime;
	private int movieRows, movieColumns;
	private List<Seat> seats = new ArrayList();

}

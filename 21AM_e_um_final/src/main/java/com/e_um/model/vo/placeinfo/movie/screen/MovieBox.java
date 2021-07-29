package com.e_um.model.vo.placeinfo.movie.screen;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class MovieBox {
	private String movieBoxSeq;
	private int movieRows;
	private int movieColumns;
	private String movieBox,movieLocation;
	private Movie movieSeq;
	
}

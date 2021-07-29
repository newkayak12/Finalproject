package com.e_um.model.vo.placeinfo.movie.seat;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
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
public class Seat {
	private String seat;
}

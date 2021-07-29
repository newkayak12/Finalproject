package com.e_um.model.vo.placeinfo.movie.screen;

import java.util.List;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;
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
public class MovieTime {
	private String movieTime;
}

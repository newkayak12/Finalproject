package com.e_um.model.vo.placeinfo.movie.personInfo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
public class MoviePersonInfo {
	private String moviePersonSeq, moviePersonName;
	private Date moviePersonBirth;
	private String moviePersonPhoto;
	
//	typeHandler로....  영화1,영화2,영화3 
//	영화 영화 인물 영, 여2, 여3, 
	private List<String> movies = new ArrayList<String>();
//	private List<Movie> movies = new ArrayList();
	
}

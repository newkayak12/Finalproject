package com.e_um.model.sevice.placeInfo.movie;

import java.util.List;

import com.e_um.model.vo.placeinfo.movie.movie.Movie;

public interface MovieServiceInterface {
	public List<Movie> movieList();

	public Movie moviePoster(String movieSeq);

	public Movie movieVideo();
	
	public Movie movieDetail(String movieSeq);
	
	public List<Movie> movieSearch(String search);
}

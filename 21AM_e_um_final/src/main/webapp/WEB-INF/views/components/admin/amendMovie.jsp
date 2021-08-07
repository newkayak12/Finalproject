<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<form action="${pageContext.request.contextPath}/movie/movieUpdate" method="post">
    <h1>영화 등록</h1>
    <input type="hidden" value="${movie.movieSeq }" name="movieSeq">
    <h4 style="display: inline-block; width: 200px;">영화제목(한글) :</h4>
    <input style="height: 20px; width: 300px; height:25px;"  type="text" name="movieTitleKr" value="${movie.movieTitleKr }" disabled><br>
    <h4 style="width: 200px; display: inline-block;">영화제목(영어) :</h4>
    <input style="display: inline-block; height: 25px; width: 300px;" type="text" name="movieTitleEn" value="${movie.movieTitleEn }" required><br>
    <h4 style="width: 200px; display: inline-block;" >감독 :</h4>
    <input style="display: inline-block; height: 25px; width: 300px;" type="text" name="movieDirector" value="${movie.movieDirector }" required><br>
    <h4 style="width: 200px; display: inline-block;" >개봉일 :</h4>
    <input style="display: inline-block; height: 25px; width: 300px;" type="date" name="movieOpenDate" value="movieOpenDate" required><br>
    <h4 style="width: 200px; display: inline-block;">시간(런닝타임) :</h4>
    <input style="display: inline-block; height: 25px; width: 300px;" type="text" name="movieRunningTime" value="${movie.movieRunningTime }" required><br>
    <h4 style="width: 200px; display: inline-block;">나이 :</h4>
    <input style="display: inline-block; height: 25px; width: 300px;" type="text" name="movieAge" value="${movie.movieAge }" required><br>
    <h4 style="width: 200px; display: inline-block;">영화상태 :</h4>
    <input style="display: inline-block; height: 25px; width: 300px;" type="text" name="movieStatus" value="${movie.movieStatus }" required><br>
    <h4 style="width: 200px; display: inline-block;">유튜브 주소 :</h4>
    <input style="display: inline-block; height: 25px; width: 300px;" type="text" name="movieVideo" value="${movie.movieVideo }" required><br>
    <h4><label for="comment">스토리:</label></h4>
    <textarea rows="8" cols="100"  id="comment" name="movieStory" required></textarea><br>
    
    <button class="btn btn-primary ml-5 mt-5">수정</button>
    
  </form>
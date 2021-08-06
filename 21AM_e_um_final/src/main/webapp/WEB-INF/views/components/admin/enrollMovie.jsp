<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="${pageContext.request.contextPath }/movie/movieEnroll" method="post" enctype="multipart/form-data">
    <h1>영화 등록</h1>
    <h4 style="display: inline-block; width: 200px;">영화제목(한글) :</h4>
    <input style="height: 20px; width: 300px;" type="text" name="movieTitleKr" required><br>
    <h4 style="width: 200px; display: inline-block;">영화제목(영어) :</h4>
    <input style="display: inline-block; height: 20px; width: 300px;" type="text" name="movieTitleEn" ><br>
    <h4 style="width: 200px; display: inline-block;" >감독 :</h4>
    <input style="display: inline-block; height: 20px; width: 300px;" type="text" name="movieDirector" required><br>
    <h4 style="width: 200px; display: inline-block;" >개봉일 :</h4>
    <input style="display: inline-block; height: 20px; width: 300px;" type="date" name="movieOpenDate" required><br>
    <h4 style="width: 200px; display: inline-block;">시간(런닝타임) :</h4>
    <input style="display: inline-block; height: 20px; width: 300px;" type="text" name="movieRunningTime" placeholder="00분" required><br>
    <h4 style="width: 200px; display: inline-block;">나이 :</h4>
    <input style="display: inline-block; height: 20px; width: 300px;" type="text" name="movieAge" placeholder="00세 이상 또는 청소년 관람불가" required><br>
    <h4 style="width: 200px; display: inline-block;">영화상태 :</h4>
    <input style="display: inline-block; height: 20px; width: 300px;" type="text" name="movieStatus" placeholder="상영중 또는 개봉전" required><br>
    <h4 style="width: 200px; display: inline-block;">유튜브 주소 :</h4>
    <input style="display: inline-block; height: 20px; width: 300px;" type="text" name="movieVideo" required><br>
    <h4><label for="comment">스토리:</label></h4>
    <textarea rows="8" cols="100" id="comment" name="movieStory" required></textarea><br>
    <h4>포스터1</h4>
    <input type="file" name="file" multiple="multiple" required>
    <h4>포스터2</h4>
    <input type="file" name="file" multiple="multiple">
    <h4>포스터3</h4>
    <input type="file" name="file" multiple="multiple">
    <button class="btn btn-primary ml-5">등록</button>
  </form>
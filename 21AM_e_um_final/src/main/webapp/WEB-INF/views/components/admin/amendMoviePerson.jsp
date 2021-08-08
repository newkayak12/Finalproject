<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form action="${pageContext.request.contextPath }/movie/updatePerson" method="post" enctype="multipart/form-data">   
	  <input type="hidden" name="moviePersonSeq" value="${person.moviePersonSeq }">
	  <h4 style="width: 200px; display: inline-block;">이름</h4>
	  <input type="text" style="display: inline-block; height: 20px; width: 300px;" value="${person.moviePersonName }"  name="name" required><br>
	  <h4 style="width: 200px; display: inline-block;">생년월일</h4>
	  <input type="date" style="display: inline-block; height: 20px; width: 300px;" name="birth" value="${person.moviePersonBirth }"  required><br>
	  <h4 style="width: 200px; display: inline-block;">필모그래피</h4>
	  <input type="width: 200px; text" style="display: inline-block; height: 20px; width: 300px;" value="${person.movies }" name="list" required><br>
	  <h4 style="width: 200px;">인물사진</h4>
  	  <div>
  	  	<p>이전사진</p>
  	  	<img alt="" style="width: 200px; height: 300px;" src="${path }/resources/upload/moviePerson/${person.moviePersonPhoto}">
  	  </div>
  	  <br>
  	  <input style="display: inline-block;" type="file" name="file" multiple="multiple" required><br>
  	  <br>
  	  <button class="btn btn-primary">수정</button>
 </form>
 
 <style>
		*{
			font-family:'Noto Sans KR';
		}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
  
  <form action="${pageContext.request.contextPath }/movie/registPerson" method="post" enctype="multipart/form-data">  
	  <h4 style="width: 200px; display: inline-block;">영화</h4>
	  <select style="display: inline-block;" name="movieSeq">
	      <option value="영화시퀀스" disabled selected>영화선택</option>
	      <c:forEach var="l" items="${list }">
	      		<option value="${l.movieSeq }" ><c:out value="${l.movieTitleKr }"/></option>
	      		
	      </c:forEach>
	      
		
	  </select><br>
	  <h4 style="width: 200px; display: inline-block;">이름</h4>
	  <input type="text" style="display: inline-block; height: 20px; width: 300px;"  name="name" required><br>
	  <h4 style="width: 200px; display: inline-block;">생년월일</h4>
	  <input type="date" style="display: inline-block; height: 20px; width: 300px;" name="birth" required><br>
	  <h4 style="width: 200px; display: inline-block;">필모그래피</h4>
	  <input type="width: 200px; text" style="display: inline-block; height: 20px; width: 300px;" name="list" required placeholder="영화,영화,영화"><br>
	  <h4 style="width: 200px; display: inline-block;">인물사진</h4>
  	  <input type="file" name="file" multiple="multiple" required><br>
  	  <button class="btn btn-primary">등록</button>
  </form>
  
  
  <style>
		*{
			font-family:'Noto Sans KR';
		}
</style>
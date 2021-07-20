<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--본인 css 파일 포함시켜주세요-->
   
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
   	<div class="container">
   		<h2>소모임 전체 조회</h2>
   		
   		<table class="table table-hover">
   			<thead>
   			<tr>
   				<th>번호</th>
   				<th>카테고리</th>
   				<th>제목</th>
   				<th>인원수</th>
   				<th>성별</th>
   				<th>나이대</th>
   				<th>방장</th>
   				<th>생성날짜</th>
   			</tr>
   			</thead>
   			<c:forEach var="g" items="${list }">
   			<tbody>
   			<tr>
   				<td><c:out value="${g.groupSeq }"/></td>
			  	<td><c:out value="${g.groupTheme }"/></td>
			  	<td><c:out value="${g.groupTitle }"/></td>
			  	<td><c:out value="${g.groupLimit }"/></td>
			  	<td><c:out value="${g.groupGender }"/></td>
			  	<td><c:out value="${g.groupAge }"/></td>
			  	<td><c:out value="${g.groupMaster }"/></td>
			  	<td><c:out value="${g.groupDate }"/></td>
   			</tr>
   			</tbody>
   			</c:forEach>
   		</table>
   	</div>
      
      
      
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
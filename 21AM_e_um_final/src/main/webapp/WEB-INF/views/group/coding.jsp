<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/woosik.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--본인 css 파일 포함시켜주세요-->
<script>
const moveFn=(groupSeq)=>{
	
	$.ajax({
		url : "${path}/group/groupCountToday",
		data : {
			
			"groupSeq" : groupSeq
		},
		success : data => {
			console.log(data);
			location.assign("<%=request.getContextPath()%>/group/groupJoin.do?groupSeq="+data['groupSeq']);		
		}
	})
	
	$.ajax({
			url : "${path}/group/groupCountTotal",
			data : {
				
				"groupSeq" : groupSeq
			},
			success : data => {
				console.log(data);
				location.assign("<%=request.getContextPath()%>/group/groupJoin.do?groupSeq="+data['groupSeq']);		
			}
		})
}
</script>   
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
   	<div class="container">
   		<h2 class="mainColor tway ml-3">코딩 소모임</h2>
   		
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
			  	<td><a href="javascript:moveFn('${g.groupSeq}');"><c:out
									value="${g.groupTitle }" /></a></td>
			  	<td><c:out value="${g.groupLimit }"/></td>
			  	<td><c:out value="${g.groupGender }"/></td>
			  	<td><c:out value="${g.groupAge }"/></td>
			  	<td><c:out value="${g.groupMaster }"/></td>
			  	<td><fmt:formatDate value="${g.groupDate }"
								pattern="yyyy-MM-dd" /></td>
   			</tr>
   			</tbody>
   			</c:forEach>
   		</table>
   	</div>
      
      
      
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
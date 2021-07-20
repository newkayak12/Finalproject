<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>

	/* 오른쪽으로 100씩 이동 */
	RightScroll=function(){
		var _scrollX = $(".table-scroll").scrollLeft();
		$(".table-scroll").scrollLeft(_scrollX + 100);
	};
	
	/* 왼쪽으로 100씩 이동 */
	LeftScroll=function(){
		var _scrollX = $(".table-scroll").scrollLeft();
		$(".table-scroll").scrollLeft(_scrollX - 100);
	};
	
	
</script>
    
<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
	<!-- 소모임,찾기 버튼 -->
	<div class="clearfix">
		<span class="float-left">소모임</span>
		<span class="float-right">
			<button>
				<i class="fas fa-search"></i>
			</button>
		</span>
	</div>
	
	<br><br>
	
	<!-- 소모임 생성 버튼 -->
	<span class="float-right">
		<button id="btn-create-group" class="btn btn-info"
			onclick="location.assign('${path}/group/groupCreate.do')">소모임생성
		</button>
	</span>
	
	<br><br>
	
	<!-- 내가 가입한 소모임 리스트 -->
		<p>내가 가입한 소모임</p>
		  <table id="tbl-signed-group" class="table">
		  	<c:forEach var="g" items="${list }">
		  	<tbody>
			  	<tr>
			  		<td><c:out value="${g.groupFileUpload }"/></td>
			  		<td><c:out value="${g.groupTitle }"/></td>
			  		<td><button id="btn-groupinit" class="btn"
			  		onclick="location.assign('${path}/group/groupSigned.do')">입장</button></td>
			  	</tr>
		  	</tbody>
		  	</c:forEach>
		  </table>
		  
		 
	<!-- 인기 있는 소모임 리스트 -->	 
		<p>인기 있는 소모임</p>
		  <table id="tbl-popular-group" class="table-scroll" style="overflow-x: scroll;">
		  	
		  </table>
		  <c:forEach var="g" items="${list }">
		  	<div>
		  		<a href="${rqeust.getContextPath }/group/groupboardDetail.do?groupSeq="+${g.groupSeq }>
		  			<%-- <img alt="" src="${request.getContextPath}/resources/upload/group/group_mainphoto/${g.groupFileUpload } "> --%>
		  			<img alt="" src="https://mblogthumb-phinf.pstatic.net/20150427_261/ninevincent_1430122791768m7oO1_JPEG/kakao_1.jpg?type=w2" class="col-4" style="width:100%">
		  		</a>
		  		<div class="d-flex justify-content-start">
		  			<p>${g.groupTitle }</p> <p>${g.groupLimit }</p>
		  		</div>
		  		
		  		
		  	</div>
		  </c:forEach>
		  <div>
			  <div class="clearfix">
			  	<span class="float-left">
			  		<button onclick="LeftScroll()">왼쪽으로</button>
			  	</span>
			  	<span class="float-right">
			  		<button onclick="RightScroll()">오른쪽으로</button>
			  	</span>
			  </div>
		  </div>
		  
		  
		  
		  
	<!-- 새로 생긴 소모임 리스트 -->
		<p>새로 생긴 소모임</p>
		  <table id="tbl-new-group" class="table-scroll" style="overflow-x: scroll;" >
		  	<tr>
		  		<td></td>
		  	</tr>
		  </table>
		  <button onclick="LeftScroll()">왼쪽으로</button>
		  <button onclick="RightScroll()">오른쪽으로</button>
		  
	<!-- 인기 카테고리 리스트 -->	  
		<p>인기 카테고리</p>
		  <table id="tbl-popular-category" class="table-scroll" style="overflow-x: scroll;">
		  </table>
		  <button onclick="LeftScroll()">왼쪽으로</button>
		  <button onclick="RightScroll()">오른쪽으로</button>
		  
	<!-- 소모임 전체 보기 리스트 -->	 
		<p>소모임</p>
		  <table id="tbl-nomal-group" class="table">
		  	<c:forEach var="g" items="${list }">
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
		  
	<!-- 소모임 더보기 버튼 -->
		  <button id="btn-more-group" class="btn" 
		  	onclick="location.assign('${path}/group/groupListAll.do')">더보기
		  </button>
	  </div>
</section>    
   
   


</body>
</html>
   
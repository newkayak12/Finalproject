<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--본인 css 파일 포함시켜주세요-->

<script>
	const moveFnBoard=(groupSeq)=>{
		console.log(groupSeq);
		location.assign("<%=request.getContextPath()%>/group/groupBoard.do?groupSeq="+groupSeq);
	}
	const moveFnScheduler=(groupSeq)=>{
		console.log(groupSeq);
		location.assign("<%=request.getContextPath()%>/group/groupScheduler.do?groupSeq="+groupSeq);
	}
</script>
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
      <div class="container">
      	<span>
      		<h2 class="tway" style="text-align: center;"><c:out value="${group.groupTitle }"/></h2>
      	</span>
      	<br><br>
      	<span class="float-right">
      		<p>TODAY<span class="ml-2"  style="font-weight: 900;"><c:out value="${group.groupCountToday }"/></span> / TOTAL <span class="ml-2 " style="font-weight: 900;"><c:out value="${group.groupCountTotal }"/></span></p>
      		
      	</span>
      	
      	
      	<br><br>
      	<button type="button" class="btn checkBtn mb-1" disabled>정보</button>
   		<button type="button" class="btn cancelBtn"
   		onclick="moveFnBoard('${group.groupSeq}');">게시판</button>
   		<%-- <button type="button" class="btn btn-outline-primary"
   		onclick= "moveFnScheduler('${group.groupSeq}')">스케쥴러</button> --%>
      </div>
      
      <br><br>
      
      <h5 class="mainColor tway ml-3">소모임 소개</h5>
      <div style="border-radius:10px; border : solid 1px #2AC1BC; width : 80%; height :150px">
	      <div>
	      <div class="d-flex">
	      	<img style="border-radius: 10px" src="${pageContext.request.contextPath}/resources/upload/group/${group.groupFileUpload }"width="150px;" height="150px" />
	      	<h4 class="ml-3"style="font-family: 'Nanum Pen Script', cursive; font-size: 40px"><c:out value="${group.groupComment} "/></h4>
	      </div>
	      </div>
      </div>
      
      
      <br>
      <hr>
      <br><br>
      
      <h5 class="mainColor tway ml-3">소모임 정보</h5>
      <div style="border-radius:10px; border : solid 1px #2AC1BC; width : 80%; height :150px">
		<div>
		<div class="d-flex">
			<c:choose>
				<c:when test="${group.groupTheme=='게임' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/game.png" width="150px;" height="150px"/>
      			</c:when>
      			<c:when test="${group.groupTheme=='운동' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/gym.png" width="150px;" height="150px"/>
      			</c:when>
      			<c:when test="${group.groupTheme=='요리' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/cook.png" width="150px;" height="150px"/>
      			</c:when>
      			<c:when test="${group.groupTheme=='맛집' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/resturant.png" width="150px;" height="150px"/>
      			</c:when>
      			<c:when test="${group.groupTheme=='영화' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/movie.png" width="150px;" height="150px"/>
      			</c:when>
      			<c:when test="${group.groupTheme=='코딩' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/coding.png" width="150px;" height="150px"/>
      			</c:when>
      			<c:when test="${group.groupTheme=='쇼핑' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/shopping.png" width="150px;" height="150px"/>
      			</c:when>
      			<c:when test="${group.groupTheme=='독서' }">
					<img style="border-radius:10px" src="<%=request.getContextPath() %>/resources/upload/group/group_category/read.png" width="150px;" height="150px"/>
      			</c:when>
      		</c:choose>
      		
      		<div>
      		<br>
      			<div class="m-3">
      			<span class="mainColor tway">테마 : </span> <span style="font-family: 'Nanum Pen Script', cursive; font-size: 30px"> 

      					<c:out value="${group.groupTheme }"/>
      				</span>
      				<br>
      			<span class="mainColor tway">방장 : </span> <span style="font-family: 'Nanum Pen Script', cursive; font-size: 30px"">
      					
      					<c:out value="${group.groupMaster }"/>
      			</span>	
      			</div>
      			<br>
      			
      		</div>
      	</div>
      	</div>
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
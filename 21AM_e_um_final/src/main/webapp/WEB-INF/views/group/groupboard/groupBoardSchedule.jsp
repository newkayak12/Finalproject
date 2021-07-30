<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--본인 css 파일 포함시켜주세요-->
<script>
const moveFnBoard=(groupSeq)=>{
		console.log(groupSeq);
		location.assign("<%=request.getContextPath()%>/group/groupBoard.do?groupSeq="+groupSeq);
	}
	const moveFnMain=(groupSeq)=>{
		console.log(groupSeq);
		location.assign("<%=request.getContextPath()%>/group/groupSigned.do?groupSeq="+groupSeq);
	}
</script>
    
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
      <div class="container">
      	<span class="float-left">
      		<h2><c:out value="${group.groupTitle }"/></h2>
      	</span>
      	<span class="float-right">
      		<h2>오늘방문자</h2>
      	</span>
      	<h2>누적방문자</h2>
      	<br><br>
      	<button type="button" class="btn btn-outline-primary"
      	onclick="moveFnMain('${group.groupSeq}');">정보</button>
   		<button type="button" class="btn btn-outline-primary"
   		onclick="moveFnBoard('${group.groupSeq}');">게시판</button>
   		<button type="button" class="btn btn-primary" disabled>스케쥴러</button>
      </div>
      <br><br>
      <h3>사진 올라갈 자리</h3>
      
      <br><br><br><br>
      
      <h1>스케쥴러 올라갈 자리</h1>
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
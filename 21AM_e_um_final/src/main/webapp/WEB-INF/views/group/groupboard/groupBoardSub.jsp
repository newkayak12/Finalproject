<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	const moveFnCreateBoard=(groupSeq)=>{
			location.assign("<%=request.getContextPath()%>/group/groupBoardWrite.do?groupSeq="+groupSeq);
	}

	const moveFnMain=(groupSeq)=>{
			console.log(groupSeq);
			location.assign("<%=request.getContextPath()%>/group/groupSigned.do?groupSeq="+groupSeq);
		}
	const moveFnScheduler=(groupSeq)=>{
		console.log(groupSeq);
		location.assign("<%=request.getContextPath()%>/group/groupScheduler.do?groupSeq="+groupSeq);
	}
	const moveFn=(groupBoardSeq)=>{
		location.assign("<%=request.getContextPath()%>/group/groupBoardContents.do?groupBoardSeq="+groupBoardSeq);
	}
	const moveFnNo=(groupBoardSeq)=>{
		console.log(groupBoardSeq);
		location.assign("<%=request.getContextPath()%>/group/groupBoardContentsNotice.do?groupBoardSeq="+groupBoardSeq);
	}
	
	 const boardSearch=()=>{
		$.ajax({
			url : "${path}/group/gorupBoardSearch",
			data : {"inputSearch":$("#inputSearch").val(), "groupSeq":$("#groupSeq").val()},
			success:data=>{
				console.log(data);
				$(".seq").html("");
				$(".title").html("");
				$(".userId").html("");
				$(".date").html("");
				$(".status").html("");
				for(var i=0; i<data.legnth;i++){
					$(".table-light").append($("<td>").html(data[i]['groupBoardSeq']))
				}
			}		
		})
	} 
</script>
<!--본인 css 파일 포함시켜주세요-->
    
    
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
   		<button type="button" class="btn btn-primary" disabled>게시판</button>
   		<button type="button" class="btn btn-outline-primary"
   		onclick="moveFnScheduler('${group.groupSeq}');">스케쥴러</button>
      </div>
      
      <br><br>
      
      <h3>사진 올라갈 자리</h3>
      
      <br><hr><br>
      

      <div class="input-group mb-3">
      	<input type="text" class="form-control" id="inputSearch" name="inputSearch" placeholder="검색">
      	<input type="hidden" value="${group.groupSeq }" id="groupSeq" name="groupSeq"/>
      	<div class="input-group-append">
      		<button class="btn btn-success" id="boardSearchButton" onclick="boardSearch();">찾기</button>
      	</div>
      </div>
      
      
      <br><br>
      
      <div>
      	<button type="button" id="btnWrite" class="btn btn-primary" align="right"
      		onclick="moveFnCreateBoard('${group.groupSeq }');">
      		게시판 생성
      	</button>
      </div>
      
      <div class="board-contents">
      <table class="table" id="table">
      	<thead>
      	<tr>
      		<th>번호</th>
      		<th>유형</th>
      		<th>제목</th>
      		<th>작성자</th>
      		<th>날짜</th>
      	</tr>
      	</thead>
      	<tbody>
      		<c:forEach var="b" items="${notice }">
      		<tr class="table-primary">
        		<td><c:out value="${b.groupBoardSeq }"/></td>
		        <td><c:out value="${b.groupLevel }"/></td>
		        <td><a href="javascript:moveFnNo('${b.groupBoardSeq}');"><c:out value="${b.groupBoardTitle }"/></a></td>
		        <td><c:out value="${b.groupBoardUser.userId}"/></td>
		        <td><c:out value="${b.groupBoardDate }"/></td>
      		</tr>
      		</c:forEach>
      		<c:forEach var="b" items="${best }" begin="0" end="2" >
      		<tr class="table-warning">
		        <td><c:out value="${b.groupBoardSeq }"/></td>
		        <td>베스트게시글</td>
		        <td><a href="javascript:moveFn('${b.groupBoardSeq}');"><c:out value="${b.groupBoardTitle }"/></a></td>
		        <td><c:out value="${b.groupBoardUser.userId}"/></td>
		        <td><c:out value="${b.groupBoardDate }"/></td>
      		</tr>
      		</c:forEach>
      		
      		<c:forEach var="b" items="${boardlist }">
     		<tr class="table-light">
		        <td class="seq"><c:out value="${b.groupBoardSeq }"/></td>
		        <td class="status">일반</td>
		        <td class="title"><a href="javascript:moveFn('${b.groupBoardSeq}');"><c:out value="${b.groupBoardTitle }"/></a></td>
		        <td class="userId"><c:out value="${b.groupBoardUser.userId}"/></td>
		        <td class="date"><c:out value="${b.groupBoardDate }"/></td>
      		</tr>
      		</c:forEach>
      	</tbody>
      </table>
      </div>
      
   </div>
   
   
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
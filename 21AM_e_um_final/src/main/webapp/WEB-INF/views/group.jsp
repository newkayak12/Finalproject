<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="<c:url value="${path }/resources/css/woosik.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
	
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<script>
	/*[인기있는소모임] 버튼 슬라이드 */
	RightScroll=function(){
	  var _scrollRight = $('.scroll').scrollLeft();
	  $('.scroll').scrollLeft(_scrollRight + 150);
	}
	
	LeftScroll=function(){
		var _scrollLeft = $('.scroll').scrollLeft();
		  $('.scroll').scrollLeft(_scrollLeft - 150);
	}
	
	
	const moveFn=(groupSeq)=>{
		console.log(groupSeq);
		location.assign("<%=request.getContextPath()%>/group/groupJoin.do?groupSeq="+groupSeq);
	}
	
	const fn_searchbox=()=>{$("#hide").slideToggle();}
	
	
</script>


<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">

		<!-- 소모임,찾기 버튼 -->
		<div class="clearfix">
			<span class="float-left">소모임</span> <span class="float-right">
				<button onclick="fn_searchbox()">
					<i class="fas fa-search" id="search"></i>
				</button>
			</span>
		</div>
		
		<br>
		<div class="test" id="hide" style="display : none;">
			<div class="input-group mb-3">
			
		      	<input type="text" class="form-control" placeholder="검색">
			      	<div class="input-group-append">
			      		<button class="btn btn-success" type="submit">찾기</button>
			      	</div>
		      </div>
		</div>
		<br>

		<!-- 소모임 생성 버튼 -->
		<span class="float-right">
			<button id="btn-create-group" class="btn btn-info"
				onclick="location.assign('${path}/group/groupCreate.do')">소모임생성
			</button>
		</span> <br>
		<br>

		<!-- 내가 가입한 소모임 리스트 -->
		<p>내가 가입한 소모임</p>
		<table id="tbl-signed-group" class="table">

			<c:forEach var="g" items="${list2 }">

				<tbody>
					<tr>
						<td><c:out value="${g.groupFileUpload }" /></td>
						<td><c:out value="${g.groupTitle }" /></td>

						<td><button id="btn-groupinit" class="btn"
								onclick="<%-- location.assign('${path}/group/groupJoin.do?groupSeq='+${g.groupSeq }) --%>
								javascript:moveFn('${g.groupSeq}');">입장</button></td>
					</tr>
				</tbody>

			</c:forEach>

		</table>


		<!-- 인기 있는 소모임 리스트 -->
		<p>인기 있는 소모임</p>
		<table id="tbl-popular-group" class="table-scroll"
			style="overflow-x: scroll;">

		</table>

		<div class="d-flex justify-content-start scroll"
			style="overflow-x: hidden;">
			<c:forEach var="g" items="${list }">

				<!-- 리스트 div -->
				<a href="javascript:moveFn('${g.groupSeq }');">
					<div class="list_container">
						<div class="list_imgBox1">
							<img
								src="${request.getContextPath}/resources/upload/group/${g.groupFileUpload } ">
						</div>
						<div class="list_containerTxt d-flex justify-content-start">
							<p class="list_container_tit">${g.groupTitle }</p>
							<p class="list_container_limit">${g.groupLimit }</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>

		<!-- 좌우 버튼 -->
		<div>
			<div class="clearfix">
				<span class="float-left">
					<button onclick="LeftScroll()">왼쪽으로</button>
				</span> <span class="float-right">
					<button onclick="RightScroll()">오른쪽으로</button>
				</span>
			</div>
		</div>




		<!-- 새로 생긴 소모임 리스트 -->
		<p>새로 생긴 소모임</p>
		<table id="tbl-new-group" class="table-scroll"
			style="overflow-x: scroll;">
		</table>
		<div class="d-flex justify-content-start scroll"
			style="overflow-x: hidden;">
			<c:forEach var="g" items="${list }">

				<!-- 리스트 div -->
				<a href="javascript:moveFn('${g.groupSeq }');">
					<div class="list_container">
						<div class="list_imgBox1">
							<img
								src="${request.getContextPath}/resources/upload/group/${g.groupFileUpload } ">
						</div>
						<div class="list_containerTxt d-flex justify-content-start">
							<p class="list_container_tit">${g.groupTitle }</p>
							<p class="list_container_limit">${g.groupLimit }</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		<button onclick="LeftScroll()">왼쪽으로</button>
		<button onclick="RightScroll()">오른쪽으로</button>

		<!-- 인기 카테고리 리스트 -->
		<p>인기 카테고리</p>
		<table id="tbl-popular-category" class="table-scroll"
			style="overflow-x: scroll;">
		</table>
		<button onclick="LeftScroll()">왼쪽으로</button>
		<button onclick="RightScroll()">오른쪽으로</button>

		<!-- 소모임 전체 보기 리스트 -->
		<p>소모임</p>
		<table id="tbl-nomal-group" class="table">
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
			<c:forEach var="g" items="${list }" begin="0" end="4">
				<tbody>
					<tr>
						<td><c:out value="${g.groupSeq }" /></td>
						<td><c:out value="${g.groupTheme }" /></td>
						<td><a href="javascript:moveFn('${g.groupSeq}');"><c:out
									value="${g.groupTitle }" /></a></td>

						<td><c:out value="${g.groupLimit }" /></td>
						<td><c:out value="${g.groupGender }" /></td>
						<td><c:out value="${g.groupAge }" /></td>
						<td><c:out value="${g.groupMaster }" /></td>
						<td><fmt:formatDate value="${g.groupDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>


		<!-- 소모임 더보기 버튼 -->
		<button id="btn-more-group" class="btn"
			onclick="location.assign('${path}/group/groupListAll.do')">더보기
		</button>
	</div>


	</div>
	</div>
</section>




</body>
</html>

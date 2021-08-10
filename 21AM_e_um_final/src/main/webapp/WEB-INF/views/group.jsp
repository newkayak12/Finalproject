<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" /> --%>
<link href="${pageContext.request.contextPath}/resources/css/woosik.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
	


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
	
	
	<%-- const moveFnCate=(groupSeq)=>{
		
		$.ajax({
			url : "${path}/group/groupCategory",
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
	} --%>
	
	
	
	const fn_searchbox=()=>{$("#hide").slideToggle();}
	
	/* $(function(){
		
	}) */
	
	
</script>


<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">

		<!-- 소모임,찾기 버튼 -->
		 <div class="clearfix">
			<p style="text-align: center; font-size:35px;" class="pointFont mainColor tway" >소모임</p>
			<!--<span class="float-right">
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
		      </div> -->
		</div>
		<br>

		<!-- 소모임 생성 버튼 -->
		<span class="float-right">
			<button id="btn-create-group" class="btn checkBtn mb-1"
				onclick="location.assign('${path}/group/groupCreate.do')">소모임생성
			</button>
		</span> <br>
		<br>

		<!-- 내가 가입한 소모임 리스트 -->
		<h4 class="mainColor tway ml-3">내가 가입한 소모임</h4>
		<table id="tbl-signed-group" class="table" style="margin-bottom: 70px">

			<c:forEach var="g" items="${list2 }">

				<tbody>
					<tr>
						<td><c:out value="${g.groupTitle }"/></td>
						<td><c:out value="${g.groupMaster }"/></td>
						<%-- <td><c:out value="${g.groupFileUpload }" /></td>
						<td><c:out value="${g.groupTitle }" /></td> --%>

						<td><button id="btn-groupinit" class="btn cancelBtn mb-1"
								onclick="<%-- location.assign('${path}/group/groupJoin.do?groupSeq='+${g.groupSeq }) --%>
								javascript:moveFn('${g.groupSeq}');">입장</button></td>
					</tr>
				</tbody>

			</c:forEach>

		</table>
		


		<!-- 인기 있는 소모임 리스트 -->
		<h4 class="mainColor tway ml-3">인기 있는 소모임</h4>
		<div id="demo" class="carousel slide" data-ride="carousel" style="margin-bottom: 70px" data-interval="15000">

		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active" style="background-color: #2ac1bc"></li>
		    <li data-target="#demo" data-slide-to="1 " style="background-color: #2ac1bc"></li>
		    <li data-target="#demo" data-slide-to="2" style="background-color: #2ac1bc"></li>
		  </ul>
		
		
		
		  <!-- The slideshow -->
		  <div class="carousel-inner d-flex  align-content-center" style="height: 300px; background-color: #F2F2F2; border-radius: 10px; padding-top: 30px; ">
		    <div class="carousel-item active " style=" height: 200px;" >
		     <div class="d-flex justify-content-around" style="width: 100%;">
				<c:forEach var="g" items="${list3 }" begin="0" end="2">
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFn('${g.groupSeq}');">
							<img src="<%=request.getContextPath() %>/resources/upload/group/${g.groupFileUpload } " width="100%;" height="80%"/>
							<p class="list_container_tit text-center small" style="overflow: hidden width:100px">소모임 이름 : ${g.groupTitle }</p>
							<p class="list_container_limit text-center small" style="overflow: hidden width:100px">제한 인원 : ${g.groupLimit }</p>
						</div>
				</c:forEach>			
			 </div>
		    </div>
		    <div class="carousel-item "  style=" height: 200px;">
		     <div class="d-flex justify-content-around"  style="width: 100% ">
				<c:forEach var="g" items="${list3 }" begin="3" end="5">
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFn('${g.groupSeq}');">
							<img src="${pageContext.request.contextPath}/resources/upload/group/${g.groupFileUpload } " width="100%;" height="80%"/>
							<p class="list_container_tit text-center small" style="overflow: hidden width:100px">소모임 이름 : ${g.groupTitle }</p>
							<p class="list_container_limit text-center small" style="overflow: hidden width:100px">제한 인원 : ${g.groupLimit }</p>
						</div>
				</c:forEach>	
			 </div>
		    </div>
		    <div class="carousel-item "  style=" height: 200px;">
		     <div class="d-flex justify-content-around"  style="width: 100% ">
				<c:forEach var="g" items="${list3 }" begin="6" end="8">
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFn('${g.groupSeq}');">
							<img src="${pageContext.request.contextPath}/resources/upload/group/${g.groupFileUpload } " width="100%;" height="80%"/>
							<p class="list_container_tit text-center small" style="overflow: hidden width:100px">소모임 이름 : ${g.groupTitle }</p>
							<p class="list_container_limit text-center small" style="overflow: hidden width:100px">제한 인원 : ${g.groupLimit }</p>
						</div>
				</c:forEach>	
			 </div>
		    </div>
		  </div>
		
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev" style="width: 30px">
		    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="30px">
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next" style="width: 30px">
		    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="30px">
		  </a>
		
		</div>
		
		


		<!-- 새로 생긴 소모임 리스트 -->
		<h4 class="mainColor tway ml-3">새로 생긴 소모임</h4>
		<div id="demonew" class="carousel slide" data-ride="carousel" style="margin-bottom: 70px" data-interval="10000">

		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active" style="background-color: #2ac1bc"></li>
		    <li data-target="#demo" data-slide-to="1 " style="background-color: #2ac1bc"></li>
		    <li data-target="#demo" data-slide-to="2" style="background-color: #2ac1bc"></li>
		  </ul>
		
		
		
		  <!-- The slideshow -->
		  <div class="carousel-inner d-flex  align-content-center" style="height: 300px; background-color: #F2F2F2; border-radius: 10px; padding-top: 30px;">
		    <div class="carousel-item active " style=" height: 200px;" >
		     <div class="d-flex justify-content-around" style="width: 100%; height: 100%">
				<c:forEach var="g" items="${list4 }" begin="0" end="2">
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFn('${g.groupSeq}');">
							<img src="<%=request.getContextPath() %>/resources/upload/group/${g.groupFileUpload } " width="100%;" height="80%"/>
							<p class="list_container_tit text-center small" style="overflow: hidden width:100px">소모임 이름 : ${g.groupTitle }</p>
							<p class="list_container_limit text-center small" style="overflow: hidden width:100px">제한 인원 : ${g.groupLimit }</p>
						</div>
				</c:forEach>			
			 </div>
		    </div>
		    <div class="carousel-item "  style=" height: 200px;">
		     <div class="d-flex justify-content-around"  style="width: 100% ">
				<c:forEach var="g" items="${list4 }" begin="3" end="5">
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFn('${g.groupSeq}');">
							<img src="${pageContext.request.contextPath}/resources/upload/group/${g.groupFileUpload } " width="100%;" height="80%"/>
							<p class="list_container_tit text-center small" style="overflow: hidden width:100px">소모임 이름 : ${g.groupTitle }</p>
							<p class="list_container_limit text-center small" style="overflow: hidden width:100px">제한 인원 : ${g.groupLimit }</p>
						</div>
				</c:forEach>	
			 </div>
		    </div>
		    <div class="carousel-item "  style=" height: 200px;">
		     <div class="d-flex justify-content-around"  style="width: 100% ">
				<c:forEach var="g" items="${list4 }" begin="6" end="8">
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%; " onclick="moveFn('${g.groupSeq}');">
							<img src="${pageContext.request.contextPath}/resources/upload/group/${g.groupFileUpload } " width="100%;" height="80%"/>
							<p class="list_container_tit text-center small" style="overflow: hidden width:100px">소모임 이름 : ${g.groupTitle }</p>
							<p class="list_container_limit text-center small" style="overflow: hidden width:100px">제한 인원 : ${g.groupLimit }</p>
						</div>
				</c:forEach>	
			 </div>
		    </div>
		  </div>
		
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demonew" data-slide="prev" style="width: 30px">
		    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="30px">
		  </a>
		  <a class="carousel-control-next" href="#demonew" data-slide="next" style="width: 30px">
		    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="30px">
		  </a>
		
		</div>
		<!-- 인기 카테고리 리스트 -->
		<h4 class="mainColor tway ml-3">카테고리</h4>
		<div id="democate" class="carousel slide" data-ride="carousel" style="margin-bottom: 70px">

		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active" style="background-color: #2ac1bc"></li>
		    <li data-target="#demo" data-slide-to="1 " style="background-color: #2ac1bc"></li>
		    
		  </ul>
		
		
		
		  <!-- The slideshow -->
		  <div class="carousel-inner d-flex  align-content-center" style="height: 300px;" data-interval="20000">
		    <div class="carousel-item active " style=" height: 250px;" >
		     <div class="d-flex justify-content-around" style="width: 100%; height: 100%">
				<c:forEach var="c" items="${listcate }" begin="0" end="3">
					
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFnCate('${g.groupSeq}');">
							<c:choose>
								<c:when test="${c.groupCategoryName=='게임'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/game.png"
									onclick="location.assign('${path}/group/game')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='운동'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/gym.png"
									onclick="location.assign('${path}/group/gym')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='요리'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/cook.png"
									onclick="location.assign('${path}/group/cook')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='맛집'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/restaurant.png"
									onclick="location.assign('${path}/group/resturant')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='영화'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/movie.png"
									onclick="location.assign('${path}/group/movie')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='코딩'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/coding.png"
									onclick="location.assign('${path}/group/coding')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='쇼핑'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/shopping.png"
									onclick="location.assign('${path}/group/shopping')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='독서'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/read.png"
									onclick="location.assign('${path}/group/read')" style="width:100px; height: 100px;"/>
								</c:when>
							</c:choose>
							<p class="list_container_tit text-center medium" style="overflow: hidden">${c.groupCategoryName  }</p>
							
						</div>
				</c:forEach>			
			 </div>
		    </div>
		   <%--  <div class="carousel-item  "  style=" height: 250px;">
		     <div class="d-flex justify-content-around align-content-center"  style="width: 100% ">
				<c:forEach var="c" items="${listcate }" begin="4" end="7">
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFnCate('${g.groupSeq}');">
							<c:choose>
								<c:when test="${c.groupCategoryName=='게임'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/game.png"
									onclick="location.assign('${path}/group/game')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='운동'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/gym.png"
									onclick="location.assign('${path}/group/gym')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='요리'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/cook.png"
									onclick="location.assign('${path}/group/cook')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='맛집'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/restaurant.png"
									onclick="location.assign('${path}/group/resturant')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='영화'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/movie.png"
									onclick="location.assign('${path}/group/movie')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='코딩'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/coding.png"
									onclick="location.assign('${path}/group/coding')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='쇼핑'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/shopping.png"
									onclick="location.assign('${path}/group/shopping')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='독서'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/read.png"
									onclick="location.assign('${path}/group/read')" style="width:100px; height: 100px;"/>
								</c:when>
							</c:choose>
							<p class="list_container_tit text-center medium" style="overflow: hidden">${c.groupCategoryName }</p>
						</div>
				</c:forEach>	
			 </div>
		    </div> --%>
		    <div class="carousel-item " style=" height: 250px;" >
		     <div class="d-flex justify-content-around" style="width: 100%; height: 100%">
				<c:forEach var="c" items="${listcate }" begin="4" end="7">
					
						<div class="group cursor d-flex flex-column justify-content-center align-itmes-center" style="width: 15%;" onclick="moveFnCate('${g.groupSeq}');">
							<c:choose>
								<c:when test="${c.groupCategoryName=='게임'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/game.png"
									onclick="location.assign('${path}/group/game')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='운동'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/gym.png"
									onclick="location.assign('${path}/group/gym')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='요리'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/cook.png"
									onclick="location.assign('${path}/group/cook')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='맛집'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/restaurant.png"
									onclick="location.assign('${path}/group/resturant')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='영화'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/movie.png"
									onclick="location.assign('${path}/group/movie')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='코딩'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/coding.png"
									onclick="location.assign('${path}/group/coding')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='쇼핑'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/shopping.png"
									onclick="location.assign('${path}/group/shopping')" style="width:100px; height: 100px;"/>
								</c:when>
								<c:when test="${c.groupCategoryName=='독서'}">
									<img src="<%=request.getContextPath() %>/resources/upload/group/group_category/read.png"
									onclick="location.assign('${path}/group/read')" style="width:100px; height: 100px;"/>
								</c:when>
							</c:choose>
							<p class="list_container_tit text-center medium" style="overflow: hidden">${c.groupCategoryName  }</p>
							
						</div>
				</c:forEach>			
			 </div>
		    </div>
		  </div>
		
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#democate" data-slide="prev" style="width: 30px">
		    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="30px">
		  </a>
		  <a class="carousel-control-next" href="#democate" data-slide="next" style="width: 30px">
		    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="30px">
		  </a>
		
		</div>
<style>
table a{
	text-decoration: none;
	color:black;
}
</style>
		<!-- 소모임 전체 보기 리스트 -->
		<h4 class="mainColor tway ml-3">소모임</h4>
		<table id="tbl-nomal-group" class="table table-hover">
			<thead>
				<tr>
					<th class="small">번호</th>
	   				<th class="small">분류</th>
	   				<th class="small" >제목</th>
	   				<th class="small" >인원</th>
	   				<th class="small" >성별</th>
	   				<th class="small" >연령</th>
	   				<th class="small">방장</th>
	   				<th class="small">생성일</th>
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
	
		<button id="btn-more-group" class="btn cancelBtn"
			onclick="location.assign('${path}/group/groupListAll.do')">더보기
		</button>
	</div>


	</div>
	</div>
</section>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>

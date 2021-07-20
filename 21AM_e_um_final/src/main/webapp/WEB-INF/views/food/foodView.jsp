<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	.foodView-info-container {
		border : 1px solid blue;
		margin : 10px;
	}
	.foodView-info-container table tr td:first-child {
		color : gray;
	}
	
	.foodView-image-container{
		height : 200px;
	}
	
	.foodView-menu-container {
		border : 1px solid blue;
		margin : 10px;
		padding : 10px;
	}
	
	.foodView-inner-contents {
		width : 90%;
		float : left;
	}
	
	.foodView-inner-sideMenu {
		width : 100px;
		float : right;
	}
</style>

<main class="foodView-main">
		<!-- 사진 영역 -->
			<div class="foodView-image-container">
				메뉴이미지 + 리뷰이미지로 채우기 ( 캐러셀?)
				<%-- <c:forEach var="img" items="${ food.menus }"> --%>
				<c:forEach begin="1" end="3">
					<img width="200px" height="200px" src="${ path }/resources/upload/food/${img.menuPhoto}">
					
				</c:forEach>
			</div>
			
		<div id="foodView-outter-container">
			<div class="foodView-inner-contents">
			<!-- 정보 영역 --> 
				<div class="foodView-info-container">
					<span><c:out value="${ food.foodName }"/></span><c:out value="${ food.foodStar }"/>숫자와 별모양으로 출력
					<p>조회수, 리뷰수, 좋아요수 <c:out value="${ food.foodLikeCount }"/></p>
				</div>
			
				<div class="foodView-info-container">
					
					<table>
						<tr>
							<td>주소</td>
							<td><c:out value="${ food.foodAddr }"/> ( 주소 2종류 할까? )</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><c:out value="${ food.foodCall }"/></td>
						</tr>
						<tr>
							<td>음식종류</td>
							<td><c:out value="${ food.foodCategoryMain }"/> | <c:out value="${ food.foodCategorySub }"/></td>
						</tr>
						<tr>
							<td>가격대</td>
							<td>가격대 조건잡아서주기 <c:out value="${ food.foodPrice }"/></td>
						</tr>
						<tr>
							<td>영업시간</td>
							<td><c:out value="${ food.foodTimeFirst} - ${ food.foodTimeLast }"/></td>
						</tr>
					</table>
				</div>
				
				<div class="foodView-info-container">
					<table>
						<tr>
							<td>식당 소개</td>
							<td><c:out value="${ food.foodContents }"/></td>
						</tr>
					</table>
				</div>
			
			<!-- 메뉴 영역 --> 
			<div class="foodView-menu-container">
				<p>대표 메뉴</p>
				<div class="row">
						<c:forEach var="menu" items="${ food.menus }">
							<div class="col-6 col-md-4 item">
								<img width="100px" height="100px" src="${ path }/resources/upload/food/${ menu.menuPhoto}">
								<div style="display : inline;">
									<span><c:out value="${ menu.menuName }"/></span>
									<span><c:out value="${ menu.menuPrice }"/></span>
								</div>
								<%-- <p><c:out value="${ menu.menuName }"/></p>
								<p><c:out value="${ menu.menuPrice }"/></p> --%>
							</div>
						</c:forEach>
				</div>
			</div>
			
			<!-- 지도API 영역 -->
			<div class="">
					
			</div>
			
			<!-- 리뷰 영역 -->
			<div class="">
				<p>리뷰(n개)</p>
				<%-- <c:forEach var="" items=""> --%>
				<c:forEach begin="1" end="10">
					<div>
						ldfkj;dlkfj;ladskjfl;ksjdlfj
					</div>
				</c:forEach>
			</div>
			
		</div> <!-- foodView-contents 끝 -->
		
		<div class="foodView-inner-sideMenu">
			<ul>
				<li>a</li>
				<li>b</li>
				<li>c</li>
				<li>d</li>
			</ul>
		</div>
	</div>
	
</main>

</body>
</html>
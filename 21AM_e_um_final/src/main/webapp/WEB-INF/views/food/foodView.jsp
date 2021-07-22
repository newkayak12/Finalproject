<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section class="mt-5 pt-5">

	<div id="root" class="container mt-5">
	
		<div class="foodView-image-container">
			메뉴이미지 + 리뷰이미지로 채우기 ( 캐러셀?)
			<c:forEach begin="1" end="3">
				<img width="200px" height="200px" src="${ path }/resources/upload/food/${img.menuPhoto}">
			</c:forEach>
		</div>
	
		<div id="foodView-outter-container">
		
			<div class="foodView-inner-contents">
			
				<!-- 이름 영역 -->
				<div style="display:flex; justify-content:space-between;">
				
					<div class="foodView-info-container">
						<span class=""><c:out value="${ food.foodName }"/></span> <c:out value="${ food.foodStar }"/>숫자와 별모양으로 출력
							<p>조회수, 리뷰수, 좋아요수 <c:out value="${ food.foodLikeCount }"/></p>
					</div>
					
					<div class=" foodView-info-container foodView-icons">
						<%-- <div class="foodView-icons-inner"><a href="${ path }/food/foodBooking/first?foodSeq=${ food.foodSeq }&userId=${}"><div style="font-size:50px;">💛</div><span class=" ">가고싶다</span></a></div>
						<div class="foodView-icons-inner"><a href="${ path }/food/foodReview/first?foodSeq=${ food.foodSeq }&userId=${}"><div style="font-size:50px;">✏</div><span class=" ">리뷰쓰기</span></a></div> --%>
						<div class="foodView-icons-inner"><a href=""><div style="font-size:50px;">💛</div><span class=" ">가고싶다</span></a></div>
						<div class="foodView-icons-inner"><a href="${ path }/food/foodBooking/start?foodSeq=${ food.foodSeq }"><div style="font-size:50px;">📅</div><span class=" ">예약하기</span></a></div>
						<div class="foodView-icons-inner"><a href="${ path }/food/foodReview/start?foodSeq=${ food.foodSeq }"><div style="font-size:50px;">✏️</div><span class=" ">리뷰쓰기</span></a></div>
					</div>
					
				</div>
				
				
				<!-- 정보 영역 -->
				<div class="foodView-info-container">
				
					<table>
						<tr>
							<td class="">주소</td>
							<td class=""><c:out value="${ food.foodAddr }"/> ( 주소 2종류 할까? )</td>
						</tr>
						<tr>
							<td class="">전화번호</td>
							<td class=""><c:out value="${ food.foodCall }"/></td>
						</tr>
						<tr>
							<td class="">음식종류</td>
							<td class=""><c:out value="${ food.foodCategoryMain }"/> | <c:out value="${ food.foodCategorySub }"/></td>
						</tr>
						<tr>
							<td class="">가격대</td>
							<td class="">가격대 조건잡아서주기 <c:out value="${ food.foodPrice }"/></td>
						</tr>
						<tr>
							<td class="">영업시간</td>
							<td class=""><c:out value="${ food.foodTimeFirst} - ${ food.foodTimeLast }"/></td>
						</tr>
					</table>
				</div>
				
				<!-- 소개 영역 -->
				<div class="foodView-info-container">
					<table>
						<tr>
							<td class="">식당 소개</td>
							<td class=""><c:out value="${ food.foodContents }"/></td>
						</tr>
					</table>
				</div>
				
				<!-- 메뉴 영역 -->
				<div class="foodView-menu-container">
					<p class="">대표 메뉴</p>
					<div class="row">
						<c:forEach var="menu" items="${ food.menus }">
							<div class="col-6 col-md-4 item">
								<img width="100px" height="100px" src="${ path }/resources/upload/food/${ menu.menuPhoto}">
								<div style="display : inline;">
									<span class=""><c:out value="${ menu.menuName }"/></span>
									<span class=""><c:out value="${ menu.menuPrice }"/></span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				<!-- 지도 영역 -->
				<div class="">
				</div>
				
				<!-- 리뷰 영역 -->
				<div class="">
					<p>리뷰(n개)</p>
					<%-- <c:forEach var="" items=""> --%>
					<c:forEach begin="1" end="10">
						<div>
						</div>
					</c:forEach>
				</div>
				
			</div>
		
		</div>
	
	</div>
	
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

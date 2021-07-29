<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	/*  foodView  */
	.foodView-info-container { border : 1px solid blue; margin : 10px; }
	.foodView-info-container table tr td:first-child { color : gray; }
	.foodView-image-container{ height : 200px; }
	.foodView-menu-container { border : 1px solid blue; margin : 10px; padding : 10px; }
	.foodView-inner-sideMenu { width : 100px; float : right; }
	.foodView-icons { display: flex; justify-content: flex-end; }
	.foodView-icons-inner { margin : 10px; }
	.foodView-icons-inner a:hover { color : #70b3d9; font-weight: 500; }
	.font-twayair { font-family: twayair; }
	.foodView-main a { text-decoration: none; color: black;}
</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<%-- <div class="foodView-image-container">
			메뉴이미지 + 리뷰이미지로 채우기 ( 캐러셀?)
			<c:forEach begin="1" end="3">
				<img width="200px" height="200px" src="${ path }/resources/upload/food/${img.menuPhoto}">
			</c:forEach>
		</div> --%>
	
		<div id="foodView-outter-container">
		
			<div class="foodView-inner-contents">
			
				<!-- 이름 영역 -->
				<div style="display:flex; justify-content:space-between;">
				
					<div class="foodView-info-container">
						<span class=""><c:out value="${ food.foodName }"/></span> <c:out value="${ food.foodStar }"/>숫자와 별모양으로 출력
							<p>조회수, 리뷰수, 좋아요수 <c:out value="${ food.foodLikeCount }"/></p>
					</div>
					
					<div class=" foodView-info-container foodView-icons" style="display:flex;">
						<%-- <div class="foodView-icons-inner"><a href="${ path }/food/foodBooking/first?foodSeq=${ food.foodSeq }&userId=${}"><div style="font-size:50px;">💛</div><span class=" ">가고싶다</span></a></div>
						<div class="foodView-icons-inner"><a href="${ path }/food/foodReview/first?foodSeq=${ food.foodSeq }&userId=${}"><div style="font-size:50px;">✏</div><span class=" ">리뷰쓰기</span></a></div> --%>
						<div class="foodView-icons-inner ml-3 mr-3"><a href=""><div style="font-size:50px;">💛</div><span class=" ">가고싶다</span></a></div>
						<c:if test="${ food.foodCategoryMain != '카페/디저트' }">
							<div class="foodView-icons-inner ml-3 mr-3"><a href="${ path }/food/foodBooking/start?foodSeq=${ food.foodSeq }"><div style="font-size:50px;">📅</div><span class=" ">예약하기</span></a></div>
						</c:if>
						<div class="foodView-icons-inner ml-3 mr-3"><a href="${ path }/food/foodReview/start?foodSeq=${ food.foodSeq }"><div style="font-size:50px;">✏️</div><span class=" ">리뷰쓰기</span></a></div>
					</div>
					
				</div>
				
				
				<!-- 정보 영역 -->
				<div class="foodView-info-container">
				
					<table>
						<tr>
							<td class="">주소</td>
							<td class=""><c:out value="${ food.foodAddr }"/></td>
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
								<img style="border-radius: 10px;" width="100px" height="100px" src="${ path }/resources/upload/food/${ menu.menuPhoto}">
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
				<div id="foodView-review-container">
				</div>
				
			</div>
		
		</div>
	
	</div>
</section>

<script>
	$(function() {
		$.ajax({
			url : "${path}/food/selectFoodCommentList",
			data : {
				"foodSeq" : "${food.foodSeq}"
			},
			success : data => {
				console.log(data);
				$("#foodView-review-container").append(data);
			}
		});
	});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

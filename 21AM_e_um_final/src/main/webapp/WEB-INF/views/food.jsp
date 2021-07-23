<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	/* 조건펼치기 버튼 */
	#showFoodSearchCondition {
		background-color: #70b3d9;
	
	}
	
	/* 보였다안보였다하는 검색 조건 div  */
	#foodSearch-condition {
		display: none;
		background-color: #70b3d9;
		width:700px;
		 height:500px;
	}
	#foodSearchCategoryTitle {
		display: block;
	}
</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<div>
		
			<div class="search-container">
				<form>
					<!-- 검색창, 검색버튼, 검색조건펼치기버튼 -->
					<input class="col-8 col-md-6 form-control" style="display:inline;" size="20" type="search" name="searchKeyword" placeholder="지역, 식당, 음식으로 검색해보세요" >
					<button class="btn" type="submit" class="btn" style="background-color: #70b3d9;">검색</button>
					<button class="btn" type="button" class="btn" id="showFoodSearchCondition">조건 ▾</button>
					
					<!-- 보였다안보였다하는 검색 조건 div -->
					<div id="foodSearch-condition">
						
						<div id="foodSearchCategory1">
							<span id="foodSearchCategoryTitle">가격대</span>
							<span>1만원미만</span><span>2만원-3만원</span><span>3만원-4만원</span><span>4만원-5만원</span><span>5만원이상</span><span>7만원이상</span><span>10만원이상</span>
						</div>
						
						<div id="foodSearchCategory2">
							<span id="foodSearchCategoryTitle">분류</span>
						</div>
						
						<div id="foodSearchCategory3">
							<span id="foodSearchCategoryTitle">음식종류</span>
						</div>
						
						<div id="foodSearchCategory4">
							<span id="foodSearchCategoryTitle">지역</span>
							<span>강남구</span><span>마포구</span><span>용산</span><span>연남</span><span>종로</span>
							<span>성동구</span><span>성수</span><span>이태원</span><span>망원</span><span>송파</span>
							<span>청담</span><span>잠실</span><span>이태원</span><span>망원</span><span>송파</span>
						</div>
						
						<div id="foodSearchCategory5">
							<span id="foodSearchCategoryTitle">평점</span>
							<span>1점이상</span><span>2점이상</span><span>3점이상</span><span>4점이상</span><span>5점이상</span>
						</div>
						
					</div>
					
				</form>
			</div>
			
			<button class="btn btn-primary" onclick="location.href='${applicationScope.path}/food/foodForm/start'">맛집등록</button>
			<button class="btn btn-primary" onclick="location.href='${applicationScope.path}/food/foodBookingView?userId=${session.userId }'">내예약내역</button>
		
		</div>
		
		<div class="features-boxed">
		
			<div class="container">
			
				<h3 class="">평점이 높은 맛집</h3>
				
				<div id="" class="row justify-content-center features">
				
					<c:forEach items="${ list }" var="f">
					
						<div class="col-6 col-md-3 item">
						
							<div class="box">
							
								<a id="open_food_modal" href="#" onclick="fn_foodmodal('${ f.foodSeq }')" data-target="#myModal" data-toggle="modal">
									
									<div>
										<img width="200px" height="200px" src="${ path }/resources/upload/food/${f.menus[0].menuPhoto}">
										<div class="info">
											<span class="title"><c:out value="${ f.foodName }"/></span>
											<strong class="search_point "><c:out value="${ f.foodStar }"/></strong>
											<p class="etc"><c:out value="${fn:substring(f.foodAddr, 4, 6)}"/>&nbsp;<c:out value="${ f.foodCategoryMain }"/></p>
										</div>
									</div>
								</a>
								
							</div> <!-- box -->
							
							
						</div>
						
					</c:forEach>
					
				</div>
				
			</div> <!--container-->
		
		</div> <!-- features-boxed -->

		<!-- 모달창 -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
			
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<div class="modal-body">
						<div id="modal-content">
							<img class="mr-3" style="float:left;" width="200px" height="200px" src="">
							<div class="modal-info">
								<p></p> <!-- 대분류 -->
								<h5></h5> <!-- 맛집이름 -->
								<p></p> <!-- 주소 -->
								<p></p> <!-- 전화번호 -->
								<p></p> <!-- 영업시간 -->
								<p></p> <!-- 별점 -->
								<input type="hidden" value="">
							</div>
						</div>
					</div>
			
					<div class="modal-footer">
						<button type="button" class="btn" style="border: 1px solid #70b3d9;" onclick="fn_foodBooking();">예약하기</button>
						<button type="button" class="btn" style="background-color: #70b3d9;" onclick="fn_foodView();">상세보기</button>
					</div>
			
				</div>
			</div>
		</div>


	</div>
	
	<!-- <div>
		<a id="MOVE_TOP_BTN" href="#"><div>TOP</div></a>
	</div> -->
</section>



<script>

	// 모달열기 함수 
	const fn_foodmodal=(seq)=>{
		$.ajax({
			url : "${ path }/food/foodModal",
			data : {"foodSeq":seq},
			success : data => {
				console.log(data);
				$("#modal-content").find("img").attr("src", "${ path }/resources/upload/food/" + data.menus[0].menuPhoto);
				$("#modal-content").find("p").first().text(data.foodCategoryMain);
				$("#modal-content").find("h5").text(data.foodName);
				$("#modal-content").find("p").eq(1).text(data.foodAddr);
				$("#modal-content").find("p").eq(2).text(data.foodCall);
				$("#modal-content").find("p").eq(3).text(data.foodTimeFirst.concat(' ~ ', data.foodTimeLast));
				$("#modal-content").find("p").eq(4).text(data.foodStar);
				$("#modal-content").find("input").attr("value", data.foodSeq);
			}
		})
	}
	
	
	// 상세보기페이지로 전환
	const fn_foodView = () => {
		// 맛집 시퀀스 가져오기 
		let foodSeq = $("#modal-content").find("input").val();
		// console.log(foodSeq);
		location.assign("${path}/food/foodView?foodSeq=" + foodSeq);
	}
	
	
	// 예약페이지로 전환
	const fn_foodBooking = () => {
		
		let foodSeq = $("#modal-content").find("input").val();
		
		location.assign('${ path }/food/foodBooking/start?foodSeq=' + foodSeq);
	}
	
	
	// top버튼 
	/* $(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});
		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
				}, 400);
			return false;
		});
	}); */
	
	
	// 검색조건 열기 
	$("#showFoodSearchCondition").click( (e) => {
		$("#foodSearch-condition").slideToggle();
	} );
	
	
	// 검색카테고리 출력하기위해 데이터 가져옴 
	$(function() {
		$.ajax({
			url: "${path}/food/selectFoodCategoryList",
			success: data => {
				for(let i=0; i < data.CategoryMainList.length; i++) {
					$("#foodSearchCategory2").append($("<span>").text(data.CategoryMainList[i]));
				} 
				for(let i=0; i < data.CategorySubList.length; i++) {
					$("#foodSearchCategory3").append($("<span>").text(data.CategorySubList[i]));
				} 
			}
		})
	});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

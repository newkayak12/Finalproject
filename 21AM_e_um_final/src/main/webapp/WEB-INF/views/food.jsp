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
		border: 1px solid #70b3d9;
		/* width: ; */
		/* height:500px; */
	}
	#foodSearchCategoryTitle {
		display: block;
		font-weight: 900;
		margin: 10px 10px 5px 10px;
	}
	
	#foodSearch-condition input[type=radio] {
		display: none;
	}
	
	#foodSearch-condition input[type=radio]:checked+label {
		background-color: #70b3d9;
		font-weight: 900;
	}
	
	#foodSearch-condition input[type=radio]+label{
		border: 1px solid #70b3d9;
		border-radius: 20px;
		padding: 5px 12px;
		margin: 5px;
	}
	
	/* 선택된 검색조건 */
	.selected {
		background-color: #70b3d9;
		font-weight: 900;
	}
</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<div>
		
			<div class="search-container col-12">
				<form action="" method="" class="col-12">
					<!-- 검색창, 검색버튼, 검색조건펼치기버튼 -->
					<input class="col-8 col-md-6 form-control" id="foodSearchKeyword" style="display:inline;" size="20" type="search" name="searchKeyword" placeholder="지역, 식당, 음식으로 검색해보세요" >
					<button class="btn" type="button" id="foodSearchButton" style="background-color: #70b3d9;">검색</button>
					<button class="btn" type="button" id="showFoodSearchCondition">조건 ▾</button>
					<button class="btn" type="button" id="clearFoodSearchCondition">조건 초기화</button>
					
					<!-- 보였다안보였다하는 검색 조건 div -->
					<div id="foodSearch-condition" class="p-3">
						
						<!-- 조건1. 가격대 -->
						<div id="foodSearchCategoryTitle">1인당 가격</div>
						<div id="foodSearchCategory1" class="row col-12">
							<input type="radio" class="m-1 foodPriceCon" name="fsc1" id="foodPriceCon1" value="1만원미만">
							<label class="" for="foodPriceCon1">1만원미만</label>
							<input type="radio" class="m-1 foodPriceCon" name="fsc1" id="foodPriceCon2" value="1만원대">
							<label class="" for="foodPriceCon2">1만원대</label>
							<input type="radio" class="m-1 foodPriceCon" name="fsc1" id="foodPriceCon3" value="2만원대">
							<label class="" for="foodPriceCon3">2만원대</label>
							<input type="radio" class="m-1 foodPriceCon" name="fsc1" id="foodPriceCon5" value="3만원이상">
							<label class="" for="foodPriceCon5">3만원이상</label>
							
						</div>
						
						<!-- 조건2. 대분류 -->
						<div id="foodSearchCategoryTitle">음식종류</div>
						<div id="foodSearchCategory2" class="row col-12"></div>
						
						<!-- 조건3. 지역 -->
						<div id="foodSearchCategoryTitle">지역</div>
						<div id="foodSearchCategory3" class="row col-12">
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon1" value="강남">
							<label class="" for="foodPriceCon1">강남</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon2" value="마포">
							<label class="" for="foodPriceCon1">마포</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon3" value="용산">
							<label class="" for="foodPriceCon1">용산</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon4" value="연남">
							<label class="" for="foodPriceCon1">연남</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon5" value="종로">
							<label class="" for="foodPriceCon1">종로</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon6" value="성수">
							<label class="" for="foodPriceCon1">성수</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon7" value="이태원">
							<label class="" for="foodPriceCon1">이태원</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon8" value="송파">
							<label class="" for="foodPriceCon1">송파</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon9" value="망원">
							<label class="" for="foodPriceCon1">망원</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon10" value="청담">
							<label class="" for="foodPriceCon1">청담</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon1" value="잠실">
							<label class="" for="foodPriceCon1">잠실</label>
						</div>
						
						<!-- 조건4. 평점 -->
						<div id="foodSearchCategoryTitle">평점</div>
						<div id="foodSearchCategory4" class="row col-12">
							<button type="button" class="m-1 btn fchoice foodStarCon">1점이상</button>
							<button type="button" class="m-1 btn fchoice foodStarCon">2점이상</button>
							<button type="button" class="m-1 btn fchoice foodStarCon">3점이상</button>
							<button type="button" class="m-1 btn fchoice foodStarCon">4점이상</button>
							<button type="button" class="m-1 btn fchoice foodStarCon">5점이상</button>
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
	
	<div>
		<a id="MOVE_TOP_BTN" href="#"><div>TOP</div></a>
	</div>
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
	$(function() {
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
	});
	
	
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
					$("#foodSearchCategory2").append($("<input>").attr({
						"class" : "m-1 btn fchoice foodCateMainCon",
						"type" : "radio",
						"id":"foodCateMainCon"+i,
						"onclick":"fn_btnTest("+'foodCateMainCon'+i+")"
						}).text(data.CategoryMainList[i]));
				}
			}
		})
	});
	
	// 검색 
	$("#foodSearchButton").click( (e) => {
		
		// 검색어
		let foodSearchKeyword = $("#foodSearchKeyword").val();
			console.log(foodSearchKeyword);
		
		
	} );
	
	// 클릭하고 선택한태그만 색깔 바뀌도록 
	$(".fchoice").click( (e) => {
		
		$(e.target).toggleClass("selected");
		
		if($(e.target).hasClass("selected")){
			$(e.target).siblings().find("input").removeClass("selected");
		}
	} );
	
	const fn_btnTest=(e)=>{
		$(e).toggleClass("selected");
		
		if($(e.target).hasClass("selected")){
			$(e.target).siblings().find("button").removeClass("selected");
		}
	}
	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

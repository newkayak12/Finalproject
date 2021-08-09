<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
/* 보였다안보였다하는 검색 조건 div  */
#foodSearch-condition { display: none; border-radius:10px; background-color : #f2f2f2; width: 90%; margin-left : 5%; margin-right : 5%; margin-top : 10px; margin-bottom : 10px; }
/* 검색조건 이름 */
#foodSearchCategoryTitle { display: block; font-weight: 900; margin: 10px 10px 5px 10px; }
/* 조건검색 라디오버튼 */
#foodSearch-condition input[type=radio] { display: none; }
#foodSearch-condition input[type=radio]:hover+label { color: #2AC1BC; border : 2px solid #2AC1BC; font-weight: 900; cursor : pointer; }
#foodSearch-condition input[type=radio]:checked+label {  border : 2px solid #2AC1BC; font-weight: 900; }
#foodSearch-condition input[type=radio]+label{ border: 2px solid lightgray; border-radius: 20px; padding: 5px 12px; margin: 5px; background-color: white; }
/* 선택된 검색조건 */
.selected {  border : 2px solid #2AC1BC; font-weight: 900;  }
/* 필터초기화 버튼 */
#clearFoodSearchCondition { border: 1px solid #2AC1BC; float: right; margin: 10px; background-color: white; }
#clearFoodSearchCondition:hover { background-color: #2AC1BC; }
.mainPageImages { width : 200px; height:150px; border-radius: 10px; object-fit:cover;}
.mainPageFoodName { color : #3a3a3a; font-size : 20px; font-weight:900; }
.mainPageFoodStar { color : #2AC1BC; font-size : 20px; font-weight:900;}
.mainPageFoodAddrCate { color : gray; font-size : 15px; font-weight:900; }
a { text-decoration:none !important } 
a:hover { text-decoration:none !important }

</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<p class="mainColor tway" style="font-size:35px; text-align:center;">맛집 찾기</p>
		<p class="text-center tway">친구랑 같이 갈 맛집을 찾아볼까요?</p>
	
		<div class="mt-1 mb-5">
		
			<div class="search-container col-12">
				<form class="col-12">
					<!-- 검색창, 검색버튼, 검색조건펼치기버튼 -->
					<div style="text-align:center; width:100%;">
						<input class="col-8 col-md-6 form-control" id="foodSearchKeyword" style="display:inline; width:60% !important;" size="20" type="search" name="searchKeyword" placeholder="지역, 식당, 음식으로 검색해보세요" required>
						<button class="btn checkBtn mb-1" type="button" id="foodSearchButton" >검색</button>
						<button class="btn cancelBtn mb-1" type="button" id="showFoodSearchCondition">필터 ☟</button>
					</div>
					<!-- 보였다안보였다하는 검색 조건 div -->
					<div id="foodSearch-condition" class="p-1">
					
						<button class="btn" type="button" id="clearFoodSearchCondition">필터 초기화</button>
						
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
						
						<!-- 조건2. 음식종류 -->
						<div id="foodSearchCategoryTitle">음식종류</div>
						<div id="foodSearchCategory2" class="row col-12"></div>
						
						<!-- 조건3. 지역 -->
						<div id="foodSearchCategoryTitle">지역</div>
						<div id="foodSearchCategory3" class="row col-12">
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon1" value="강남">
							<label class="" for="foodAddrCon1">강남</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon2" value="마포">
							<label class="" for="foodAddrCon2">마포</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon3" value="용산">
							<label class="" for="foodAddrCon3">용산</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon4" value="연남">
							<label class="" for="foodAddrCon4">연남</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon5" value="종로">
							<label class="" for="foodAddrCon5">종로</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon6" value="성수">
							<label class="" for="foodAddrCon6">성수</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon7" value="이태원">
							<label class="" for="foodAddrCon7">이태원</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon8" value="송파">
							<label class="" for="foodAddrCon8">송파</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon9" value="망원">
							<label class="" for="foodAddrCon9">망원</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon10" value="청담">
							<label class="" for="foodAddrCon10">청담</label>
							<input type="radio" class="m-1 foodAddrCon" name="fsc3" id="foodAddrCon11" value="잠실">
							<label class="" for="foodAddrCon11">잠실</label>
						</div>
						
						<!-- 조건4. 평점 -->
						<div id="foodSearchCategoryTitle">평점</div>
						<div id="foodSearchCategory4" class="row col-12">
							<input type="radio" class="m-1 foodStarCon" name="fsc4" id="foodStarCon1" value="1점이상">
							<label class="" for="foodStarCon1">1점이상</label>
							<input type="radio" class="m-1 foodStarCon" name="fsc4" id="foodStarCon2" value="2점이상">
							<label class="" for="foodStarCon2">2점이상</label>
							<input type="radio" class="m-1 foodStarCon" name="fsc4" id="foodStarCon3" value="3점이상">
							<label class="" for="foodStarCon3">3점이상</label>
							<input type="radio" class="m-1 foodStarCon" name="fsc4" id="foodStarCon4" value="4점이상">
							<label class="" for="foodStarCon4">4점이상</label>
						</div>
						
					</div>
					
				</form>
			</div>
		
		</div> <!-- 검색 div -->
		
		<!-- 맛집 리스트 덩어리 들어갈 자리  -->
		<div id="mainFoodList" class="features-boxed">
		
		</div>
		
		<button id="allFoodBtn" class="btn cancelBtn"  onclick="location.assign('${path}/food/allFood');">맛집 전체보기</button>

	</div> <!-- root -->
	

</section>

<!-- 모달창 -->
		<div class="modal" id="foodModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
			
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<div class="modal-body">
						<div id="modal-content">
							<img class="mr-3" style="float:left;" width="200px" height="200px" src="">
							<div class="modal-info">
								<span></span><!-- 대분류 -->
								<br>
								
								<span class="mainColor tway" style="font-size:30px;"></span>&nbsp; <!-- 맛집이름 -->
								<span style="font-size:30px;"></span> <!-- 별점 -->
								<br><br>
								
								<span><i class="fas fa-map-marker-alt"></i></span>&nbsp;
								<span></span> <!-- 주소 -->
								<br>
								
								<span><i class="fas fa-phone"></i></span>&nbsp;
								<span></span> <!-- 전화번호 -->
								<br>
								
								<span><i class="far fa-clock"></i></span>&nbsp;
								<span></span><!-- 영업시간 -->
								<input type="hidden" value="">
							</div>
						</div>
					</div>
			
					<div class="modal-footer">
						<button type="button" id="foodModalBooking" class="btn cancelBtn" onclick="fn_foodBooking();">예약하기</button>
						<button type="button" class="btn checkBtn" onclick="fn_foodView();">상세보기</button>
					</div>
			
				</div>
			</div>
		</div> <!-- 모달 div -->

<script>
	// 모달열기 함수 
	const fn_foodmodal=(seq)=>{
		$.ajax({
			url : "${ path }/food/foodModal",
			data : {"foodSeq":seq},
			success : data => {
				
				$("#modal-content").find("img").attr("src", "${ path }/resources/upload/food/" + data.menus[0].menuPhoto).css({"border-radius":"10px"});
			 	
				let cateMain;
				switch(data.foodCategoryMain) {
					case '한식' : cateMain = '🇰🇷한식'; break;
					case '아메리칸' : cateMain = '🇺🇸아메리칸'; break;
					case '중식' : cateMain = '🇨🇳중식'; break;
					case '일식' : cateMain = '🇯🇵일식'; break;
					case '이탈리안' : cateMain = '🇮🇹이탈리안'; break;
					case '기타' : cateMain = '기타'; break;
					case '주점' : cateMain = '🍺주점'; break;
					case '카페/디저트' : cateMain = '🍰카페/디저트'; break;
					
				}
				
				$("#modal-content").find("span").first().text(cateMain);
				$("#modal-content").find("span").eq(1).text(data.foodName);
				$("#modal-content").find("span").eq(2).text( String(data.foodStar).length == 1 ?  parseInt(data.foodStar).toFixed(1) : data.foodStar );
				
				$("#modal-content").find("span").eq(4).text(data.foodAddr);
				$("#modal-content").find("span").eq(6).text(data.foodCall);
				$("#modal-content").find("span").eq(8).text(data.foodTimeFirst.concat(' ~ ', data.foodTimeLast));
				
				$("#modal-content").find("input").attr("value", data.foodSeq);
				
				
				// 카테고리가 카페/디저트일경우 예약하기 버튼을 숨김
				if( data.foodCategoryMain === "카페/디저트" ) {
					$("#foodModalBooking").css({
						"display" : "none"
					});
				} else {
					$("#foodModalBooking").css({
						"display" : ""
					});
				}
			}
		})
	}
	
	
	// 상세보기페이지로 전환
	const fn_foodView = () => {
		// 맛집 시퀀스 가져오기 
		let foodSeq = $("#modal-content").find("input").val();
		location.assign("${path}/food/foodView?foodSeq=" + foodSeq);
	}
	
	
	// 예약페이지로 전환
	const fn_foodBooking = () => {
		
		let foodSeq = $("#modal-content").find("input").val();
		
		location.assign('${ path }/food/foodBooking/start?foodSeq=' + foodSeq);
	}
	
	
	// 검색조건 열기 
	$("#showFoodSearchCondition").click( (e) => {
		$("#foodSearch-condition").slideToggle();
		$(e.target).text($(e.target).text() == "필터 ☟" ? "필터 ☝" : "필터 ☟");
		
	} );
	
	
	// 검색조건 초기화
	$("#clearFoodSearchCondition").click( (e) => {
		$("#foodSearch-condition input[type=radio]").prop("checked", false);
	} );
	
	// 검색카테고리 출력하기위해 데이터 가져옴 
	$(function() {
		
		$.ajax({
			url: "${path}/food/selectFoodCategoryList",
			success: data => {
				for(let i=0; i < data.CategoryMainList.length; i++) {
					
					$("#foodSearchCategory2").append(
						$("<input>").attr({
							"class" : "m-1 btn fchoice foodCateMainCon",
							"type" : "radio",
							"name" : "fsc2",
							"id":"foodCateMainCon" + i,
							/* "onclick":"fn_btnTest(foodCateMainCon),  */
							"value" : data.CategoryMainList[i]
						}) 
					);
					
					$("#foodSearchCategory2").append(
						$("<label>").attr({
							"for" :"foodCateMainCon" + i
						}).text(data.CategoryMainList[i])
					);
					
				} // for 
			} // success
		}) // ajax
		
		
		// 평점이 높은 맛집, 리뷰가 많은 맛집, 예약이 많은 맛집
		$.ajax({
			url : "${ pageContext.request.contextPath }/food/foodMainList",
			success : data => {
				$("#mainFoodList").append(data);
			}
		});
		
	});
	
	// 검색 
	$("#foodSearchButton").click( (e) => {
		
		// 조건 div 감춤 
		$("#foodSearch-condition").hide();
		
		// 이전 검색결과 div 감춤
		$("#foodSearchResultDiv").css("display", "none");
		
		// 검색어
		let foodSearchKeyword = $("#foodSearchKeyword").val();
		let foodPriceCon = $("input[name='fsc1']:checked").val();
		let foodCateMainCon = $("input[name='fsc2']:checked").val();
		let foodAddrCon = $("input[name='fsc3']:checked").val();
		let foodStarCon = $("input[name='fsc4']:checked").val();
		
		
		// 검색어도 없고, 검색조건도 선택하지 않은 상태에서 검색버튼을 클릭했을때 알림 띄움
 		if(foodSearchKeyword.length == 0 && !foodPriceCon  && !foodCateMainCon && !foodAddrCon && !foodStarCon ) {
			alert("검색어를 입력하거나 검색조건을 선택해주세요");
		} else {
			
			$.ajax({
				url : "${path}/food/foodSearch",
				data : {
					"keyword" : foodSearchKeyword,
					"priceCon" : foodPriceCon,
					"cateMainCon" : foodCateMainCon,
					"addrCon" : foodAddrCon,
					"starCon" : foodStarCon
				},
				success : data => {
					
					// 맛집전체보기 버튼 감춤 
					$("#allFoodBtn").css("display", "none");
					
					console.log(data);
					console.log(data.length);
					
					// 검색결과가 있으면 
					if(data.length != 0) {
						
						$(".features-boxed .container").css({
							"display" : "none"
						});
						
				
						let div = $("<div class='row foodSearchResultItem' style='display:flex;'></div>");
						
						// 바로 이전에 검색한 결과 없애기
						$(".foodSearchResultItem").css("display", "none");
						$("#noResultPtag").css("display", "none");
						
						
						for(let i=0; i < data.length; i++) {
							
							let a = $("<a>").attr({
								"class" : "open_food_modal",
								"href" : "javascript:void(0)",
								"onclick" : "fn_foodmodal('" + data[i].foodSeq + "')",
								"data-target" : "#foodModal",
								"data-toggle" : "modal"
							}).css({
								"display" : "contents",
								"cursor" : "pointer",
								"text-decoration" : "none",
								"color" : "black"
							});
							
							// a태그에 display: contents;  cursor: pointer;
							
							let foodImage = $("<img>").attr({
								"src":"${ path }/resources/upload/food/"+ data[i].menus[0].menuPhoto,
								"class" : "mainPageImages"
								});
							let br = $("<br>");
							
							let foodName = $("<span>").attr({
								"class" : "mainPageFoodName"
							}).css({
								"color" : "#353535",
								"font-size" : "17px",
								"font-weight" : "900"
							}).text(data[i].foodName);
							
							let foodStar = $("<span>").attr({
								"class" : "mainPageFoodStar"
							}).css({
								"color" : "#70b3d9",
								"font-size" : "17px",
								"font-weight" : "900"
							}).text("  " + parseInt(data[i].foodStar).toFixed(1) + " ");
								
							let foodAddrfoodCateMain = $("<p>").attr({
								"class":"mainPageFoodAddrCate"
							}).css({
								"color" : "gray",
								"font-size" : "13px",
								"font-weight" : "900"
							}).text(data[i].foodAddr.substring(0,11) + " - " + data[i].foodCategoryMain);
							
							let infoDiv = $("<div class='info col-6 col-md-3' style='text-align:center;'></div>");
							
							infoDiv.append(foodImage);
							infoDiv.append(br);
							infoDiv.append(foodName);
							infoDiv.append(foodStar);
							infoDiv.append(foodAddrfoodCateMain);
							
							a.append(infoDiv);
							
							div.append(a);
							
							$("#root").append(div);
						}
						
					// 검색결과가 없으면 
					} else {
						
						$(".features-boxed .container").css({
							"display" : "none"
						});
						
						// 바로 이전에 검색한 결과 없애기
						$(".foodSearchResultItem").css("display", "none");
						$("#noResultPtag").css("display", "none");
						
						let result = $("<p>").attr({"id":"noResultPtag", "class":"mt-5"}).css({"text-align":"center", "font-size" : "20px;"}).text("🤭 검색결과가 없네요 🤭");
						$("#root").append(result);
					}
					
					
				}
			});
			
		}
		
 		// 검색조건 초기화 
		$("#foodSearch-condition input[type=radio]").prop("checked", false);
			
		
	} );
	

	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

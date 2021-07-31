<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	/*  foodView  */
	.foodView-info-container { margin : 10px; }
	.foodView-info-container table tr th { color : gray; width:15%; min-width:100px;}
	.foodView-info-container table tr td { color : black; width:85%; }
	
	.foodView-image-container{ height : 200px; }
	.foodView-menu-container { margin : 10px; padding : 10px; }
	.foodView-inner-sideMenu { width : 100px; float : right; }
	
	.foodView-icons { display: flex; justify-content: flex-end; }
	.foodView-icons-inner { margin : 10px; align-self:center; text-decoration: none; color : lightgray ;}
	.foodView-icons-inner:hover {  font-weight: 500 !important; color : #2AC1BC; cursor: pointer;}
	
	.foodView-icons-inner a { text-decoration: none; color : lightgray !important; }
	.foodView-icons-inner a:hover { color : #2AC1BC !important; font-weight: 500 !important; }
	
	.font-twayair { font-family: twayair; }
	.foodView-main a { text-decoration: none; color: black;}
	.lightgray { color : lightgray;}
	.atag { text-decoration: none; color : black !important; font-weight : 900;}
	.foodView-icon-style { font-size:35px; text-align: center; }
	
	
	/* 토스트 메시지 */
	.toast-wrap {
    display: table;
    position: fixed;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    padding: 10px;
    border-radius: 5%;
    z-index: 999;
}
.toast-wrap::after {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height:100%;
    background: #2AC1BC;
    z-index: -1;
    border-radius: 10px;
}
.toast {
    display: table-cell;
    text-align: center;
    vertical-align: middle;
    font-weight: bold;
    font-size: 1.2em;
}
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
						<span class="tway " style="font-size:40px;"><c:out value="${ food.foodName }"/></span>&nbsp;
						<span class="mainColor" style="font-size:40px; font-weight:900;"><c:out value="${ food.foodStar }"/></span>
						<br>
						<span class="lightgray"><i class="fas fa-eye lightgray"></i>&nbsp;<c:out value="${ food.foodLikeCount }"/></span>&nbsp;&nbsp;
						<span class="lightgray"><i class="fas fa-pencil-alt lightgray"></i>&nbsp;<c:out value="${ foodCommentCount }"/></span>&nbsp;&nbsp;
						<span class="lightgray"><i class="fas fa-heart lightgray"></i>&nbsp;<c:out value="${ food.foodLikeCount }"/></span>
					</div>
					
					<div class=" foodView-info-container foodView-icons" style="display:flex;">
					
						<!-- 아이콘1 : 하트 -->
						<%-- <div id="likeicon" class="foodView-icons-inner mr-3" onclick="fn_FoodLike(event);">
							<div class="foodView-icon-style">
								<!-- 로그인한 회원이 이 맛집을 좋아요했다면 로드할때 채워진 하트로 보이도록 --> 
								<c:if test="${ likecheck ne null }">
									<i class="fas fa-heart"></i>
								</c:if>
								<c:if test="${ likecheck eq null }">
									<i class="far fa-heart"></i>
								</c:if>
							</div>
							<span style="font-size:15px; font-weight:900;">가고싶다</span>
						</div> --%>
						
						<!-- 로그인한 회원이 이 맛집을 좋아요했다면 로드할때 채워진 하트로 보이도록 --> 
						<c:if test="${ likecheck ne null }">
						<!-- style="color : #2AC1BC !important; -->
							<div id="likeicon" class="foodView-icons-inner mr-3" " onclick="fn_FoodLike(event);">
								<div class="foodView-icon-style">
									<i class="fas fa-heart" id = "like" style="color : #2AC1BC !important;"></i>
								</div>
								<span style="font-size:15px; font-weight:900;" id="likecontent" style="color : #2AC1BC !important;">가고싶다</span>
							</div>
						</c:if>
						<c:if test="${ likecheck eq null }">
						<!-- style="color : lightgray !important;" -->
							<div id="likeicon" class="foodView-icons-inner mr-3"  onclick="fn_FoodLike(event);">
								<div class="foodView-icon-style">
									<i class="far fa-heart" id = "like" style="color : rgb(201,201,201);"></i>
								</div>
								<span style="font-size:15px; font-weight:900;" id="unlikecontent" style="color : lightgray !important;">가고싶다</span>
							</div>
						</c:if>
						
						
						
						<c:if test="${ food.foodCategoryMain != '카페/디저트' }">
							<!-- 아이콘2 : 캘린더 -->
							<div class="foodView-icons-inner mr-3">
								<a href="${ path }/food/foodBooking/start?foodSeq=${ food.foodSeq }">
									<div class="foodView-icon-style">
										<i class="far fa-calendar-check"></i>
									</div>
									<span style="font-size:15px; font-weight:900;">예약하기</span>
								</a>
							</div>
						</c:if>
						
						<!-- 아이콘3 : 연필 -->
						<div class="foodView-icons-inner mr-3">
							<a href="${ path }/food/foodReview/start?foodSeq=${ food.foodSeq }">
								<div class="foodView-icon-style">
									<i class="fas fa-pencil-alt"></i>
								</div>
								<span style="font-size:15px; font-weight:900;">리뷰쓰기</span>
							</a>
						</div>
					</div>
					
				</div>
				
				
				<!-- 정보 영역 -->
				<div class="foodView-info-container">
				
					<table>
						<tr>
							<th class="">주소</th>
							<td class=""><c:out value="${ food.foodAddr }"/></td>
						</tr>
						<tr>
							<th class="">전화번호</th>
							<td class=""><c:out value="${ food.foodCall }"/></td>
						</tr>
						<tr>
							<th class="">음식 종류</th>
							<td class=""><c:out value="${ food.foodCategoryMain }"/> | <c:out value="${ food.foodCategorySub }"/></td>
						</tr>
						<tr>
							<th class="">가격대</th>
							<td class="">
								<c:choose>
									<c:when test="${ food.foodPrice le 10000 }">1만원 미만</c:when>
									<c:when test="${ food.foodPrice ge 10000 and food.foodPrice lt 20000 }">1만원 - 2만원</c:when>
									<c:when test="${ food.foodPrice ge 20000 and food.foodPrice lt 30000  }">2만원 - 3만원</c:when>
									<c:when test="${ food.foodPrice ge 30000 }">3만원 이상</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th class="">영업시간</th>
							<td class=""><c:out value="${ food.foodTimeFirst} - ${ food.foodTimeLast }"/></td>
						</tr>
						<tr>
							<th class="">웹사이트</th>
							<td class=""><a class="atag" href="${ food.foodUrl }" target="_blank">맛집 홈페이지로 가기</a></td>
						</tr>
						<tr>
							<th class="">식당 소개</th>
							<td class=""><c:out value="${ food.foodContents }"/></td>
						</tr>
					</table>
				</div>
				
				<!-- 메뉴 영역 -->
				<div class="foodView-menu-container">
					<p class="mainColor tway">대표 메뉴</p>
					<div class="row" style="border-top:1px solid #2AC1BC;">
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

<!-- 토스트 메시지 -->
<div id="toast" class="toast-wrap" style="display:none;">
    <div class="toast"></div>
</div>

<script>

	// 토스트 메시지
	var msgTimer = 0;
	
    function showToast(msg) {
        clearToast();

        var toast = $('#toast');

        toast.children().html(msg);
        setTimeout(function() {
            toast.fadeIn(500, function() {
                msgTimer = setTimeout(function() {
                    toast.fadeOut(500);
                }, 1000);
            });
        }, 200);
    }
    
    function clearToast() {
        if(msgTimer != 0) {
            clearTimeout(msgTimer);
            msgTimer = 0;
        }
    }
     
     
	
	$(function() {
		
		// 리뷰 불러오기 
		$.ajax({
			url : "${path}/food/selectFoodCommentList",
			data : {
				"foodSeq" : "${food.foodSeq}"
			},
			success : data => {
				$("#foodView-review-container").append(data);
			}
		});
		
		
	});
	
	// 좋아요(가고싶다)
	const fn_FoodLike = (e) => {
		
		// 빈하트이고 로그인되어있으면 
		if( $(e.target).attr("class") == 'far fa-heart' && `${ session.userId }` != null ) {
			
			// console.log("좋아요 go !!! ");
			$.ajax({
				url : "${path}/food/addFoodLike",
				data : {
					"foodSeq" : "${food.foodSeq}",
					"userId" : "${ session.userId }"
				},
				success : data => {
					console.log(data);
					if(data == 'success') {
						console.log('좋아요추가 됩니까?')
						console.log($(e.target))
						console.log($("#like"))
						//$(e.target).attr("class", "fas fa-heart").css({ "color" : "#2AC1BC !important" });
						$("#like").removeClass("fa fa-heart")
						$("#like").attr("class", "fas fa-heart").css({ "color" : "#2AC1BC !important" });

						
						// 토스트메세지 띄우기 
						showToast("가고싶다 리스트에 추가 완료!");
					}
				}
			});
		
		// 채워진 하트이고 로그인되어있으면 
		} else if( $(e.target).attr("class") == 'fas fa-heart' && `${ session.userId }` != null  ) {
			
			$.ajax({
				url : "${path}/food/delFoodLike",
				data : {
					"foodSeq" : "${food.foodSeq}",
					"userId" : "${ session.userId }"
				},
				success : data => {
					console.log(data);
					if(data == 'success') {
						console.log('좋아요삭제 됩니까?')
						console.log($("#unlike"))
						//$(e.target).attr("class", "far fa-heart").css({ "color" : "lightgray !important" });
						$("#like").removeClass("fas fa-heart")
						$("#like").attr("class", "far fa-heart").css({ "color" : "rgb(201,201,201)" });
						
					}
				}
			});
			
		}
		
		
	}
	
	
	
	/* $("#likeicon").click( (e) => {
        $(e.target).toggleClass("fas"); 
        
     }); */
     
     
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

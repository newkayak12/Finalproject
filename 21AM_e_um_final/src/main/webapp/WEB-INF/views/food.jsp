<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<div>
		
			<div class="search-container">
				<form>
					<input class="col-8 col-md-6 form-control" style="display:inline;" size="20" type="search" name="searchKeyword" placeholder="지역, 식당, 음식으로 검색해보세요" >
					<button class="btn btn-primary" type="submit" class="btn" >검색</button>
					<button class="btn btn-primary" type="button" class="btn" onclick="fn_openCondition();">조건 ▾</button>
				</form>
			</div>
			<button class="btn btn-primary" onclick="location.href='${applicationScope.path}/food/foodForm/start'">맛집등록</button>
		
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
	const fn_openCondition = () => {
		
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

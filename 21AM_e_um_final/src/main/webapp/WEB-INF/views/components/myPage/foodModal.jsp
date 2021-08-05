<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Nav tabs -->
<ul id="foodTab" class="nav nav-tabs nav-fill tway"  role="tablist">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#bookingList">맛집 예약 내역</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#foodLikeList">가고싶은 맛집</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#foodCommentList">내가 쓴 리뷰</a>
    </li>
</ul>

<!-- Tab panes -->


<div class="tab-content my-5">
	
	<!-- 예약내역 -->
	<div class="tab-pane container active" id="bookingList">
		<div class="d-flex flex-column justify-content-center align-items-center">
		
			<table class="table table-hover">
				<colgroup>
					<col class="col-1">
					<col class="col-2">
					<col class="col-3">
					<col class="col-2">
					<col class="col-1">
					<col class="col-2">
					<col class="col-2">
				</colgroup>
				<thead class="thead-light">
					<tr>
						<th class="colcenter">예약번호</th>
						<th class="colcenter">식당명</th>
						<th class="colcenter">주소</th>
						<th class="colcenter">전화번호</th>
						<th class="colcenter">인원</th>
						<th class="colcenter">날짜/시간</th>
						<th class="colcenter">예약 취소</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty foodInfo }">
						<c:forEach var="f" items="${foodInfo }">
							<tr>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f['FOOD_SEQ'] }')">
								${fn:substring(f['FOOD_BOOKING_SEQ'],3,6) }
								</td>
								
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f['FOOD_SEQ'] }')">${f['FOOD_NAME'] }</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f['FOOD_SEQ'] }')">${f['FOOD_ADDR'] }</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f['FOOD_SEQ'] }')">${f['FOOD_CALL'] }</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f['FOOD_SEQ'] }')">${f['BOOKING_HEAD'] }</td>
								
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f['FOOD_SEQ'] }')">
									<fmt:formatDate value="${f['BOOKING_DATE_DAY'] }" pattern="yyyy.MM.dd"/> / <fmt:formatDate value="${f['BOOKING_DATE_TIME'] }" pattern="hh:mm"/>
								</td>
								
								<td class="colcenter pointer align-middle">
									<c:if test="${f['DATE_MINUS']!=0 }">
										<button class="cancelBtn btn" onclick="fn_cancelFood('${f['FOOD_BOOKING_SEQ'] }');">취소</button>
									</c:if>
									<c:if test="${f['DATE_MINUS']==0 }">
										<button class="disabledBtn btn" disabled>취소</button>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty foodInfo }">
						<tr>
							<td colspan="7" class="colcenter">예약 정보가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		
			<nav aria-label="Page navigation example">
		 	 	${pageBar }
			</nav>
		</div>
	</div>
	
	<!-- 가고싶은 맛집 목록 -->
	<div class="tab-pane container" id="foodLikeList">
		<div class="d-flex flex-column justify-content-center align-items-center">
			<table class="table table-borderless col-xl-6 col">
			
				<thead class="thead-light">
					<tr>
						<th class="colcenter">식당이름</th>
						<th class="colcenter">지역</th>
						<th class="colcenter">음식종류</th>
						<th class="colcenter">평점</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${!empty myLkeFoodList }">
						<c:forEach var="f" items="${ myLkeFoodList }">
							<tr>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq}')">${f.foodName}</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq }')"><c:out value="${fn:substring(f.foodAddr, 4, 11)}"/></td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq }')">${f.foodCategoryMain}</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq }')">${f.foodStar }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
		 	 	${pageBar }
			</nav>
		</div>
	</div>
	
	<!-- 내가 쓴 리뷰 -->
	<div class="tab-pane container" id="foodCommentList">
		<div class="d-flex flex-column justify-content-center align-items-center">
			<table class="table table-borderless col-xl-6 col">
			
				<thead class="thead-light">
					<tr>
						<th class="colcenter">식당이름</th>
						<th class="colcenter">내용</th>
						<th class="colcenter">별점</th>
						<th class="colcenter">작성날짜</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${!empty myFoodCommentList }">
						<c:forEach var="c" items="${ myFoodCommentList }">
							<tr>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${c.foodSeq}')">${c.foodName}</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${c.foodSeq }')"><c:out value="${fn:substring(c.foodCommentContents, 0, 10)}"/>...</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${c.foodSeq }')">${c.foodCommentStar}</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${c.foodSeq }')">${c.foodCommentDate }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
		 	 	${pageBar }
			</nav>
		</div>
	</div>
	
	
</div>




<script>
$(function() {
	//$("#foodLikeList").css("display", "none");
});

// 맛집 예약 취소
function fn_cancelFood(foodBookingSeq){
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/user/mypage/cancelFood",
		data:{"foodBookingSeq":foodBookingSeq},
		success:data=>{
			if(data>0){
				alert("예약이 취소되었습니다.");
				$("#myPageModal").modal("hide");
				fn_openMPModal("food");
			}else{
				alert("예약 취소에 실패했습니다.");
			}
		}
	})
}

// 좋아요 삭제 
const fn_delFoodLike = (foodSeq, userId) => {
	
	$.ajax({
		url : "${path}/food/delFoodLike",
		data : {
			"foodSeq" : foodSeq,
			"userId" : userId
		},
		success : data => {
			// console.log(data);
			if(data == 'success') {
				
				$("#like").removeClass("fas fa-heart");
				$("#like").attr("class", "far fa-heart").css({ "color" : "rgb(201,201,201)" });
				
			}
		}
	});
}


</script>
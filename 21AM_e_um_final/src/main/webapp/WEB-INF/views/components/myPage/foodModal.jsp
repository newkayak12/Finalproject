<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Nav tabs -->
<ul id="foodTab" class="nav nav-tabs nav-fill tway"  role="tablist">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#bookingList">맛집예약내역</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#foodLikeList">가고싶은 맛집</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#foodCommentLists">내가 쓴 리뷰</a>
    </li>
</ul>

<!-- Tab panes -->


<div class="tab-content my-5">
	
	<!-- 예약내역 -->
	<div class="tab-pane container active" id="bookingList">
		<div class="d-flex flex-column justify-content-center align-items-center">
		<%--  <table class="table table-borderless col-xl-6 col bgColor fakeborder">
				<colgroup>
					<col class="col-5">
					<col class="col-7">
				</colgroup>
				<tbody>
					<tr>
						<td class="colend"><b>현재 닉네임</b></td>
						<td>${userSession.userNick }</td>
					</tr>
					<tr>
						<td class="colend"><b>변경할 닉네임</b></td>
						<td><input type="text" id="newNick" name="newNick" onkeyup="fn_checkNick()" required></td>
					</tr>
					<tr>
						<td></td>
						<td id="NickSign"><small></small></td>
					</tr>
				</tbody>
			</table>
			<button id="NickChangeBtn" class="btn changeBtn mt-4" onclick="fn_changeNick()">변경하기</button> --%>
			
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
	<div class="tab-pane container active" id="foodLikeList">
		<div class="d-flex flex-column justify-content-center align-items-center">
			<table class="table table-borderless col-xl-6 col bgColor fakeborder">
			
				<thead class="thead-light">
					<tr>
						<th class="colcenter">사진</th>
						<th class="colcenter">식당명</th>
						<th class="colcenter">간단주소</th>
						<th class="colcenter">음식종류</th>
						<th class="colcenter">평점</th>
						<th class="colcenter">좋아요버튼</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${!empty likeFoodList }">
						<c:forEach var="f" items="${likeFoodList }">
							<tr>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq}')">${f.foodName}</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq }')">${f.foodAddr }</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq }')">${f.foodCategoryMain}</td>
								<td class="colcenter align-middle pointer" onclick="location.assign('${path}/food/foodView?foodSeq=${f.foodSeq }')">${f.foodStar }</td>
								<%-- 
								<td class="colcenter pointer align-middle">
									<c:if test="${f['DATE_MINUS']!=0 }">
										<button class="cancelBtn btn" onclick="fn_cancelFood('${f['FOOD_BOOKING_SEQ'] }');">취소</button>
									</c:if>
									<c:if test="${f['DATE_MINUS']==0 }">
										<button class="disabledBtn btn" disabled>취소</button>
									</c:if>
								</td> --%>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>







<script>
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


</script>
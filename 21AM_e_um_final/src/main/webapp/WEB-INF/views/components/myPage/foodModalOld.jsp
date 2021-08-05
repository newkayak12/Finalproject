<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<script>
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
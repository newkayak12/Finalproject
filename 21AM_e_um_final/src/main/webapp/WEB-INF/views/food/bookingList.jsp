<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
		<%-- <c:out value="${ bookingList }"/> --%>
		<div>
			<table>
				<tr>
					<th>예약번호</th>
					<th>식당</th>
					<th>예약일정 ( 날짜 + 시간 )</th>
					<th>인원</th>
					<th>예약취소</th>
				</tr>
				<c:forEach var="b" items="${ bookingList }">
					<tr>
						<td><c:out value="${ b.foodBookingSeq }"/></td>
						<td><c:out value="${ b.food.foodName }"/></td>
						<td><c:out value="${ b.bookingDateDay }"/><c:out value="${ b.bookingDateTime }"/></td>
						<td><c:out value="${ b.bookingHead }"/></td>
						<td><c:out value="${ b.bookingCancelFlag }"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<table class="table table-striped table-hover tway">
	<tbody>
		<tr>
			<th class="bgColorMainColorSub whiteText">예매번호</th>
			<th class="bgColorMainColorSub whiteText">아이디</th>
			<th class="bgColorMainColorSub whiteText">좌석</th>
			<th class="bgColorMainColorSub whiteText">영화제목</th>
			<th class="bgColorMainColorSub whiteText">영화지역</th>
			<th class="bgColorMainColorSub whiteText">영화관</th>
			<th class="bgColorMainColorSub whiteText">예매일</th>
			<th class="bgColorMainColorSub whiteText">결제가격</th>
			
		</tr>
		<c:forEach var="l" items="${list }" >
			<tr>
				<td><c:out value="${l.movieReservNum }"/></td>
				<td><c:out value="${l.userId.userId }"/></td>
				<td>
					<c:if test="${l.seats1 !=null}">
						<c:out value="${l.seats1 }"/>
					</c:if>
					<c:if test="${l.seat2 !=null}">
						<c:out value="${l.seat2 }"/>
					</c:if>
					<c:if test="${l.seat3 !=null}">
						<c:out value="${l.seat3 }"/>
					</c:if>
					<c:if test="${l.seat4 !=null}">
						<c:out value="${l.seat4 }"/>
					</c:if>
				</td>
				<td><c:out value="${l.movieTitle }"/></td>
				<td><c:out value="${l.movieLocation }"/></td>
				<td><c:out value="${l.movieBox }"/></td>
				<td><fmt:formatDate type="date" value="${l.movieReservDate }"></fmt:formatDate></td>
				<td><c:out value="${l.moviePrice }"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${list.size()>0}">
	<div>
	${pageBar }
	</div>
</c:if>
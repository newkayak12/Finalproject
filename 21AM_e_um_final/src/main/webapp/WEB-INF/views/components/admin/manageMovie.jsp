<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table table-striped table-hover tway">
	<tbody>
		<tr>
			<th class="bgColorMainColorSub whiteText">영화시퀀스</th>
			<th class="bgColorMainColorSub whiteText">영화제목</th>
			<th class="bgColorMainColorSub whiteText">감독명</th>
			<th class="bgColorMainColorSub whiteText">시간</th>
			<th class="bgColorMainColorSub whiteText">개봉일</th>
			<th class="bgColorMainColorSub whiteText">연령</th>
			<th class="bgColorMainColorSub whiteText">상영상태</th>
			<th class="bgColorMainColorSub whiteText">예매율</th>
			<th class="bgColorMainColorSub whiteText">별점</th>
		</tr>
		<c:forEach var="l" items="${list }" >
			<tr>
				<td><c:out value="${l.movieSeq }"/></td>
				<td><c:out value="${l.movieTitleKr }"/></td>
				<td><c:out value="${l.movieDirector }"/></td>
				<td><c:out value="${l.movieRunningTime }"/></td>
				<td><fmt:formatDate type="date" value="${l.movieOpenDate }"></fmt:formatDate></td>
				<td><c:out value="${l.movieAge }"/></td>
				<td><c:out value="${l.movieStatus }"/></td>
				<td><c:out value="${l.movieReserveRate }"/></td>
				<td><c:out value="${l.movieTotalEvalution }"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${list.size()>0}">
	<div>
	${pageBar }
	</div>
</c:if>
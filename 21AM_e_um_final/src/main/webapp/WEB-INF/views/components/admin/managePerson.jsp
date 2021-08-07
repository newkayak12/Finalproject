<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table table-striped table-hover tway">
	<tbody>
		<tr>
			<th class="bgColorMainColorSub whiteText">인물시퀀스</th>
			<th class="bgColorMainColorSub whiteText">이름</th>
			<th class="bgColorMainColorSub whiteText">생년월일</th>
			<th class="bgColorMainColorSub whiteText">필모그래피</th>
			
		</tr>
		<c:forEach var="l" items="${list }" >
			<tr>
				<td><c:out value="${l.moviePersonSeq }"/></td>
				<td><c:out value="${l.moviePersonName }"/></td>
				<td><fmt:formatDate type="date" value="${l.moviePersonBirth }"></fmt:formatDate></td>
				<td><c:out value="${l.movies }"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${list.size()>0}">
	<div>
	${pageBar }
	</div>
</c:if>
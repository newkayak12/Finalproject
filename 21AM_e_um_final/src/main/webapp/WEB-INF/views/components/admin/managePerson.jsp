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
			<th class="bgColorMainColorSub whiteText">상태</th>			
			<th class="bgColorMainColorSub whiteText">삭제</th>			
			<th class="bgColorMainColorSub whiteText">수정</th>			
			
		</tr>
		<c:forEach var="l" items="${list }" >
			<tr>
				<td><c:out value="${l.moviePersonSeq }"/></td>
				<td><c:out value="${l.moviePersonName }"/></td>
				<td><fmt:formatDate type="date" value="${l.moviePersonBirth }"></fmt:formatDate></td>
				<td><c:out value="${l.movies }"/></td>
				<td><c:out value="${l.moviePersonFlag }"/></td>
				<c:choose>
					<c:when test="${l.moviePersonFlag=='live' }">
						<td><input type="button" onclick="moviePersonDelete('${l.moviePersonSeq}')" value="삭제"></td>
					</c:when>
					<c:otherwise>
						<td><input type="button" onclick="moviePersonLive('${l.moviePersonSeq}')" value="복구"></td>
					</c:otherwise>
				</c:choose>
				<td><input type="button" onclick="amendPerson('${l.moviePersonSeq}');" value="수정"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:if test="${list.size()>0}">
	<div>
	${pageBar }
	</div>
</c:if>


<script>
	function moviePersonDelete(moviePersonSeq,cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/movie/moviePersonDelete',
			data: {"moviePersonSeq":moviePersonSeq},
			success:data=>{
				managePerson(cPage);
			}
		})
	}
	function moviePersonLive(moviePersonSeq,cPage){
		$.ajax({
			url : '${pageContext.request.contextPath}/movie/moviePersonLive',
			data: {"moviePersonSeq":moviePersonSeq},
			success:data=>{
				managePerson(cPage);
			}
		})
	}
	function amendPerson(moviePersonSeq){
		$.ajax({
			url : '${pageContext.request.contextPath}/movie/amendPerson',
			data: {"moviePersonSeq":moviePersonSeq},
			success:data=>{
				$("#prev").css("visibility","visible")
				$("#title").html("영화인물 수정")
				$("#root").html(data)
			}
		})
	}
</script>
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
			<th class="bgColorMainColorSub whiteText">상태</th>
			<th class="bgColorMainColorSub whiteText">삭제</th>
			<th class="bgColorMainColorSub whiteText">수정</th>
			
		
			
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
				<td><c:out value="${l.movieFlag }"/></td>
				<c:choose>
					<c:when test="${l.movieFlag=='live' }">
						<td><input type="button" onclick="movieDelete('${l.movieSeq}');" value="삭제" style="border-radius: 10px"></td>
					</c:when>
					<c:otherwise>
						<td><input type="button" onclick="movieLive('${l.movieSeq}');" value="복구" style="border-radius: 10px"></td>
					</c:otherwise>
				</c:choose>
				<td><input type="button" onclick="amendMovie('${l.movieSeq}');" value="수정" style="background-color: #2AC1BC; border-radius: 10px"></td>						
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
/* 영화 삭제 */
function movieDelete(movieSeq,cPage){
	$.ajax({
		url:'${pageContext.request.contextPath}/movie/movieDelete',
		data: {"movieSeq":movieSeq},
		success:data=>{
			manageMovie(cPage);
		}	
	})
	
}

function movieLive(movieSeq,cPage){
	$.ajax({
		url:'${pageContext.request.contextPath}/movie/movieLive',
		data: {"movieSeq":movieSeq},
		success:data=>{
			manageMovie(cPage);
		}	
	})
	
}
function amendMovie(movieSeq){
	$.ajax({
		url:'${pageContext.request.contextPath}/movie/amendMovie',
		data: {"movieSeq":movieSeq},
		success:data=>{
			$("#prev").css("visibility","visible")
			$("#title").html("영화 수정")
			$("#root").html(data)
		}
	})
}
</script>

<style>
		*{
			font-family:'Noto Sans KR';
		}
</style>
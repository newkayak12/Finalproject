<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table class="table">
    <colgroup>
    	<col class="col-2">
    	<col class="col-2">
        <col class="col-5">
        <col class="col-2">
        <col class="col-1">
    </colgroup>
    <thead class="thead-light">
      <tr>
        <th class="colcenter">예매번호</th>
        <th class="colcenter">영화</th>
        <th class="colcenter">예매 정보</th><!-- 지역/상영관/날짜/시간/좌석번호(총 몇인) -->
        <th class="colcenter">예매일</th>
        <th class="colcenter">취소</th>
      </tr>
    </thead>
    <tbody>
    	<c:if test="${!empty gbList }">
    		<c:forEach var="g" items="${gbList }">
			   	<tr>
			   		<td>${g['GUESTBOOK_COMMENT'] }</td>
					<td class="colcenter">${g['USER_NICK'] }</td>
					<td class="colcenter"><fmt:formatDate value="${g['GUESTBOOK_DATE'] }" pattern="yy/MM/dd"/></td>
					<td></td>
					<c:if test="${userSession.userId==profileId or userSession.userId==g['USER_ID_WRITER'] }">
						<td class="colcenter pointer" onclick="fn_deleteGb('${g['GUESTBOOK_SEQ'] }');">&times;</td>
					</c:if>
		  		</tr>
	 		</c:forEach>
    	</c:if>
    	<c:if test="${empty gbList }">
    		<tr>
    			<td colspan="5">예매 정보가 없습니다.</td>
    		</tr>
    	</c:if>
    </tbody>
</table>

<nav aria-label="Page navigation example">
	 ${pageBar }
</nav>
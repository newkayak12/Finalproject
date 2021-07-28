<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table class="table table-borderless">
    <colgroup>
        <col class="col-7">
        <col class="col-2">
        <col class="col-2">
        <col class="col-1">
    </colgroup>
    <thead class="thead-light">
      <tr>
        <th class="colcenter">content</th>
        <th class="colcenter">writer</th>
        <th class="colcenter">date</th>
        <th class="colcenter">delete</th>
      </tr>
    </thead>
    <tbody>
    	<c:if test="${!empty gbList }">
    		<c:forEach var="g" items="${gbList }">
			   	<tr>
			   		<td>${g.guestbookComment }</td>
					<td class="colcenter">${g.userIdWriter }</td>
					<td class="colcenter"><fmt:formatDate value="${g.guestbookDate }" pattern="yy/MM/dd"/></td>
					<td class="colcenter">&times;</td>
		  		</tr>
	 		</c:forEach>
    	</c:if>
    	<c:if test="${empty gbList }">
    		<tr>
    			<td colspan="4">첫번째 방명록의 주인공이 되어보세요!</td>
    		</tr>
    	</c:if>
    </tbody>
</table>

<nav aria-label="Page navigation example">
	 ${pageBar }
</nav>
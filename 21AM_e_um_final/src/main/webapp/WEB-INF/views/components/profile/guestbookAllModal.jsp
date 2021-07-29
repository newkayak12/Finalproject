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
        <th class="colend">content</th>
        <th class="colend">writer</th>
        <th class="colend">date</th>
        <th class="colend">delete</th>
      </tr>
    </thead>
    <tbody>
    	<c:if test="${!empty guestbookList }">
    		<c:forEach var="g" items="${guestbookList }">
			   	<tr>
			   		<td>${g.guestbookComment }</td>
					<td class="colend">${g.userIdWriter }</td>
					<td class="colend"><fmt:formatDate value="${g.guestbookDate }" pattern="yy/MM/dd"/></td>
					<td class="colend">&times;</td>
		  		</tr>
	 		</c:forEach>
    	</c:if>
    	<c:if test="${empty guestbookList }">
    		<tr>
    			<td colspan="4">첫번째 방명록의 주인공이 되어보세요!</td>
    		</tr>
    	</c:if>
    </tbody>
</table>

<div class="pagebar">
</div>
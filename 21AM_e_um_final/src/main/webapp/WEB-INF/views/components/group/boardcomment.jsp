<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
    <c:forEach var="i" items="${commentlist }">
    	<tr>
    		<td class="contents"><c:out value="${i.groupCommentContents }"/></td>
    		<td class="userId"><c:out value="${i.groupCommentUser.userId }"/></td>
    		<td class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${i.groupCommentDate }"/></td>
    	</tr>
    </c:forEach>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

      	<c:forEach var="b" items="${boardlist }">
     		<tr>
		        <td class="seq"><c:out value="${b.groupBoardSeq }"/></td>
		        
		        <td class="status">
		 			<c:out value="일반"/>
		        </td>
		        <td class="title"><a href="javascript:moveFn('${b.groupBoardSeq}');"><c:out value="${b.groupBoardTitle }"/></a></td>
		        <td class="userId"><c:out value="${b.groupBoardUser.userId}"/></td>
		        <td class="date"><c:out value="${b.groupBoardDate }"/></td>
      		</tr>
      	</c:forEach>
      	
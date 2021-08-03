<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<table class="table" id="table">
      	<thead>
      	<tr>
      		<th>번호</th>
      		<th>유형</th>
      		<th>제목</th>
      		<th>작성자</th>
      		<th>날짜</th>
      	</tr>
      	</thead>
      	<tbody>
      		<c:forEach var="b" items="${notice }">
      		<tr class="table-primary">
        		<td><c:out value="${b.groupBoardSeq }"/></td>
		        <td><c:out value="${b.groupLevel }"/></td>
		        <td><a href="javascript:moveFnNo('${b.groupBoardSeq}');"><c:out value="${b.groupBoardTitle }"/></a></td>
		        <td><c:out value="${b.groupBoardUser.userId}"/></td>
		        <td><c:out value="${b.groupBoardDate }"/></td>
      		</tr>
      		</c:forEach>
      		<c:forEach var="b" items="${best }" begin="0" end="2" >
      		<tr class="table-warning">
		        <td><c:out value="${b.groupBoardSeq }"/></td>
		        <td>베스트게시글</td>
		        <td><a href="javascript:moveFn('${b.groupBoardSeq}');"><c:out value="${b.groupBoardTitle }"/></a></td>
		        <td><c:out value="${b.groupBoardUser.userId}"/></td>
		        <td><c:out value="${b.groupBoardDate }"/></td>
      		</tr>
      		</c:forEach>
      	</table>
      	
      	<table>	
      		<c:forEach var="b" items="${boardlist }">
     		<tr class="table-light">
		        <td class="seq"><c:out value="${b.groupBoardSeq }"/></td>
		        <td class="status">일반</td>
		        <td class="title"><a href="javascript:moveFn('${b.groupBoardSeq}');"><c:out value="${b.groupBoardTitle }"/></a></td>
		        <td class="userId"><c:out value="${b.groupBoardUser.userId}"/></td>
		        <td class="date"><c:out value="${b.groupBoardDate }"/></td>
      		</tr>
      		</c:forEach>
      	</tbody>
      </table>
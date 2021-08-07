<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="${pageContext.request.contextPath}/resources/css/hyelin.css" rel="stylesheet">

<div class="d-flex flex-column justify-content-between align-itmes-center mb-5">
	<div style="height: 650px" class="d-flex flex-column  align-items-center" id="manageFAQDiv">
		<table class="table table-striped table-hover">
			<tr>
				<th class="bgColorMainColorSub whiteText colcenter">
					카테고리
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					제목
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					수정
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					삭제
				</th>
			</tr>
			
			<c:if test="${list.size()>0}">
				<c:forEach items="${list }" var="i">
					<tr>
						<td>${i.questionCategory }</td>
						<td>${i.faqTitle }</td>
						<td><button class="cancelBtn btn" onclick="">수정</button></td>
						<td><button class="cancelBtn btn" onclick="">삭제</button></td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="4" class="text-center">내용이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>
	
	<c:if test="${list.size()>0}">
		<nav aria-label="Page navigation example">
	 		<%-- ${pageBar } --%>
		</nav>
	</c:if>
	
</div>
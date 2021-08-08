<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="${pageContext.request.contextPath}/resources/css/hyelin.css" rel="stylesheet">

<div class="d-flex flex-column justify-content-between align-itmes-center mb-5">
	<div style="height: 650px" class="d-flex flex-column  align-items-center" id="manageFAQDiv">
		<table class="table table-striped table-hover colcenter">
			<colgroup>
				<col class="col-1">
		        <col class="col-2">
		        <col class="col-5">
		        <col class="col-2">
		        <col class="col-2">
			</colgroup>
			<tr>
				<th class="bgColorMainColorSub whiteText colcenter">
					글 번호
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					카테고리
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					제목
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					날짜
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					답변 현황
				</th>
			</tr>
			
			<c:if test="${list.size()>0}">
				<c:forEach items="${list }" var="i">
					<tr>
						<td class="colcenter align-middle">
	                    	${fn:substring(i.questionSeq,3,6) }
	                    </td>
	                    <td class="colcenter align-middle">
	                    	${i.questionCategory }
	                    </td>
	                    <td class="align-middle">
	                    	${i.questionTitle }
	                    </td>
	                    <td class="colcenter align-middle">
	                        <fmt:formatDate value="${i.questionDate }" pattern="yyyy/MM/dd"/>
	                    </td>
	                    <td class="colcenter align-middle">
	                        <c:if test="${i.questionResponseFlag eq 'success' }">
	                            <button class="disabledBtn btn" disabled>완료</button>
	                        </c:if>
	                        <c:if test="${i.questionResponseFlag eq 'wait' }">
	                            <button class="cancelBtn btn" onclick="fn_answerQuestionStart('${i.questionSeq}')">미완료</button>
	                        </c:if>
	                    </td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="5" class="text-center">내용이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>
	
	<c:if test="${list.size()>0}">
		<nav aria-label="Page navigation example">
	 		${pageBar }
		</nav>
	</c:if>
</div>

<script>
	function fn_answerQuestionStart(questionSeq){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/admin/answerQuestion/start",
			data:{questionSeq:questionSeq},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("문의사항 답변")
				$("#root").html(list)
			}
		})
	}
</script>
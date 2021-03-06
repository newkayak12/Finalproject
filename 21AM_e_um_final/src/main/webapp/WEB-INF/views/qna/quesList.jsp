<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="${pageContext.request.contextPath}/resources/css/hyelin.css" rel="stylesheet">
    
<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
		<h2 class="mb-5 tway">고객센터</h2>
	    <div class="d-flex align-items-center flex-column mb-5">
	        <h4 class="tway">내 문의 목록</h4>
	        <div id="quesTable" class="col">
				<div class="mb-5">
					<button type="button" class="btn checkBtn ml-4 btnWidth float-right" onclick="location.assign('${pageContext.request.contextPath}/qna/write/start?flag='+'list')">문의하기</button>
				</div>
				<table class="table table-hover mt-4">
				    <colgroup>
				        <col class="col-1">
				        <col class="col-2">
				        <col class="col-5">
				        <col class="col-2">
				        <col class="col-2">
				    </colgroup>
				    <thead>
				      <tr>
				        <th class="colcenter">글 번호</th>
				        <th class="colcenter">카테고리</th>
				        <th class="colcenter">제목</th>
				        <th class="colcenter">날짜</th>
				        <th class="colcenter">답변 유무</th>
				      </tr>
				    </thead>
				    <tbody>
				        <c:if test="${!empty quesList }">
				            <c:forEach var="q" items="${quesList }">
				            	<tr>
				                    <td class="colcenter align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/qna/view?queSeq=${q.questionSeq }')">
				                    	${fn:substring(q.questionSeq,3,6) }
				                    </td>
				                    <td class="colcenter align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/qna/view?queSeq=${q.questionSeq }')">
				                    	${q.questionCategory }
				                    </td>
				                    <td class="align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/qna/view?queSeq=${q.questionSeq }')">
				                    	${q.questionTitle }
				                    </td>
				                    <td class="colcenter align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/qna/view?queSeq=${q.questionSeq }')">
				                        <fmt:formatDate value="${q.questionDate }" pattern="yyyy/MM/dd"/>
				                    </td>
				                    <td class="colcenter pointer align-middle">
				                        <c:if test="${q.questionResponseFlag eq 'success' }">
				                            <button class="cancelBtn btn" onclick="location.assign('${pageContext.request.contextPath}/qna/view?queSeq=${q.questionSeq }')">완료</button>
				                        </c:if>
				                        <c:if test="${q.questionResponseFlag eq 'wait' }">
				                            <button class="disabledBtn btn" disabled onclick="location.assign('${pageContext.request.contextPath}/qna/view?queSeq=${q.questionSeq }')">미완료</button>
				                        </c:if>
				                    </td>
				                  </tr>
				             </c:forEach>
				        </c:if>
				        <c:if test="${empty quesList }">
				            <tr>
				                <td colspan="5" class="colcenter">아직 문의한 내용이 없습니다.</td>
				            </tr>
				        </c:if>
				    </tbody>
				</table>
				<nav aria-label="Page navigation example mt-5">
				      ${pageBar }
				</nav>
	        </div>
	    </div>
	</div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	
</script>
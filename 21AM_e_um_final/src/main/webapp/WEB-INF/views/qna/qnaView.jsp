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
            <h4 class="tway">내 문의</h4>
            <table class="table table-borderless col-lg-9 col mt-5 aboxborder" rules="none">
                <colgroup>
                    <col class="col-3">
                    <col class="col-3">
                    <col class="col-3">
                    <col class="col-3">
                </colgroup>
                <tbody>
                    <tr>
                        <th>카테고리</th>
                        <td>${qna.questionCategory }</td>
                        <th class="colend">작성일</th>
                        <td><fmt:formatDate value="${qna.questionDate }" pattern="yyyy/MM/dd"/></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="3">${qna.questionTitle }</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3">${qna.questionContents }</td>
                    </tr>
                    <c:if test="${qna.questionImageFile ne null }">
	                    <tr>
	                        <th>첨부파일</th>
	                        <td colspan="3">
	                        	<img class="qnaImg" src="${pageContext.request.contextPath}/resources/upload/question/${qna.questionImageFile }" alt="첨부파일">
	                        </td>
	                    </tr>
                    </c:if>
                    <c:if test="${qna.questionAnswerContents ne null }">
	                    <tr class="topborder">
	                        <th colspan="4"><h5 class="colcenter"><b>답변 내용</b></h5></th>
	                    </tr>
	                    <tr>
	                        <td colspan="4">
	                            <div class="abox">
	                            	<div>${qna.questionAnswerContents }</div>
	                            	<div class="float-right"><fmt:formatDate value="${qna.questionAnswerDate }" pattern="yyyy/MM/dd"/></div>
	                            </div>
	                        </td>
	                    </tr>
                    </c:if>
                </tbody>
            </table>
            <div class="d-flex justify-content-center mt-5">
                <button type="button" class="btn checkBtn ml-4 btnWidth" onclick="location.assign('${pageContext.request.contextPath}/qna/openList')">목록으로</button>
            </div>
        </div>
	</div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
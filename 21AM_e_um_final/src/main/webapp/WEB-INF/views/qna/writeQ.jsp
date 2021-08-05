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
	        <h4 class="tway">문의 등록</h4>
	        <form action="${pageContext.request.contextPath}/qna/write/end" method="post" class="col-lg-8 col mt-5">
	            <div>
	                <div class="form-group">
	                    <label for="category"><b>카테고리 선택</b></label>
	                    <select class="form-control" id="qnaCategory" name="category">
	                        <option>친구 찾기</option>
	                        <option>소모임</option>
	                        <option>플레이스</option>
	                        <option>기타</option>
	                      </select>
	                </div><br>
	                <div class="form-group">
	                    <label for="title"><b>제목</b></label>
	                    <input type="text" class="form-control" id="qnaTitle" name="title" required placeholder="제목을 입력해주세요.">
	                </div><br>
	                <div class="form-group">
	                    <label for="content"><b>내용</b></label>
	                    <textarea class="form-control" rows="15" id="qnaContent" name="content" required placeholder="내용을 입력해주세요."></textarea>
	                </div>
	                <div class="d-flex">
	                    <span class="col-3"><b>첨부파일</b></span>
	                    <input type="file" id="qnaFile" name="file" class="form-control-file col-9" accept='image/png,image/jpeg,image/jpg'>
	                </div><br>
	                <div class="d-flex justify-content-center mt-5">
	                	<c:if test="${prevPage=='main' }">
		                    <button type="button" class="btn cancelBtn mr-4 btnWidth" onclick="location.assign('${pageContext.request.contextPath}/faq/open')">취소</button>
	                	</c:if>
	                	<c:if test="${prevPage=='list' }">
		                    <button type="button" class="btn cancelBtn mr-4 btnWidth" onclick="location.assign('${pageContext.request.contextPath}/qna/openList')">취소</button>
	                	</c:if>
	                    <button type="submit" class="btn checkBtn ml-4 btnWidth">등록</button>
	                </div>
	            </div>
	        </form>
	    </div>
	</div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
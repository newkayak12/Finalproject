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
	    <form action="" method="post" class="mt-3 mb-5 mx-md-5">
	        <div class="input-group mb-3">
	            <input type="text" class="form-control" id="searchQNA" name="searchQNA" placeholder="무엇을 도와드릴까요?">
	            <div class="input-group-append">
	                <button id="searchFriBtn" class="btn btn-success searchBtn" type="button">검색</button>
	            </div>
	        </div>
	    </form>
	
	    <div class="d-flex align-items-center flex-column mb-5 pt-4">
	        <h4 class="tway">FAQ</h4>
	        <div class="mb-4">카테고리별 자주 묻는 질문</div>
	        <div id="qnaCate" class="d-flex flex-wrap col-lg-10 col">
	            <a href="#" class="col-md-3 mb-3 col-6">
	                <div class="qnaBox mx-2 d-flex justify-content-center align-items-center">
	                    <b>친구 찾기</b>
	                </div>
	            </a>
	            <a href="#" class="col-md-3 mb-3 col-6">
	                <div class="qnaBox mx-2 d-flex justify-content-center align-items-center">
	                    <b>소모임</b>
	                </div>
	            </a>
	            <a href="#" class="col-md-3 mb-3 col-6">
	                <div class="qnaBox mx-2 d-flex justify-content-center align-items-center">
	                    <b>플레이스</b>
	                </div>
	            </a>
	            <a href="#" class="col-md-3 mb-3 col-6">
	                <div class="qnaBox mx-2 d-flex justify-content-center align-items-center">
	                    <b>기타</b>
	                </div>
	            </a>
	        </div>
	    </div>
	
	    <div class="d-flex align-items-center flex-column pt-4 mb-5">
	        <h4 class="tway">1:1 문의</h4>
	        <div class="mb-4 colcenter">
	            원하는 답을 얻지 못하셨나요?<br>
	            문의를 보내주시면 가능한 한 빨리 답변드리겠습니다.
	        </div>
	        <div>
	            <button type="button" class="btn checkBtn mr-2 btnWidth" onclick="location.assign('${pageContext.request.contextPath}/qna/write/start?flag='+'main')">문의하기</button>
	            <button type="button" class="btn checkBtn ml-2 btnWidth" onclick="location.assign('${pageContext.request.contextPath}/qna/openList')">내 문의</button>
	        </div>
	    </div>
	</div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
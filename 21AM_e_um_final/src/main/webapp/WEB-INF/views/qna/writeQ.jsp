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
	        <form action="" method="post" class="col-lg-8 col mt-5">
	            <div>
	                <div class="form-group">
	                    <label for="category"><b>카테고리 선택</b></label>
	                    <select class="form-control" id="category" name="qnaCategory">
	                        <option>친구 찾기</option>
	                        <option>소모임</option>
	                        <option>플레이스</option>
	                        <option>기타</option>
	                      </select>
	                </div><br>
	                <div class="form-group">
	                    <label for="title"><b>제목</b></label>
	                    <input type="text" class="form-control" id="title" name="qnaTitle" required placeholder="제목을 입력해주세요.">
	                </div><br>
	                <div class="form-group">
	                    <label for="content"><b>내용</b></label>
	                    <textarea class="form-control" rows="15" id="content" name="qnaContent" required placeholder="내용을 입력해주세요."></textarea>
	                </div>
	                <div>
	                    <span class="mr-5"><b>첨부파일</b></span>
	                    <input type="file">
	                </div><br>
	                <div class="d-flex justify-content-center mt-5">
	                    <button type="button" class="btn cancelBtn mr-4 btnWidth">취소</button>
	                    <button type="submit" class="btn checkBtn ml-4 btnWidth">등록</button>
	                </div>
	            </div>
	        </form>
	    </div>
	</div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
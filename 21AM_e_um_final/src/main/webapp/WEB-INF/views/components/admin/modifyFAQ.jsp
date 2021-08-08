<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="${pageContext.request.contextPath}/resources/css/hyelin.css" rel="stylesheet">

<div class="d-flex justify-content-center">
	<form action="" class="col-lg-9 col">
	    <div>
	    	<div class="form-group">
                <label for="category"><b>카테고리 선택</b></label>
                <select class="form-control" id="faqCategory" name="category">
                	<c:choose>
                		<c:when test="${faq.questCategory eq '친구 찾기' }">
                			<option selected>친구 찾기</option>
		                    <option>소모임</option>
		                    <option>플레이스</option>
		                    <option>기타</option>
                		</c:when>
                		<c:when test="${faq.questCategory eq '소모임' }">
                			<option>친구 찾기</option>
		                    <option selected>소모임</option>
		                    <option>플레이스</option>
		                    <option>기타</option>
                		</c:when>
                		<c:when test="${faq.questCategory eq '플레이스' }">
                			<option>친구 찾기</option>
		                    <option>소모임</option>
		                    <option selected>플레이스</option>
		                    <option>기타</option>
                		</c:when>
                		<c:when test="${faq.questCategory eq '기타' }">
                			<option>친구 찾기</option>
		                    <option>소모임</option>
		                    <option>플레이스</option>
		                    <option selected>기타</option>
                		</c:when>
                	</c:choose>
                </select>
            </div><br>
	        <div class="form-group">
	            <label for="title"><b>제목</b></label>
	            <input type="text" class="form-control" id="faqTitle" name="title" required value="${faq.faqTitle }">
	        </div><br>
	        <div class="form-group">
	            <label for="content"><b>내용</b></label>
	            <textarea class="form-control" rows="15" id="faqContent" name="content" required wrap="hard">${faq.faqContents }</textarea>
	        </div>
	        <div class="d-flex justify-content-center mt-5">
	            <button type="button" class="btn cancelBtn mr-4 btnWidth" onclick="manageFAQ(1);">취소</button>
	            <button type="button" class="btn checkBtn ml-4 btnWidth" onclick="fn_modifyFAQEnd();">수정</button>
	        </div>
	    </div>
	</form>
</div>

<script>
	function fn_modifyFAQEnd(){
		$.ajax({
			type:"post",
			url:'${pageContext.request.contextPath}/admin/modifyFAQ/end',
			data:{
				faqSeq:'${faq.faqSeq }',
				category:$("#faqCategory").val(),
				title:$("#faqTitle").val(),
				content:$("#faqContent").val()
			},
			success:list=>{
				if(list>0){
					alert("FAQ가 수정되었습니다.");
					manageFAQ(1);
				}else{
					alert("FAQ 수정에 실패했습니다.");
				}
			}
		})
	}
</script>
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
                    <option>친구 찾기</option>
                    <option>소모임</option>
                    <option>플레이스</option>
                    <option>기타</option>
                </select>
            </div><br>
	        <div class="form-group">
	            <label for="title"><b>제목</b></label>
	            <input type="text" class="form-control" id="faqTitle" name="title" required placeholder="제목을 입력해주세요.">
	        </div><br>
	        <div class="form-group">
	            <label for="content"><b>내용</b></label>
	            <textarea class="form-control" rows="15" id="faqContent" name="content" required placeholder="내용을 입력해주세요."></textarea>
	        </div>
	        <div class="d-flex justify-content-center mt-5">
	            <button type="button" class="btn cancelBtn mr-4 btnWidth" onclick="manageFAQ(1);">취소</button>
	            <button type="button" class="btn checkBtn ml-4 btnWidth" onclick="fn_writeFAQ();">등록</button>
	        </div>
	    </div>
	</form>
</div>

<script>
	function fn_writeFAQ(){
		$.ajax({
			type:"post",
			url:'${pageContext.request.contextPath}/admin/writeFAQ/end',
			data:{
				category:$("#faqCategory").val(),
				title:$("#faqTitle").val(),
				content:$("#faqContent").val()
			},
			success:list=>{
				if(list>0){
					alert("새로운 FAQ가 등록되었습니다.");
					writeFAQ();
				}else{
					alert("새로운 FAQ 등록에 실패했습니다.");
				};
			}
		})
	}
</script>
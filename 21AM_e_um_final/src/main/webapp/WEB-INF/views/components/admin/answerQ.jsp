<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex justify-content-center">
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
	        <tr class="topborder">
	            <th colspan="4"><h5 class="colcenter"><b>답변 작성</b></h5></th>
	        </tr>
	        <tr>
	            <td colspan="4">
	                <textarea class="form-control" rows="15" id="qnAnswer" name="answer" required placeholder="문의사항에 대한 답변을 입력해주세요." wrap="hard"></textarea>
	            </td>
	        </tr>
	    </tbody>
	</table>
</div>

<div class="d-flex justify-content-center mt-5">
	<button type="button" class="btn cancelBtn mr-4 btnWidth" onclick="manageQNA(1)">취소</button>
    <button type="submit" class="btn checkBtn ml-4 btnWidth" onclick="fn_answerQuestionEnd('${qna.questionSeq}')">답변 등록</button>
</div>

<script>
	function fn_answerQuestionEnd(questionSeq){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/admin/answerQuestion/end",
			data:{
				questionSeq:questionSeq,
				userId:'${qna.userId }',
				answer:$("#qnAnswer").val()
			},
			success:list=>{
				if(list>0){
					alert("답변이 등록되었습니다.");
					manageQNA(1);
				}else{
					alert("답변 등록에 실패했습니다.");
				}
			}
		})
	}
</script>
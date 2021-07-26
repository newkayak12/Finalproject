<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--본인 css 파일 포함시켜주세요-->
    
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
   <h1 style="text-align:left;">소모임 가입하기</h1>
      <form name="gorupJoinFrm" action="${path }/group/groupJoinForm.do"
      method="post">
      	<input type="hidden" value="${group.groupSeq }" name="groupJoinSeq">
      	<div>
      		<label>제목</label>
      		<p><c:out value="${group.groupTitle }"/><p>
      		<label>매니저</label>
      		<p><c:out value="${group.groupMaster }"/><p>
      		<label>내용</label>
      		<p><c:out value="${group.groupComment }"/></p>
      	</div>
      	<div>
      		<label>나이대</label>
      		<p><c:out value="${group.groupAge }"/><p>
      		<label>인원수</label>
      		<p><c:out value="${group.groupLimit }"/><p>
      		<label>성별</label>
      		<p><c:out value="${group.groupGender }"/><p>
      	</div>
      
		      
      
      	<div class="form-group">
    		<label>가입인사</label>
    		<input type="text" class="form-control" placeholder="안녕하세요" id="joincontext" >
  		</div>
      	
      	<button type="submit" class="btn btn-primary">
      	가입
      	</button>
      	<button type="button" class="btn btn-secondary"
      		onclick="history.go(-1)">취소</button>
      	
      </form>
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/woosik.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<!--본인 css 파일 포함시켜주세요-->
    <script type="text/javascript">
		console.log($("#testt").val())
</script>
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
   <h1 class="mainColor tway w_tit" style="font-size:35px; left;">소모임 가입하기</h1>
      <form id="gorupJoinFrm" action="${path }/group/groupJoinForm.do"
      method="post">
      	<input type="hidden" value="${group.groupSeq }" name="groupSeq" id="testt">
      	<div>
      		<label class="w_input_tit">제목</label>
      		<p><c:out value="${group.groupTitle }"/><p>
      		<label class="w_input_tit">방장</label>
      		<p><c:out value="${group.groupMaster }"/><p>
      		<label class="w_input_tit">내용</label>
      		<p><c:out value="${group.groupComment }"/></p>
      	</div>
      	<div>
      		<label class="w_input_tit">나이대</label>
      		<p><c:out value="${group.groupAge }"/><p>
      		<label class="w_input_tit">인원수</label>
      		<p><c:out value="${group.groupLimit }"/><p>
      		<label class="w_input_tit">성별</label>
      		<p><c:out value="${group.groupGender }"/><p>
      	</div>
      
		      
      
      	<div class="form-group">
    		<label>가입인사</label>
    		<input type="text" class="form-control" placeholder="안녕하세요" id="joincontext" >
  		</div>
      	
      	<div class="w_submit_btn">
	      	<button type="submit" class="btn checkBtn mb-1">가입</button>
	      	<button type="button" class="btn cancelBtn"onclick="history.go(-1)">취소</button>
      	</div>
      	
      </form>
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
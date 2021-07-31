<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--본인 css 파일 포함시켜주세요-->
    
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
   <form id="boardContentsFrm" action="${path }/group/groupBoardContents.do" method="post">
   <input type="hidden" value="${board.groupBoardSeq }" name="groupBoardSeq" id="tesss"/>
      <div>
      	<label>제목</label>
      	<p><c:out value="${board.groupBoardTitle }"/></p>
      </div>
      <div>
      	<label>작성자</label>
      	<p><c:out value="${board.groupBoardUser.userId }"/></p>
      </div>
      <div>
      	<label>내용</label>
      	${board.groupBoardContents }
      </div>
      
      <div>
      	<label>댓글</label>
      	<input type="text" class="form-control" placeholder="입력해" id="boardcontext">
      	<button type="submit" class="btn btn-primary">댓글입력</button>
      </div>
      </form>
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
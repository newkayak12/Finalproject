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
      	<label>사진</label>
      		<div class="p-1">
      		<%-- <p><c:out value="${board.groupBoardPhoto}"/></p> --%>
      		<c:if test="${board.groupBoardPhoto ne null}">
      			<c:if test="${board.groupBoardPhoto.groupBoardPhoto1 ne null }">
      				<img width="150px" height="150px" src="${path }/resources/upload/board/${board.groupBoardPhoto.groupBoardPhoto1} ">
      			</c:if>
      			<c:if test="${board.groupBoardPhoto.groupBoardPhoto2 ne null }">
      				<img width="150px" height="150px" src="${path }/resources/upload/board/${board.groupBoardPhoto.groupBoardPhoto2} ">
      			</c:if>
      			<c:if test="${board.groupBoardPhoto.groupBoardPhoto3 ne null }">
      				<img width="150px" height="150px" src="${path }/resources/upload/board/${board.groupBoardPhoto.groupBoardPhoto3} ">
      			</c:if>
      		</c:if>
      		</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div>
	<p>리뷰 (<c:out value="${ foodCommentCount }"/>)</p>
	
	<c:if test="${  foodCommentList ne null and foodCommentList.size() ne 0 }">
				
		<c:forEach var="fc" items="${ foodCommentList }">
			<div class="d-flex justify-content-around">
				<c:if test="${ fc.foodCommentBlock eq 'unblock' }">
					<div >
						<img width="100px" height="100px" src="${path}/resources/upload/profile/${fc.user.profileImageFile}">
						<p><c:out value="${ fc.user.userNick }"/></p>
					</div>
					<div>
						<p><c:out value="${ fc.foodCommentDate }"/></p>
						<p><c:out value="${ fc.foodCommentStar }"/></p>
						<p><c:out value="${ fc.foodCommentContents }"/></p>
						<%-- <c:if test="${  }">
							<c:forEach var="" items="">
							<img width="100px" height="100px" src="">
						</c:forEach>
						</c:if> --%>
					</div>
				</c:if>
				<c:if test="${ fc.foodCommentBlock ne 'unblock' }">
					<p>관리자에 의해 제제된 게시글입니다</p>
				</c:if>
			</div>
		</c:forEach>
	</c:if>
	
	<c:if test="${  foodCommentList eq null or foodCommentList.size() eq 0 }">
		
		<div>
			<p>아직 등록된 리뷰가 없네요.</p>
			<p> 해당 식당의 첫 리뷰를 작성해주시겠어요? :)</p>
		</div>
	</c:if>
</div>
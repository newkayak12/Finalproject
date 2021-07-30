<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	/* #fr_profile_img:hover {
		border: 3px solid #7ee3e0;
		width : 71px;
		height : 71px;
	} */
	.gray {
		color : gray;
	}
</style>

<div>

	<p>리뷰 (<c:out value="${ foodCommentCount }"/>)</p>
	
	<c:if test="${  foodCommentList ne null and foodCommentList.size() ne 0 }">
				
		<c:forEach var="fc" items="${ foodCommentList }">
		
			<div class="d-flex justify-content-around p-3" style="border-top:1px solid gray;" onmouseenter="fn_in(event);" onmouseleave="fn_out(event);"> 
			
				<c:if test="${ fc.foodCommentBlock eq 'unblock' }">
				
					<div class="m-1" style="width:15%; text-align: center;">
						<a href="${path }/profile/open/${fc.user.userId}"><img id="fr_profile_img" style="border-radius:100%;" width="70px" height="70px" src="${path}/resources/upload/profile/${fc.user.profileImageFile}"></a>
						<p style="font-size:15px; font-weight:900;"><c:out value="${ fc.user.userNick }"/></p>
					</div>
					
					<div class="m-1" style="width:85%;">
					
						<span class="p-1 gray" style="font-size:15px;"><fmt:formatDate value="${ fc.foodCommentDate }" pattern="yyyy-MM-dd"/></span>
						
						<span class="mainColor">
							<c:choose>
								<c:when test="${ fc.foodCommentStar == 1.0 }"><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 2.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 3.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 4.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 5.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></c:when>
							</c:choose>
						</span>
						<span style="float:right; font-weight:900; font-size:20px;"><a href="" style="text-decoration:none; color : gray !important;">⋮</a></span> 
						
						<br>
						
						<div class="p-1">
							<p><c:out value="${ fc.foodCommentContents }"/></p>
							<c:if test="${ fc.foodPhoto1 ne null }">
									<img style="border-radius:10px;" width="100px" height="100px" src="${path }/resources/upload/foodComment/${fc.foodPhoto1 }">
							</c:if>
							<c:if test="${ fc.foodPhoto2 ne null }">
									<img width="100px" height="100px" src="${path }/resources/upload/foodComment/${fc.foodPhoto2 }">
							</c:if>
							<c:if test="${ fc.foodPhoto3 ne null }">
									<img width="100px" height="100px" src="${path }/resources/upload/foodComment/${fc.foodPhoto3 }">
							</c:if>
							<c:if test="${ fc.foodPhoto4 ne null }">
									<img width="100px" height="100px" src="${path }/resources/upload/foodComment/${fc.foodPhoto4 }">
							</c:if>
							<c:if test="${ fc.foodPhoto5 ne null }">
									<img width="100px" height="100px" src="${path }/resources/upload/foodComment/${fc.foodPhoto5 }">
							</c:if>
						</div>
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

<script>
	const fn_in = (e) => {
		$(e.target).css({
			"background-color" : "#f5f5f5"
		});
	}
	
	const fn_out = (e) => {
		$(e.target).css({
			"background-color" : ""
		});
	}
</script>
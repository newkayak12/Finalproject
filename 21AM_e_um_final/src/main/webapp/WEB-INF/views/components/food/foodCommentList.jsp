<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.gray { color : gray; }
.dropdown-toggle::after { display:none; }
#moreBtn { border : 0; outline : 0; background-color: transparent; }
.dropdown-menu { min-width: fit-content; /* transform: translate3d(500px, 1135px, 0px) !important; */ }
#fcreportModal .btn-danger { border-radius: 10px; }
/* 리뷰목록에 출력되는 이미지들  */
.fcImage { border-radius:10px; object-fit:cover; width:100px; height:100px; }
.fcMore { text-align:center;  border-top : 1px solid gray;}
.fcMore a { text-decoration: none; color : black; font-size : 17px;}
.fcl-content { font-weight:900; line-height:30px; letter-spacing :0.8px; font-size:15px; }
#fr_profile_img { border-radius:100%; width:65px; height:65px; }
</style>

<div id="foodCommentListDiv">

	<c:if test="${  foodCommentList ne null and fn:length(foodCommentList) ne 0 }">
		
		<!-- 반복문 start -->		
		<c:forEach var="fc" items="${ foodCommentList }">
		
			<div class="d-flex justify-content-around p-3" style="border-top:1px solid gray;" onmouseenter="fn_in(event);" onmouseleave="fn_out(event);"> 
			
				<c:if test="${ fc.foodCommentBlock eq 'unblock' }">
				
					<!-- 프사, 닉네임 -->
					<div class="m-1" style="width:15%; text-align: center;">
						<a href="${path }/profile/open/${fc.user.userId}"><img id="fr_profile_img" src="${path}/resources/upload/profile/${fc.user.profileImageFile}"></a>
						<p style="font-size:15px; font-weight:900;"><c:out value="${ fc.user.userNick }"/></p>
					</div>
					
					<!-- 작성날짜, 별점, 내용 -->
					<div class="m-1" style="width:85%;">
					
						<span class="p-1 gray pl-3" style="font-size:15px; font-weight:900;"><fmt:formatDate value="${ fc.foodCommentDate }" pattern="yyyy-MM-dd"/></span>
						
						<span class="mainColor">
							<c:choose>
								<c:when test="${ fc.foodCommentStar == 1.0 }"><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 2.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 3.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 4.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></c:when>
								<c:when test="${ fc.foodCommentStar == 5.0 }"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></c:when>
							</c:choose>
						</span>
						
						<!-- 신고 -->
						<button class="dropdown-toggle" data-toggle="dropdown"  id="moreBtn" style="float:right; font-weight:900; font-size:20px;">⋮</button> 
						
						
						<!-- ⋮ 클릭하면 나오는 메뉴 -->
						<div class="dropdown-menu">
							<c:if test="${ session.userId eq fc.user.userId }">
								<a class="dropdown-item" href="javascript:void(0);" onclick="location.assign('${ path }/food/updateFoodComment/start?foodCommentSeq=${fc.foodCommentSeq}');">
									<span id="fcUpdateBtn">수정</span>
								</a>
								<a class="dropdown-item" href="javascript:void(0);" onclick="fn_delFoodComment(`${fc.foodCommentSeq}`);">
									<span>삭제</span>
								</a>
							</c:if>
							<c:if test="${ session.userId ne fc.user.userId }">
								<a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#fcreportModal">
									<span class="moreDetail">신고</span>
								</a>
							</c:if>
						</div>
						
						<input type="hidden" id="hiddenFoodSeq" value="${fc.food.foodSeq }">
						<input type="hidden" id="hiddenTargetId" value="${ fc.user.userId }">
						<input type="hidden" id="hiddenFoodCommentSeq" value="${ fc.foodCommentSeq }">
						<input type="hidden" id="hiddenUserId" value="${ session.userId }">
						
						<br>
						
						<div class="pl-3 pt-1 pb-1 pr-5">
							<p class="fcl-content"><c:out value="${ fc.foodCommentContents }"/></p>
							
							<c:if test="${ fc.foodPhoto1 ne null }">
									<img onclick="fn_largeImg(event);" class="fcImage cursor" src="${path }/resources/upload/foodComment/${fc.foodPhoto1 }">
							</c:if>
							<c:if test="${ fc.foodPhoto2 ne null }">
									<img onclick="fn_largeImg(event);" class="fcImage cursor" src="${path }/resources/upload/foodComment/${fc.foodPhoto2 }">
							</c:if>
							<c:if test="${ fc.foodPhoto3 ne null }">
									<img onclick="fn_largeImg(event);" class="fcImage cursor" src="${path }/resources/upload/foodComment/${fc.foodPhoto3 }">
							</c:if>
							<c:if test="${ fc.foodPhoto4 ne null }">
									<img onclick="fn_largeImg(event);" class="fcImage cursor" src="${path }/resources/upload/foodComment/${fc.foodPhoto4 }">
							</c:if>
							<c:if test="${ fc.foodPhoto5 ne null }">
									<img onclick="fn_largeImg(event);" class="fcImage cursor" src="${path }/resources/upload/foodComment/${fc.foodPhoto5 }">
							</c:if>
						</div>
					</div>
					
				</c:if>
				
				<c:if test="${ fc.foodCommentBlock ne 'unblock' }">
					<p>관리자에 의해 제제된 게시글입니다</p>
				</c:if>
				
			</div>
			
		</c:forEach>
		
		<c:if test="${ foodCommentList ne null and fn:length(foodCommentList) ne 0 }">
			<%-- <c:if test="${ fn:length(foodCommentList) eq 5 }"> --%>
			<c:if test="${ cPage * 5 < totalFoodComment }">
				<div class="fcMore mainColor tway p-3">
					<a href="javascript:void(0)" onclick="moreList(event);">▾&nbsp;&nbsp;더보기&nbsp;&nbsp;▾</a>
				</div>
			</c:if>
		</c:if>
	</c:if>
	
	
	
	<%-- <c:if test="${  foodCommentList eq null or fn:length(foodCommentList) eq 0 }"> --%>
	<c:if test="${  totalFoodComment eq 0 }">
		<div>
			<p style="font-weight:900;">
				아직 등록된 리뷰가 없네요.<br>
				<span class="tway" style="color:#4a4a4a;"><c:out value="${ session.userNick }"/></span>님, 첫 리뷰를 작성해주시겠어요? &nbsp; :)
			</p>
			
		</div>
		
	</c:if>
	
</div>

<!-- 신고 모달창  -->
<div class="modal" id="fcreportModal">
	<div class="modal-dialog">
		<div class="modal-content">
				<div class="modal-header">
					<span class="mainColor tway" style="font-size:20px;">리뷰 신고하기</span>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<div class="modal-body">
					<p>신고사유를 적어주세요.<br>문제가 있는 게시글일 경우 관리자가 조치하도록 하겠습니다.</p>
					<textarea rows="5" style="width:100%;" id="reportContent"></textarea>
				</div>
	
				<div class="modal-footer">
					<button type="button" onclick="fn_repFoodComment();" class="btn btn-danger">신고하기</button>
				</div>
		</div>
	</div>
</div>

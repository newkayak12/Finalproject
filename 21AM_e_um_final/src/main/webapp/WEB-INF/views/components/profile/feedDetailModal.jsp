<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex flex-wrap" style="font-family:'Noto Sans Kr';">
	<div id="demo" class="carousel slide col-xl-6 p-3" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<c:if test="${feed.feedImage2!=null}">
				<li data-target="#demo" data-slide-to="1"></li>
			</c:if>
			<c:if test="${feed.feedImage3!=null}">
				<li data-target="#demo" data-slide-to="2"></li>
			</c:if>
		</ul>
		
		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active" style="background-color:black;">
				<div class="carouselImgDiv mx-auto">
					<img src="${path }/resources/upload/feed/${feed.feedImage1}" alt="피드 이미지 1" class="feedImg">
				</div>
			</div>
			<c:if test="${feed.feedImage2!=null}">
				<div class="carousel-item" style="background-color:black;">
					<div class="carouselImgDiv mx-auto">
						<img src="${path }/resources/upload/feed/${feed.feedImage2}" alt="피드 이미지 2" class="feedImg">
					</div>
				</div>
			</c:if>
			<c:if test="${feed.feedImage3!=null}">
				<div class="carousel-item" style="background-color:black;">
					<div class="carouselImgDiv mx-auto">
						<img src="${path }/resources/upload/feed/${feed.feedImage3}" alt="피드 이미지 3" class="feedImg">
					</div>
				</div>
			</c:if>
		</div>
		
		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

    <div id="feedCC" class="col-xl-6 my-3">
        <div id="feedBtn" class="d-flex align-content-center">
            <!-- 버튼 -->
            <div class="mr-auto d-flex align-content-center">
            	<c:set var="likeFlag" value="far"/>
            	<c:set var="likeLoop" value="false"/>
            	<c:forEach var="k" items="${like }">
            		<c:if test="${not likeLoop }">
            			<c:choose>
            				<c:when test="${k.likeFeedId==userSession.userId }">
            					<c:set var="likeFlag" value="fas"/>
            					<c:set var="likeLoop" value="true" />
			            	</c:when>
		            	</c:choose>
		            </c:if>
	            </c:forEach>
	            <c:choose>
	            	<c:when test="${likeFlag=='fas' }">
			            <i class="fas fa-heart pointer"></i>
	            	</c:when>
	            	<c:otherwise>
			            <i class="far fa-heart pointer"></i>
	            	</c:otherwise>
	            </c:choose>
	            <span class="ml-2 mr-4">${fn:length(like) }</span>
	            <i class="far fa-comment-alt"></i>
	            <span class="ml-2">${fn:length(comment) }</span>
            </div>
            <div style="font-size:14px;">
	            <span class="likeLink pointer">수정</span>
	            <span> | </span>
	            <span class="likeLink pointer">삭제</span>
            </div>
        </div>
        <div class="my-4 p-3" style="border:1px dotted #b8d8d7">
            <!-- 피드 내용 -->
            <div style="color:gray;">
            	<small><fmt:formatDate value="${feed.feedDate }" pattern="yy.MM.dd"/></small>
            </div><br>
            ${feed.feedContents }
        </div>
        <div>
            <!-- 덧글창 -->
            <div id="feedCommentShow">
                <!--덧글-->
				
				<c:if test="${fn:length(comment)!=0 }">
					<c:forEach var="c" items="${comment }">
						<c:choose>
							<c:when test="${c.feedCommentLevel>1 }">
				                <!--답글 폼-->
				                <div class="d-flex ml-5 mb-3">
				                    <img alt="프로필사진" class="commImg mr-2" src="${path }/resources/upload/profile/${c.commenterProfile}">
				                    <div class="mr-auto">
				                        <div>
				                            <span><b class="mr-2">${c.commenterNick }</b> ${c.feedCommentContents }</span>
				                        </div>
				                        <div>
				                            <small>
				                                <span><fmt:formatDate value="${c.feedCommentDate }" pattern="yy.MM.dd"/></span>
				                            </small>
				                        </div>
				                    </div>
				                    <div class="my-auto pointer">&times;</div>
				                </div>
							</c:when>
			                <c:otherwise>
				                <!--일반 덧글 폼-->
				                <div class="d-flex mb-3">
				                    <img alt="프로필사진" class="commImg mr-2" src="${path }/resources/upload/profile/${c.commenterProfile}">
				                    <div class="mr-auto">
				                        <div>
				                            <span><b class="mr-2">${c.commenterNick }</b> ${c.feedCommentContents }</span>
				                        </div>
				                        <div>
				                            <small>
				                                <span><fmt:formatDate value="${c.feedCommentDate }" pattern="yy.MM.dd"/></span>
				                                <span class="ml-1 mt-1 pointer likeLink"><b>답글 달기</b></span>
				                            </small>
				                        </div>
				                    </div>
				                    <div class="my-auto pointer">&times;</div>
				                </div>
			                </c:otherwise>
			        	</c:choose>
					</c:forEach>
				</c:if>
            </div>
            
            <form action="" method="" class="mt-3">
                <div class="d-flex">
                <!--덧글 입력-->
                    <input type="text" class="form-control">
                    <div class="input-group-append">
                        <button class="btn writeBtn" type="submit">작성</button>  
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:forEach var="feed" items="${list }" varStatus="i">
 <div class="col-12 mt-3 mb-3 p-0  border" id="feed-innerContainer">
	  			<!-- 누르면 프로필로 이동 -->
        <div class="d-flex flex-row justify-content-start col-12" style="max-height: 100px;" data-toggle="modal" data-target="#headerprofile" onclick="headerProfile('${feed.feederId}','${feed.feedProfilePhoto}','${feed.feedNick }','${feed.profileStatus }')">
            <img alt="프사" src="${pageContext.request.contextPath }/resources/upload/profile/${feed.feedProfilePhoto}"  class="m-2" style="width: 75px; height: 75px; border-radius: 100%;">
                <div class="d-flex flex-column justify-content-center col-7" >
                    <p class="mt-1 mb-1 m-0">${feed.feedNick }</p>
                    <p class="mt-1 mb-1 m-0"><fmt:formatDate value="${feed.feedDate }" pattern="yyyy년 MM월 dd일"/></p>
                </div>
         </div>
     <!-- feed-body -->
            <div class="col-12 d-flex flex-column justify-content-center align-items-center">   
                    
                   	<c:if test="${fn:length(feed.feedImage1)>0 }">
                        <div id="photoCarousel${index.get(i.index) }" class=" carousel slide mt-3 feedPhoto" data-ride="carousel"  >
                        
                                <ul class=" carousel-indicators">
                                <c:if test="${feed.feedImage1!=null }">
                                    <li data-target="#photoCarousel" data-slide-to="0" class="active"></li>
                                </c:if>
                                <c:if test="${feed.feedImage2!=null }">
                                    <li data-target="#photoCarousel" data-slide-to="1" ></li>
                                 </c:if>
                                 <c:if test="${feed.feedImage3!=null }">
                                    <li data-target="#photoCarousel" data-slide-to="2" ></li>
                                 </c:if>
                                </ul>

                                <div class="carousel-inner ">
									<c:if test="${feed.feedImage1!=null }">
	                                    <div class="carousel-item active d-flex justify-content-center" >
	                                        <img alt="사진1" src="${pageContext.request.contextPath }/resources/upload/feed/${feed.feedImage1}"  class="feedPhoto">
	                                    </div>
									</c:if>
									<c:if test="${feed.feedImage2!=null }">
	                                    <div class="carousel-item d-flex justify-content-center" >
	                                        <img alt="사진2" src="${pageContext.request.contextPath }/resources/upload/feed/${feed.feedImage2}" class="feedPhoto">
	                                    </div>
									</c:if>
									<c:if test="${feed.feedImage3!=null }">
	                                    <div class="carousel-item d-flex justify-content-center" >
	                                        <img alt="사진3" src="${pageContext.request.contextPath }/resources/upload/feed/${feed.feedImage3}" class="feedPhoto">
	                                    </div>
                                    </c:if>
	                                </div>
								<c:if test="${feed.feedImage2!=null }">
	                                <a class="carousel-control-prev" href="#photoCarousel${index.get(i.index) }" data-slide="prev">
	                                    <span class="carousel-control-prev-icon"></span>
	                                </a>
	                                <a class="carousel-control-next" href="#photoCarousel${index.get(i.index) }" data-slide="next">
	                                    <span class="carousel-control-next-icon"></span>
	                                </a>
                        		</c:if>

                        </div>
					</c:if>
						
		                        <div class="mt-4 col-11 p-0 mb-4 border">
		                            <div class="m-2 border pl-3">
		                                <c:choose>
		                                	<c:when test="${feed.feedLike!=null }"> 
				                                <img alt="좋아요" class="m-2" src="${pageContext.request.contextPath }/resources/images/user/thumbs-up-solid.svg" width="20px" onclick="fn_like('${index.get(i.index) }','${feed.feedSeq }', 'like')" id="likebtn${index.get(i.index)}" style="display:inline-block;">
				                                <img alt="좋아요" class="m-2" src="${pageContext.request.contextPath }/resources/images/user/thumbs-up-regular.svg" width="20px" onclick="fn_like('${index.get(i.index) }','${feed.feedSeq }', 'unlike')" id="unlikebtn${index.get(i.index)}" style="display: none">
		                                	</c:when>
		                                	<c:otherwise>
		                                		<img alt="좋아요" class="m-2" src="${pageContext.request.contextPath }/resources/images/user/thumbs-up-solid.svg" width="20px" onclick="fn_like('${index.get(i.index) }','${feed.feedSeq }', 'like')" id="likebtn${index.get(i.index)}" style="display: none">
				                                <img alt="좋아요" class="m-2" src="${pageContext.request.contextPath }/resources/images/user/thumbs-up-regular.svg" width="20px" onclick="fn_like('${index.get(i.index) }','${feed.feedSeq }', 'unlike')" id="unlikebtn${index.get(i.index)}" style="display: inline-block;">
		                                	</c:otherwise>
		                                </c:choose>
		                                		<img alt="신고"  class="m-2"  src="${pageContext.request.contextPath }/resources/images/user/siren.png" width="20px" onclick="fn_report('${feed.feedSeq }', '${feed.feederId }','${userSession.userId }')" data-toggle="modal" data-target="#ReportModal">
		                            </div>
		                            <div id="contents-box" class="m-2  text-center border" style="overflow-wrap: break-word;">
		                            	<div class="m-2" >
		                                	${feed.feedContents}
		                                </div>
		                            	<div class="m-2">
		                            		<input type="text" id="comment${index.get(i.index) }" class="col-9 col-md-9 col-lg-9"   onkeyup="enterrepl('${feed.feedSeq}','comment${index.get(i.index) }', 'commentbox${index.get(i.index) }')">
		                            		<input type="button" value="입력" class="small"  onclick="repl('${feed.feedSeq}','comment${index.get(i.index) }', 'commentbox${index.get(i.index) }')">
		                            	</div>
		                            </div>
		                        </div>
                        
            </div>
     <!-- feed-footer -->
     		<div class="d-flex justify-content-center">
     			
	     		<div  class="text-center  col-8 justify-content-start p-0" id="commentbox${index.get(i.index) }" >
	     			<c:forEach items="${feed.commentlist }" var="comment" >
	     				<c:choose>
	     					<c:when test="${comment.feedCommentLevel>1 }">
	     						<div class="ml-5  border" id="replcomment${comment.feedCommentSeq}">
		     						<div class="text-left pl-2 pr-2 d-flex justify-content-between">	
	     								<div class="col-10">
									           <img src="${pageContext.request.contextPath}/resources/upload/profile/${comment.commenterProfile}" alt="프사" width="25px" height="25px" style="border-radius: 100%;"  id="commentPhoto">
									        <span class="ml-1 mr-2 p-0" id="commenterId">
									        	${comment.commenterNick }
									        </span>
									        <span>
									        	<c:if test="${comment.commenter != userSession.userId}">
									        	<img alt="신고"  class="m-2"  src="${pageContext.request.contextPath }/resources/images/user/siren.png" width="20px" onclick="fn_report('${comment.feedCommentSeq }', '${comment.commenter }','${userSession.userId }')" data-toggle="modal" data-target="#ReportModal">
									        	</c:if>
									        </span>
								        </div>
								        <c:if test="${comment.commenterNick == userSession.userNick }">
									        <div class="col-1" onclick="fn_commentdel('${comment.feedCommentSeq}')">
									        
									       		 X
									        </div>
								        </c:if>
							        </div>
								        
							        <p class="ml-2 mr-2 pl-1 pr-1" style="word-wrap: break-word;" id="comments">
							          ${comment.feedCommentContents }
							        </p>
							   </div>
	     					</c:when>
	     					<c:otherwise>
		     					<div class="ml-1  border" id="replcomment${comment.feedCommentSeq}">
	     							<div class="text-left pl-2 pr-2 d-flex justify-content-between">	
	     								<div class="col-10">
									           <img src="${pageContext.request.contextPath}/resources/upload/profile/${comment.commenterProfile}" alt="프사" width="25px" height="25px" style="border-radius: 100%;"  id="commentPhoto">
									        <span class="ml-1 mr-2 p-0" id="commenterId">
									        	${comment.commenterNick }
									        </span>
									       <span>
									        		<c:if test="${comment.commenter != userSession.userId}">
									        	<img alt="신고"  class="m-2"  src="${pageContext.request.contextPath }/resources/images/user/siren.png" width="20px" onclick="fn_report('${comment.feedCommentSeq }', '${comment.commenter }','${userSession.userId }')" data-toggle="modal" data-target="#ReportModal">
									        	</c:if>
									        </span>
								        </div>
								        <c:if test="${comment.commenterNick == userSession.userNick }">
									        <div class="col-1" onclick="fn_commentdel('${comment.feedCommentSeq}')">
									        
									       		 X
									        </div>
								        </c:if>
							        </div>
							        
							        <p class="ml-2 mr-2 pl-1 pr-1" style="word-wrap: break-word;" id="comments">
							          ${comment.feedCommentContents }
							        </p>
							   </div>
	     					</c:otherwise>
	     				</c:choose>
	     			</c:forEach>
	     		</div>
	           
            </div>
    </div>
    
    </c:forEach>
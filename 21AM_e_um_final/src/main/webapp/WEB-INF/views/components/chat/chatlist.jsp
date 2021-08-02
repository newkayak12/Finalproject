<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- chat == chatRoom i=chats j,z =sender -->
<c:forEach items="${chat }" var="i">

	<div class="d-flex justify-content-between border mt-2 p-1" style="background-color: white" onclick="fn_startChat('${i.chatRoomSeq }','${i.chatrommId1}','${i.chatrommId2}')">
	
        <div>
        	<c:set var="photo_loop" value="true"/>
        	<c:set var="photo_loop_go" value="true"/>
        	<c:forEach items="${i.chats }" var='j' >
        	
        	<c:choose>
	        	<c:when  test="${ userSession.userNick!=j.chatSender.userNick }">
	        		<c:set var="photo_loop" value="true"/>
	        	</c:when>
	        	<c:otherwise>
		        	<c:set var="photo_loop" value="false"/>
	        	</c:otherwise>
        	</c:choose>
        	
	        	<c:if test="${photo_loop_go and photo_loop}">
	           		 <img alt="사진" style="height: 60px; width:60px; object-fit: cover; border-radius: 100%;" src="${pageContext.request.contextPath}/resources/upload/profile/${j.chatSender.profileImageFile } ">
	           		 <c:set var="photo_loop_go" value="false"/>
	           	</c:if>	 
            </c:forEach>
        </div>
        
        <div class="col-9 p-0 my-auto">
                <div class="d-flex justify-content-between">
                
                
                <c:set var="nick_loop" value="true"/>
                <c:set var="nick_loop_go" value="true"/>
                
                <c:forEach items="${i.chats }" var='z'>
                
	        	<c:choose>
		        	<c:when  test="${ userSession.userNick!=z.chatSender.userNick }">
		        		<c:set var="nick_loop" value="true"/>
		        	</c:when>
		        	<c:otherwise>
			        	<c:set var="nick_loop" value="false"/>
		        	</c:otherwise>
        		</c:choose>
	        	
	        	<c:if test="${nick_loop and nick_loop_go }">
                    <span class="mr-auto small"><b>${z.chatSender.userNick }</b></span>
					<c:set var="nick_loop_go" value="false"/>
                   
	           	</c:if>	 
            </c:forEach>
                    <span class="ml-2" style="color:gray;"><small>${i.chats[0].chatSendTime }</small></span> 
                </div>
                <div class="text-right">
                    <small>${i.chats[0].chatContent }</small>
                </div>
        </div>
    </div>
 </c:forEach>
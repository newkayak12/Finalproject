<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- chat == chatRoom i=chats j,z =sender -->
<c:forEach items="${chat }" var="i">

	<div class="d-flex justify-content-between border mt-2 p-1" style="background-color: white" onclick="fn_startChat('${i.chatRoomSeq }','${i.chatrommId1}','${i.chatrommId2}')">
	
        <div>
        	<c:forEach items="${i.chats }" var='j'>
        	
	        	<c:if test="${ userSession.userNick!=j.chatSender.userNick }">
	           		 <img alt="사진" style="height: 60px; width:60px; object-fit: cover; border-radius: 100%;" src="${pageContext.request.contextPath}/resources/upload/profile/${j.chatSender.profileImageFile } ">
	           	</c:if>	 
            </c:forEach>
        </div>
        
        <div class="col-9 p-0 my-auto">
                <div class="d-flex justify-content-between">
                
                
                <c:forEach items="${i.chats }" var='z'>
	        	<c:if test="${ userSession.userNick!=z.chatSender.userNick }">
                    <span class="mr-auto"><b>${z.chatSender.userNick }</b></span>                    
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
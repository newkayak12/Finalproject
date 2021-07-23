<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Modal body -->
<div class="modal-body d-flex align-items-center">
     <img src="${path }/resources/upload/profile/${friend.profileImageFile}" class="col w-50 h-100">
     <div class="col">
     	<h4><b><b>${friend.userNick }</b></b></h4><br>
     	<div>
	     	${friend.profileStatus }
     	</div><br><br><br>
     	<small><b>
     		<div class="d-flex flex-wrap">
		     	<span class="mx-1">
		        	<c:if test="${friend.interest.profileInterestName1 !=null}">
		        		${friend.interest.profileInterestName1 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${friend.interest.profileInterestName2 !=null}">
		        		${friend.interest.profileInterestName2 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${user.interest.profileInterestName3 !=null}">
		        		${friend.interest.profileInterestName3 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${user.interest.profileInterestName4 !=null}">
		        		${friend.interest.profileInterestName4 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${user.interest.profileInterestName5 !=null}">
		        		${friend.interest.profileInterestName5 }
		        	</c:if>
		       	</span>
     		</div>
     	</b></small>
     </div>
</div>

<!-- Modal footer -->
<div class="modal-footer justify-content-center">
    <button type="button" class="btn btn-info mx-2" data-dismiss="modal" value="${friend.userId }">프로필로 이동</button>
    <button type="button" id="applyFriend" class="btn btn-info mx-2" value="${friend.userId }" data-dismiss="modal">친구 신청</button>
</div>



<script>
	$("#applyFriend").click(e=>{
		let friendNick="${friend.userNick}";
		if(confirm(friendNick+"님에게 친구 신청을 하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/friend/applyfriend/start",
				data:{
					"friendId":e.target.value
				},
				success:data=>{
					if(data>0){
						alert("친구 신청이 완료되었습니다.");
					}else{
						alert("친구 신청에 실패했습니다.");
					}
				}
			})
		}
	})
</script>
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
     	<c:if test="${friend.profileStatus!=null }">
	     	<div class="bg-light py-2 pl-2">
		     	${friend.profileStatus }
	     	</div>
     	</c:if><br><br><br>
     	<small><b>
     		<div class="d-flex flex-wrap">
		     	<span class="mx-1">
		        	<c:if test="${friend.interest.profileInterestName1 !=null}">
		        		#${friend.interest.profileInterestName1 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${friend.interest.profileInterestName2 !=null}">
		        		#${friend.interest.profileInterestName2 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${friend.interest.profileInterestName3 !=null}">
		        		#${friend.interest.profileInterestName3 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${friend.interest.profileInterestName4 !=null}">
		        		#${friend.interest.profileInterestName4 }
		        	</c:if>
		       	</span>
		       	<span class="mx-1">
		        	<c:if test="${friend.interest.profileInterestName5 !=null}">
		        		#${friend.interest.profileInterestName5 }
		        	</c:if>
		       	</span>
     		</div>
     	</b></small>
     </div>
</div>

<!-- Modal footer -->
<div class="modal-footer d-flex justify-content-between">
	<a href="#" id="reportPop" data-toggle="hover" data-placement="bottom" data-content="신고">
        <button type="button" class="btn btn-light btn-sm" style="border-radius: 10px;" onclick="userReport('${friend.userId}')">
        	<img alt="신고"  class="m-2"  src="${pageContext.request.contextPath }/resources/images/user/siren.png" width="20px" data-toggle="modal" data-target="#ReportModal">
        </button>
    </a>
    <div>
	    <button type="button" id="openProfile" class="btn cancelBtn mx-2" data-dismiss="modal" value="${friend.userId }">프로필로 이동</button>
	    <c:if test="${friend.userId!=userSession.userId }">
	    	<!-- 차단된 친구는 친구 신청 버튼 볼 수 없게 설정, 이미 친구를 신청한 경우 친구 요청 중으로 띄우고 버튼 사용 불가로, 친구인 경우 친구라고 띄우고 버튼 사용 불가로 -->
	    	<c:choose>
	    		<c:when test="${friFlag eq 'applyFri' }">
	       			<button type="button" id="applyFriend" class="btn checkBtn mx-2" data-dismiss="modal" value="${friend.userId }">친구 신청</button>
	       		</c:when>
	       		<c:when test="${friFlag eq 'friend' }">
	       			<button type="button" class="btn disableBtn mx-xs-2" disabled><i class="fas fa-check mr-2"></i>친구</button>
	       		</c:when>
	       		<c:when test="${friFlag eq 'alreadyApply' }">
	       			<button type="button" class="btn disableBtn mx-xs-2" disabled>친구 요청됨</button>
	       		</c:when>
	       		<c:when test="${friFlag eq 'acceptFri' }">
	       			<button type="button" id="acceptFriend" class="btn checkBtn mx-2" data-dismiss="modal" value="${friend.userId }">친구 수락</button>
	       		</c:when>
	       	</c:choose>
		</c:if>
    </div>
</div>

<script>
	$("#applyFriend").click(e=>{
		let friendNick="${friend.userNick}";
		if(confirm(friendNick+"님에게 친구 신청을 하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/friend/applyfriend/start",
				data:{
					"friendId":e.target.value,
					"flag":"apply"
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
	
	$("#acceptFriend").click(e=>{
		let friendNick="${friend.userNick }";
		if(confirm(friendNick+"님의 친구 신청을 수락하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/friend/applyfriend/start",
				data:{
					"friendId":e.target.value,
					"flag":"accept"
				},
				success:data=>{
					if(data>0){
						alert("서로 친구가 되었습니다!");
					}else{
						alert("친구 신청 수락을 실패했습니다.");
					}
				}
			})
		}
	})
	
	$("#openProfile").click(e=>{
		let profileId=e.target.value;
		location.assign("${pageContext.request.contextPath}/profile/open/"+profileId);
	})
	
	$("#reportPop").popover({ trigger: "hover" });
	
	function userReport(friendId){
    	let userReportId = friendId;
    	let userReportMyId = '${userSession.userId}';
    	let userReportContent = "사용자 신고"
    	let userReportTargetContent = 'profile';
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/report/reportprifile",
    		data:{userIdShooter:userReportMyId , userIdTarget:userReportId , reportContents:userReportContent, reportTargetContent: userReportId}, 
    		success:data=>{
    			if(data>0){
  					alert('신고가 완료되었습니다.')
  				}
    		}
    	})
    }
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Nav tabs -->
<ul id="friendTab" class="nav nav-tabs nav-fill tway"  role="tablist">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#myFriendList">내 친구 목록</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#applyFriendList">친구 신청 목록</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#address">차단 친구 목록</a>
    </li>
</ul>

<!-- Tab panes -->
<div class="tab-content my-5">
    <div class="tab-pane container active" id="myFriendList">
    	<div>총 <b>${fn:length(friendList) }</b>명</div>
    	<input class="form-control" id="myFriendListInput" type="text" placeholder="내 친구 검색">
    	<div class="scrollDiv2">
	        <table class="table table-hover">
			    <colgroup>
			    	<col class="col-2">
			    	<col class="col-3">
			    	<col class="col-5">
			    	<col class="col-2">
			    </colgroup>
			    <tbody id="myFriendListTable">
			    	<c:if test="${!empty friendList }">
			    		<c:forEach var="f" items="${friendList }">
			    			<tr class="infobold">
						   		<td class="colcenter pointer align-middle" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${f['USER_ID'] }')">
						   			<img src="${path }/resources/upload/profile/${f['PROFILE_IMAGE_FILE'] }" alt="프로필 사진" class="commImg">
						   		</td>
								<td class="align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${f['USER_ID'] }')">
									${f['USER_NICK'] }
								</td>
								<td class="align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${f['USER_ID'] }')">
									${f['PROFILE_STATUS'] }
								</td>
								<td class="colcenter align-middle"><button class="cancelBtn btn" onclick="fn_blockFriend('${f['USER_ID'] }','${f['USER_NICK'] }');">차단</button></td>
					  		</tr>
				 		</c:forEach>
			    	</c:if>
			    	<c:if test="${empty friendList }">
			    		<tr>
			    			<td colspan="4">아직 친구가 없어요. 마음 맞는 새 친구를 찾아보세요!</td>
			    		</tr>
			    	</c:if>
			    </tbody>
			</table>
    	</div>
    </div>

    <div class="tab-pane container fade" id="applyFriendList">
    	<div>친구 신청 <b>${fn:length(applyFriendList) }</b>개</div>
        <div class="scrollDiv2">
	        <table class="table table-hover">
			    <colgroup>
			    	<col class="col-2">
			    	<col class="col-3">
			    	<col class="col-5">
			    	<col class="col-2">
			    </colgroup>
			    <tbody>
			    	<c:if test="${!empty applyFriendList }">
			    		<c:forEach var="af" items="${applyFriendList }">
			    			<tr class="infobold">
						   		<td class="colcenter pointer align-middle" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${af['USER_ID'] }')">
						   			<img src="${path }/resources/upload/profile/${af['PROFILE_IMAGE_FILE'] }" alt="프로필 사진" class="commImg">
						   		</td>
								<td class="align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${af['USER_ID'] }')">
									${af['USER_NICK'] }
								</td>
								<td class="align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${af['USER_ID'] }')">
									${af['PROFILE_STATUS'] }
								</td>
								<td class="colcenter align-middle"><button class="cancelBtn btn" onclick="fn_appendFriend('${af['USER_ID'] }','${af['USER_NICK'] }');">수락</button></td>
					  		</tr>
				 		</c:forEach>
			    	</c:if>
			    	<c:if test="${empty applyFriendList }">
			    		<tr>
			    			<td colspan="4">친구 신청이 없습니다.</td>
			    		</tr>
			    	</c:if>
			    </tbody>
			</table>
    	</div>
    </div>

    <div class="tab-pane container fade" id="address">
    	<div>차단 친구 <b>${fn:length(applyFriendList) }</b>명</div>
        <div class="scrollDiv2">
	        <table class="table table-hover">
			    <colgroup>
			    	<col class="col-2">
			    	<col class="col-3">
			    	<col class="col-5">
			    	<col class="col-2">
			    </colgroup>
			    <tbody id="myFriendListTable">
			    	<c:if test="${!empty friendList }">
			    		<c:forEach var="f" items="${friendList }">
			    			<tr class="infobold">
						   		<td class="colcenter pointer align-middle" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${f['USER_ID'] }')">
						   			<img src="${path }/resources/upload/profile/${f['PROFILE_IMAGE_FILE'] }" alt="프로필 사진" class="commImg">
						   		</td>
								<td class="align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${f['USER_ID'] }')">
									${f['USER_NICK'] }
								</td>
								<td class="align-middle pointer" onclick="location.assign('${pageContext.request.contextPath}/profile/open/${f['USER_ID'] }')">
									${f['PROFILE_STATUS'] }
								</td>
								<td class="colcenter align-middle"><button class="cancelBtn btn" onclick="fn_blockFriend('${f['USER_ID'] }');">차단</button></td>
					  		</tr>
				 		</c:forEach>
			    	</c:if>
			    	<c:if test="${empty friendList }">
			    		<tr>
			    			<td colspan="4">아직 친구가 없어요. 마음 맞는 새 친구를 찾아보세요!</td>
			    		</tr>
			    	</c:if>
			    </tbody>
			</table>
    	</div>
    </div>
</div>

<script>
	$(document).ready(function(){
	  $("#myFriendListInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myFriendListTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	
	function fn_blockFriend(friendId, friendNick){
		if(confirm(friendNick+"님을 차단하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user/mypage/blockFriend",
				data:{"friendId":friendId},
				success:data=>{
					if(data>0){
						alert("차단되었습니다.");
						$("#myPageModal").modal("hide");
						fn_openMPModal("friend");
					}else{
						alert("차단되지 않았습니다.");
					}
				}
			})
		}
	}
	
	function fn_appendFriend(friendId, friendNick){
		if(confirm(friendNick+"님의 친구 신청을 수락하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/friend/applyfriend/start",
				data:{
					"friendId":friendId,
					"flag":"accept"
				},
				success:data=>{
					if(data>0){
						alert("서로 친구가 되었습니다!");
						$("#myPageModal").modal("hide");
						fn_openMPModal("friend","친구 신청 목록");
					}else{
						alert("친구 신청 수락을 실패했습니다.");
					}
				}
			})
		}
	}
</script>
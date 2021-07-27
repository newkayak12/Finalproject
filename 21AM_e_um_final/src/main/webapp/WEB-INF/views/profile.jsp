<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="<c:url value="${path }/resources/css/hyelin.css" />" rel="stylesheet">
    
    
<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
		<div id="profileInfo" class="d-flex justify-content-center flex-wrap">
		    <img src="${path }/resources/upload/profile/${profileInfo.profileImageFile}" alt="프로필 사진" class="mr-md-5">
		    <div id="infoList" class="mt-4 mx-md-5">
		        <table class="table table-borderless table-responsive mb-0 table-sm">
		            <tbody>
			            <colgroup>
				            <col class="col-2">
				            <col class="col-5">
				        </colgroup>
		              <tr class="space">
		                <td colspan="2"><h3><b style="color: rgb(32, 132, 190);">${profileInfo.userNick }</b></td>
		              </tr>
		              <tr>
		                <td><b>지역</b></td>
		                <td>${fn:substring(profileInfo.userAddrBasic,0,3) }</td>
		              </tr>
		              <tr>
		                <td><b>성별</b></td>
		                <td>
		                	<c:if test="${profileInfo.userGender=='M' }">
		                		남성
		                	</c:if>
		                	<c:if test="${profileInfo.userGender=='F' }">
		                		여성
		                	</c:if>
		                </td>
		              </tr>
		              <tr>
		                <td><b>한마디</b></td>
		                <td>${profileInfo.profileStatus }</td>
		              </tr>
		              <tr>
		                <td><b>관심사</b></td>
		                <td class="d-flex flex-wrap">
		                	<span class="mx-1">
				           	<c:if test="${profileInfo.interest.profileInterestName1 !=null}">
				           		<c:out value="${profileInfo.interest.profileInterestName1 }"/>
				           	</c:if>
				          	</span>
				          	<span class="mx-1">
				           	<c:if test="${profileInfo.interest.profileInterestName2 !=null}">
				           		<c:out value="${profileInfo.interest.profileInterestName2 }"/>
				           	</c:if>
				          	</span>
				          	<span class="mx-1">
				           	<c:if test="${profileInfo.interest.profileInterestName3 !=null}">
				           		<c:out value="${profileInfo.interest.profileInterestName3 }"/>
				           	</c:if>
				          	</span>
				          	<span class="mx-1">
				           	<c:if test="${profileInfo.interest.profileInterestName4 !=null}">
				           		<c:out value="${profileInfo.interest.profileInterestName4 }"/>
				           	</c:if>
				          	</span>
				          	<span class="mx-1">
				           	<c:if test="${profileInfo.interest.profileInterestName5 !=null}">
				           		<c:out value="${profileInfo.interest.profileInterestName5 }"/>
				           	</c:if>
				          	</span>
		                </td>
		              </tr>
		            </tbody>
		        </table>
		    </div>
		    <div id="profileBtn" class="ml-md-5 mt-4 ">
		    	<!-- 차단된 친구는 친구 신청 버튼 볼 수 없게 설정, 이미 친구를 신청한 경우 친구 요청 중으로 띄우고 버튼 사용 불가로, 친구인 경우 친구라고 띄우고 버튼 사용 불가로 -->
		    	<!-- 일단 본인 프로필이면 안나오게 해야 함 -->
		        <button type="button" id="applyFriend" class="btn btn-outline-info mx-xs-2" value="${profileInfo.userId }">친구 신청</button>
		        <a href="#" id="reportPop" data-toggle="hover" data-placement="bottom" data-content="신고">
					<button type="button" class="btn btn-outline-danger"><i class="fas fa-exclamation"></i></button>
				</a>
		    </div>
		</div>
		
		<div id="profileGuestBook" class="mx-md-5 mt-5 px-md-5">
		    <span class="float-left mt-5" style="font-family: twayair;"><h4>방명록</h4></span>
		    <!-- 차단된 친구는 친구 신청 버튼 볼 수 없게 설정 -->
		    <span class="float-right  mt-5">
		    	<button type="button" class="btn btn-outline-dark btn-sm" onclick="fn_openWriteModal('guestbook');"><b><i class="fas fa-pencil-alt mr-2"></i>방명록 쓰기</b></button>
		    </span>
		    
		    <table class="table table-borderless mb-0 table-sm">
		        <colgroup>
		            <col class="col-8">
		            <col class="col-2">
		            <col class="col-2">
		        </colgroup>
		        <tbody>
		        	<c:if test="${!empty guestbookList }">
		        		<c:forEach var="g" items="${guestbookList }">
					    	<tr>
					    		<td>${g.guestbookComment }</td>
					            <td class="colend">${g.userIdWriter }</td>
					            <td class="colend"><fmt:formatDate value="${g.guestbookDate }" pattern="yy/MM/dd"/></td>
					   		</tr>
				   		</c:forEach>
		        	</c:if>
		        	<c:if test="${empty guestbookList }">
		        		<tr>
		        			<td colspan="3">첫번째 방명록의 주인공이 되어보세요!</td>
		        		</tr>
		        	</c:if>
		        </tbody>
		    </table>
		    <span class="float-right mb-5"><button type="button" class="btn btn-outline-light text-dark btn-sm">> 더보기</button></span>
		</div>
		
		<div id="profileFeed" class="px-5 mt-5"><hr>
		    <div class="container d-flex justify-content-end mt-5">
		    	<%-- <c:if test="${profileInfo.userId==userId }"> --%>
			        <span class="mb-3">
			        	<button type="button" class="btn btn-outline-dark btn-sm" onclick="fn_openWriteModal('feed');"><b><i class="fas fa-pencil-alt mr-2"></i>글쓰기</b></button>
			        </span>
		        <%-- </c:if> --%>
		    </div>
		    <div id="feedContainer" class="row p-auto">
		        
		    </div>
		</div>
	</div>
	
	<!-- 방명록, 피드 글쓰기 모달 -->
	<div class="modal" id="writeModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title"></h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</section>

<script>
	$("#applyFriend").click(e=>{
		let friendNick="${profileInfo.userNick }";
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
	
	$(function(){
	    let index=0;
	    let profileId="${profileInfo.userId }";
	    
	    fetchlist();
	    
	    $(window).scroll(function(){
	        let $window=$(this);
	        let scrollTop=$window.scrollTop();
	        let windowHeight=$window.height();
	        let documentHeight=$(document).height();
	        if(scrollTop+windowHeight+1>=documentHeight){
	            setTimeout(fetchlist,200);
	        }
	    })
	    
	    function fetchlist(){
	   	 index++;
	        $.ajax({
	            type: "get",
	            url: "${pageContext.request.contextPath}/profile/infiniteFeedScroll",
	            data:{
	            	"index":index,
	            	"profileId":profileId
	            	},
	            success: data=>{
	           		$("#feedContainer").append(data);
	            }
	        })
	    }
	})
	
	$("#reportPop").popover({ trigger: "hover" });
	
	function fn_openWriteModal(flag){
		let profileId="${profileInfo.userId }";
		
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/profile/write/start",
			data:{
				"flag":flag,
				"profileId":profileId
				},
			success: data=>{
				if(flag=="guestbook"){
					$("#writeModal .modal-title").html("<b>방명록</b>");
				}else{
					$("#writeModal .modal-title").html("<b>피드</b>");
				}
				$("#writeModal .modal-body").html(data);
				$("#writeModal").modal("show");
			}
		})
	}
</script>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
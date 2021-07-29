<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:forEach var="u" items="${list }">
	<div class="friUser col-sm-6 col-lg-4 mb-5">
	    <button class="container btn btn-outline-light align-items-center text-dark d-flex p-2 mh-100" data-toggle="modal" onclick="fn_openModal('${u.userId }');">
	        <img src="${path }/resources/upload/profile/${u.profileImageFile}" class="frismImg col mw-75 mh-100">
	        <div class="col">
	        	<div><h5><b><c:out value="${u.userNick }"/></b></h5></div><br>
	        	<small><b>
	        		<div class="d-flex flex-wrap">
			          	<span class="mx-1">
			           	<c:if test="${u.interest.profileInterestName1 !=null}">
			           		<c:out value="${u.interest.profileInterestName1 }"/>
			           	</c:if>
			          	</span>
			          	<span class="mx-1">
			           	<c:if test="${u.interest.profileInterestName2 !=null}">
			           		<c:out value="${u.interest.profileInterestName2 }"/>
			           	</c:if>
			          	</span>
			          	<span class="mx-1">
			           	<c:if test="${u.interest.profileInterestName3 !=null}">
			           		<c:out value="${u.interest.profileInterestName3 }"/>
			           	</c:if>
			          	</span>
			          	<span class="mx-1">
			           	<c:if test="${u.interest.profileInterestName4 !=null}">
			           		<c:out value="${u.interest.profileInterestName4 }"/>
			           	</c:if>
			          	</span>
			          	<span class="mx-1">
			           	<c:if test="${u.interest.profileInterestName5 !=null}">
			           		<c:out value="${u.interest.profileInterestName5 }"/>
			           	</c:if>
			          	</span>
	        		</div>
	        	</b></small>
	        </div>
	    </button>
	</div>
</c:forEach>

<script>
	function fn_openModal(profileId){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/friend/openmodal/start",
			data:{"profileId":profileId},
			success:data=>{
				$("#userInfoModal").html(data);
				$('#friSmModal').modal("show");
			}
		})
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:if test="${list.size()!=0 }">
	<c:forEach var="u" items="${list }">
		<div class="friUser col-sm-6 col-lg-4 mb-5">
		    <button class="container btn btn-outline-light align-items-center text-dark d-flex p-2 mh-100" data-toggle="modal" title="${u.userId }">
		        <img src="${path }/resources/upload/profile/${u.profileImageFile}" class="frismImg col mw-75 mh-100" title="${u.userId }">
		        <div class="col" title="${u.userId }">
		        	<div><h5 title="${u.userId }"><b><c:out value="${u.userNick }"/></b></h5></div><br>
		        	<small><b>
		        		<div class="d-flex flex-wrap" title="${u.userId }">
				          	<span title="${u.userId }" class="mx-1">
				           	<c:if test="${u.interest.profileInterestName1 !=null}">
				           		<c:out value="${u.interest.profileInterestName1 }"/>
				           	</c:if>
				          	</span>
				          	
				          	<span title="${u.userId }" class="mx-1">
				           	<c:if test="${u.interest.profileInterestName2 !=null}">
				           		<c:out value="${u.interest.profileInterestName2 }"/>
				           	</c:if>
				          	</span>
				          	<span title="${u.userId }" class="mx-1">
				           	<c:if test="${u.interest.profileInterestName3 !=null}">
				           		<c:out value="${u.interest.profileInterestName3 }"/>
				           	</c:if>
				          	</span>
				          	<span title="${u.userId }" class="mx-1">
				           	<c:if test="${u.interest.profileInterestName4 !=null}">
				           		<c:out value="${u.interest.profileInterestName4 }"/>
				           	</c:if>
				          	</span>
				          	<span title="${u.userId }" class="mx-1">
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
</c:if>

<c:if test="${list.size()==0 }">
	<div class="ml-5 pl-5 mb-5"><span><b>검색 결과가 없습니다.</b></span></div>
</c:if>

<script>
	$(".friUser").click(e=>{
		/* console.log(e.target);
		console.log(e.target.title); */
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/friend/openmodal/start",
			data:{"userId":e.target.title},
			success:data=>{
				$("#userInfoModal").html(data);
				$('#friSmModal').modal("show");
			}
		})
	})
</script>
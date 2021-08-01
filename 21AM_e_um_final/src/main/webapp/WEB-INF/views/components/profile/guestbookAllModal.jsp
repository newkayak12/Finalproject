<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table class="table table-borderless">
    <colgroup>
        <col class="col-7">
        <col class="col-2">
        <col class="col-2">
        <c:if test="${userSession.userId==profileId }">
	        <col class="col-1">
        </c:if>
    </colgroup>
    <thead class="thead-light">
      <tr>
        <th class="colcenter">CONTENT</th>
        <th class="colcenter">WRITER</th>
        <th class="colcenter">DATE</th>
        <th> </th>
      </tr>
    </thead>
    <tbody>
    	<c:if test="${!empty gbList }">
    		<c:forEach var="g" items="${gbList }">
			   	<tr>
			   		<td>${g['GUESTBOOK_COMMENT'] }</td>
					<td class="colcenter">${g['USER_NICK'] }</td>
					<td class="colcenter"><fmt:formatDate value="${g['GUESTBOOK_DATE'] }" pattern="yy/MM/dd"/></td>
					<c:if test="${userSession.userId==profileId or userSession.userId==g['USER_ID_WRITER'] }">
						<td class="colcenter pointer" onclick="fn_deleteGb('${g['GUESTBOOK_SEQ'] }');">&times;</td>
					</c:if>
		  		</tr>
	 		</c:forEach>
    	</c:if>
    	<c:if test="${empty gbList }">
    		<tr>
    			<td colspan="4">첫번째 방명록의 주인공이 되어보세요!</td>
    		</tr>
    	</c:if>
    </tbody>
</table>

<nav aria-label="Page navigation example">
	 ${pageBar }
</nav>

<script>
	function fn_deleteGb(gbSeq){
		if(confirm("방명록을 삭제하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/profile/deleteGb",
				data:{"gbSeq":gbSeq},
				success:data=>{
					if(data>0){
						alert("방명록이 삭제되었습니다.");
					}else{
						alert("방명록이 삭제되지 않았습니다.");
					}
					fn_openGuestbookModal('${profileId}');
				}
			})
		}
	};
</script>
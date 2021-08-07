<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
	$(function(){
		reportcheck();
	})
	function reportcheck(){
		$.ajax({
			url : "${path}/group/checkCommentReport",
			data : {
				"groupCommentSeq" : "${comment.groupCommentSeq}",
				"userId" : "${userSession.userId}"
			},
			success : data=>{
				console.log(data);
				
			}
		})
	}
</script>
    <c:forEach var="i" items="${commentlist }">
    	<tr>
    		<td class="contents"><c:out value="${i.groupCommentContents }"/></td>
    		<td class="userId"><c:out value="${i.groupCommentUser.userId }"/></td>
    		<td class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${i.groupCommentDate }"/></td>
    		<td>
    		<c:if test="${i.groupCommentUser.userId eq userSession.userId }">
    			<input class="delete" type="button" onclick="fn_del('${i.groupCommentSeq}');" value="x"/>
    		</c:if>
    		</td>
    		<td>
    			<img class="cursor" id="report" src="${pageContext.request.contextPath }/resources/images/user/siren.png" onclick="fn_report('${i.groupCommentSeq }', '${userSessin.userId }','${i.groupCommentUser.userId }')" height="25px" width="25px">
    		</td>
    	</tr>
    </c:forEach>

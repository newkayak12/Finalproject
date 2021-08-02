<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="d-flex flex-column justify-content-between align-itmes-center">
	<div style="height: 550px">
		<table class="table table-striped table-hover tway">
			<tr>
				<th class="bgColorMainColorSub whiteText">
					아이디
				</th>
				<th class="bgColorMainColorSub whiteText">
					이름
				</th>
				<th class="bgColorMainColorSub whiteText">
					별명
				</th>
				<th class="bgColorMainColorSub whiteText">
					이메일
				</th>
				<th class="bgColorMainColorSub whiteText">
					성별
				</th>
				<th class="bgColorMainColorSub whiteText">
					가입일
				</th>
				<th class="bgColorMainColorSub whiteText">
					신고당한 횟수 
				</th>
				<th class="bgColorMainColorSub whiteText">
					계정 상태
				</th>
				<th class="bgColorMainColorSub whiteText">
					정지
				</th>
			</tr>
			<c:forEach items="${list }" var="i">
				<tr>
					<td>${i.userId }</td>
					<td>${i.userName }</td>
					<td>${i.userNick }</td>
					<td>${i.userEmail }</td>
					<td>${i.userGender }</td>
					<td><fmt:formatDate value="${i.userDate }" pattern="yy-MM-dd" /></td>
					<td>${i.userReportCount }</td>
					<input type="hidden" id="B${i.userId }" value="${i.userBlock }">
					<td id="block${i.userId }">
						<c:choose>
							<c:when test="${i.userBlock=='unblock' }">
								계정 활성화
							</c:when>
							<c:otherwise>
								계정 정지
							</c:otherwise>
						</c:choose>
					</td>
					<td class="text-center" >
					<c:choose>
							<c:when test="${i.userBlock=='unblock' }">
								<input type="button" onclick="blockThisId('${i.userId}')" id="btn${i.userId}" value="계정 정지">
							</c:when>
							<c:otherwise>
								<input type="button" onclick="blockThisId('${i.userId}')" id="btn${i.userId}" value="활성화">
							</c:otherwise>
						</c:choose>
						
					</td>
					
				</tr>
			</c:forEach>
		</table>
	</div>

	<div>${pageBar }</div>
</div>

<script>

	function blockThisId(userId){
		
		if($("#B"+userId).val()=='unblock'){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/blockuser",
				data:{"userId":userId},
				success:data=>{
					if(data>0){
						$("#block"+userId).html("계정 정지")
						$("#B"+userId).val("blind")
						$("#btn"+userId).val("활성화")
					}	
				}
			})
			
			
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/unblockuser",
				data:{"userId":userId},
				success:data=>{
					if(data>0){
						$("#block"+userId).html("계정 활성화")
						$("#B"+userId).val("unblock")
						$("#btn"+userId).val("계정 정지")
					}
				}
				
			})
			
			
		}
		
		
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="d-flex flex-column justify-content-between align-itmes-center">
	<div style="height: 550px">
		<table class="table table-striped table-hover tway">
			<tr>
				<th class="bgColorMainColorSub whiteText">
					대분류
				</th>
				<th class="bgColorMainColorSub whiteText">
					소분류
				</th>
				<th class="bgColorMainColorSub whiteText">
					이름
				</th>
				<th class="bgColorMainColorSub whiteText">
					주소
				</th>
				<th class="bgColorMainColorSub whiteText">
					별점
				</th>
				<th class="bgColorMainColorSub whiteText">
					좋아요 수
				</th>
				<th class="bgColorMainColorSub whiteText">
					상태
				</th>
				<th class="bgColorMainColorSub whiteText">
					폐쇄
				</th>
			</tr>
			<c:forEach items="${list }" var="i">
				<tr>
					<td>${i.groupTitle }</td>
					<td>${i.groupTheme }</td>
					<td>${i.groupMaster }</td>
					<td>${i.groupLimit }</td>
					<td>${i.groupGender }</td>
					
					<td><fmt:formatDate value="${i.groupDate }" pattern="yy-mm-dd" /></td>
					
					
					
					<td id="block${i.groupSeq }">
					<input type="hidden" id="B${i.groupSeq}" value="${i.groupDestroyFlag }">
						<c:choose>
							<c:when test="${i.groupDestroyFlag=='exist' }">
								활성화
							</c:when>
							<c:otherwise>
								폐쇄
							</c:otherwise>
						</c:choose>
					</td>
					<td class="text-center" >
					<c:choose>
							<c:when test="${i.groupDestroyFlag=='exist' }">
								<input type="button" onclick="blockThisId('${i.groupSeq}')" id="btn${i.groupSeq}" value="폐쇄">
							</c:when>
							<c:otherwise>
								<input type="button" onclick="blockThisId('${i.groupSeq}')" id="btn${i.groupSeq}" value="활성화">
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

	function blockThisId(seq){
		
		if($("#B"+userId).val()=='unblock'){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/blockuser",
				data:{"groupSeq":seq},
				success:data=>{
					if(data>0){
						$("#block"+seq).html("계정 정지")
						$("#btn"+seq).val("활성화")
					}	
				}
			})
			
			
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/unblockuser",
				data:{"groupSeq":seq},
				success:data=>{
					if(data>0){
						$("#block"+seq).html("계정 활성화")
						$("#btn"+seq).val("계정 정지")
					}
				}
				
			})
			
			
		}
		
		
	}
</script>
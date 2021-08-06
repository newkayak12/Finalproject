<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex flex-column justify-content-around align-items-center">
	<table class="table table-striped table-hover">
		<tr>
			<th>
				신고자
			</th>
			<th>
				대상자
			</th>
			<th>
				내용
			</th>
			<th>
				사유
			</th>
			<th>
				상태
			</th>
			<th>
				처리여부
			</th>
			<th>
				관리
			</th>
		</tr>
		<c:if test="${list.size()>0}">
		<c:forEach items="${list }" var="i">
			<tr>
				<td>
					${i.userIdShooter }
				</td>
				<td>
					${i.userIdTarget }
				</td>
				<td>
					${i.feedCommentContents }
				</td>
				<td>
					${i.reportContent }
				</td>
				<td id="status${i.reportTargetContent }">
					<c:choose>
						<c:when test="${i.feedCommentBlock =='unblock' }">
							게시
						</c:when>
						<c:otherwise>
							숨김
						</c:otherwise>
					</c:choose>
				</td>
				<td id="flag${i.reportTargetContent }">
					${i.reportFlag}
				</td>
				<td>
					<c:choose>
						<c:when test="${i.feedCommentBlock =='unblock' }">
							<input type="button" id="btn${i.reportTargetContent}" value="숨김" onclick = "feedBlocker('${i.reportTargetContent}')">
						</c:when>
						<c:otherwise>
							<input type="button" id="btn${i.reportTargetContent}" value="게시" onclick = "feedBlocker('${i.reportTargetContent}')">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${list.size()==0}">
			<tr>
				<td class="text-center">
					내용이 없습니다.
				</td>
			</tr>
		</c:if>
	</table>
	
	<c:if test="${list.size()>0}">
	<div>
	${pageBar }
	</div>
	</c:if>
</div>
	
	
	
	
	<script type="text/javascript">
	
		function feedBlocker(seq){
			console.log(seq)
			if($("#status"+seq).html() == '게시'){
				/* 숨김 */
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/feedCommentblock",
					data:{"seq":seq},
					success:data=>{
						if(data>0){
							console.log(data)
							$("#status"+seq).html("숨김")
							$("#btn"+seq).val("게시")
							$("#flag"+seq).html("Processed")
						}
					}
				})
				
				
			} else {
				/*  보임 */
				
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/feedCommentunblock",
					data:{"seq":seq},
					success:data=>{
						if(data>0){
							console.log(data)
							$("#status"+seq).html("게시")
							$("#btn"+seq).val("숨김")
							$("#flag"+seq).html("none")
						}
					}
				})
				
			}
		}
	
		function zoomPhoto(name){
			console.log(name)
			$("#zoom-body").attr('src',"${pageContext.request.contextPath}/resources/upload/feed/"+name)
		}
		
		function madalX(){
			$("#zoom").modal("hide")
		}
		
	</script>
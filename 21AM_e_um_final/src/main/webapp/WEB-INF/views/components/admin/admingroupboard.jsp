<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div>
	<table class="table table-striped table-hover">
		<tr>
			<th>
				신고자
			</th>
			<th>
				대상 
			</th>
			<th>
				글 제목
			</th>
			<th>
				글 내용
			</th>
			<th>
				사진1
			</th>
			<th>
				사진2
			</th>
			<th>
				사진3
			</th>
			<th>
				사유
				<!-- report_content -->
			</th>
			<th>
				상태
			</th>
			<th>
				진행
			</th>
			<th>
				처리
			</th>
			<c:if test="${list.size()>0}">
				<c:forEach items="${list }" var="i">
				<tr>
					<td>
						${i.userIdShooter }
					</td>
					<td>
						${i.userIdTarget }
					</td>
					<td style="overflow: hidden">
						${i.groupBoardTitle }
					</td>
					<td style="overflow-y: auto">
						${i.groupBoardConents }
					</td>
					<td style="width: 50px; height: 50px;" class="p-0">
						<c:choose>
							<c:when test="${i.groupBoardPhoto1 != null}">
								<img src ="${pageContext.request.contextPath }/resources/upload/feed/${i.groupBoardPhoto1}" width="50px" height="50px" onclick="zoomPhoto('${i.groupBoardPhoto1}')" data-toggle="modal" data-target="#zoom" class="m-1">
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</td>
					<td style="width: 50px; height: 50px;" class="p-0">
						<c:choose>
							<c:when test="${i.groupBoardPhoto2 != null}">
								<img src ="${pageContext.request.contextPath }/resources/upload/feed/${i.groupBoardPhoto2}" width="50px" height="50px" onclick="zoomPhoto('${i.groupBoardPhoto2}')" data-toggle="modal" data-target="#zoom" class="m-1">
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</td>
					<td style="width: 50px; height: 50px;" class="p-0">
						<c:choose>
							<c:when test="${i.groupBoardPhoto3 != null}">
								<img src ="${pageContext.request.contextPath }/resources/upload/feed/${i.groupBoardPhoto3}" width="50px" height="50px" onclick="zoomPhoto('${i.groupBoardPhoto3}')" data-toggle="modal" data-target="#zoom" class="m-1">
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						${i.reportContent }
					</td>
					<td id="status${i.reportTargetContent }">
						<c:choose>
							<c:when test="${i.groupBoardBlock =='unblock' }">
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
							<c:when test="${i.groupBoardBlock =='unblock' }">
								<input type="button" id="btn${i.reportTargetContent}" value="숨김" onclick = "foodBlocker('${i.reportTargetContent}')">
							</c:when>
							<c:otherwise>
								<input type="button" id="btn${i.reportTargetContent}" value="게시" onclick = "foodBlocker('${i.reportTargetContent}')">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${list.size()==0}">
		<tr>
			<td colspan="12" class="text-center">
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
	
	
	
	<div class="modal" id="zoom">
  		<div class="modal-dialog modal-dialog-centered modal-fade">
    		<div class="modal-content d-flex justify-content-center align-itmes-center">
		      <div class="modal-body" >
		      	<div onclick="madalX()" class="d-flex justify-content-end">X</div>
		        <img id="zoom-body" style="width: 450px; height: 450px;">
		      </div>
   			</div>
  		</div>
	</div>
	
	<script type="text/javascript">
	
		function feedBlocker(seq){
			console.log(seq)
			if($("#status"+seq).html() == '게시'){
				/* 숨김 */
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/groupboardblock",
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
					url:"${pageContext.request.contextPath}/admin/groupboardunblock",
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
			$("#zoom-body").attr('src',"${pageContext.request.contextPath}/resources/upload/group/"+name)
		}
		
		function madalX(){
			$("#zoom").modal("hide")
		}
		
	</script>
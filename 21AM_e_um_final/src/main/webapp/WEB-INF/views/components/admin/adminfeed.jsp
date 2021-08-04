<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex flex-column justify-content-around align-items-center">
	<table class="table table-striped table-hover tway">
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
					${i.feedContents }
				</td>
				<td style="width: 50px; height: 50px;" class="p-0">
					<c:choose>
						<c:when test="${i.feedImage1 != null}">
							<img src ="${pageContext.request.contextPath }/resources/upload/feed/${i.feedImage1}" width="50px" height="50px" onclick="zoomPhoto('${i.feedImage1}')" data-toggle="modal" data-target="#zoom" class="m-1">
						</c:when>
						<c:otherwise>
							
						</c:otherwise>
					</c:choose>
				</td>
				<td style="width: 50px; height: 50px;" class="p-0">
					<c:choose>
						<c:when test="${i.feedImage2 != null}">
							<img src ="${pageContext.request.contextPath }/resources/upload/feed/${i.feedImage2}" width="50px" height="50px" onclick="zoomPhoto('${i.feedImage2}')"  data-toggle="modal" data-target="#zoom" class="m-1">
						</c:when>
						<c:otherwise>
							
						</c:otherwise>
					</c:choose>
				</td>
				<td style="width: 50px; height: 50px;" class="p-0">
					<c:choose>
						<c:when test="${i.feedImage3 != null}">
							<img src ="${pageContext.request.contextPath }/resources/upload/feed/${i.feedImage3}" width="50px" height="50px" onclick="zoomPhoto('${i.feedImage3}')"  data-toggle="modal" data-target="#zoom" class="m-1">
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
						<c:when test="${i.feedBlock =='unblock' }">
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
						<c:when test="${i.feedBlock =='unblock' }">
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
				<td colspan="10" class="text-center">
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
					url:"${pageContext.request.contextPath}/admin/feedblock",
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
					url:"${pageContext.request.contextPath}/admin/feedunblock",
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
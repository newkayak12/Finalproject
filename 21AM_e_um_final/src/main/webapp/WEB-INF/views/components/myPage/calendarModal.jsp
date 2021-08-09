<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div class="float-right"><button type="button" class="btn checkbtn" onclick="fn_insertScheduleStart();">일정 등록</button></div>
<div>
	<!-- 날짜 단위 -->
	<c:if test="${dateList.size() > 0 }">
		<c:forEach var="d" items="${dateList }">
			<div>
				<div class="dateDesign tway"><h3><fmt:formatDate value="${d['SCHEDULER_DATE'] }" pattern="yyyy.MM.dd"/></h3></div>
				<!-- 일정 단위 -->
				<ul class="ulDesign pl-5">
					<c:forEach var="s" items="${scheduleList }">
						<c:if test="${d['SCHEDULER_DATE'] eq s['SCHEDULER_DATE'] }">
							<li class="pl-5">
								<c:choose>
									<c:when test="${s['CATEGORY'] eq 'food'}">
										<span class="pr-4 text-warning">
											<b>식사</b>
										</span>
									</c:when>
									<c:when test="${s['CATEGORY'] eq 'movie'}">
										<span class="pr-4 text-primary">
											<b>영화</b>
										</span>
									</c:when>
									<c:when test="${s['CATEGORY'] eq 'other'}">
										<span class="pr-4 text-muted">
											<b>기타</b>
										</span>
									</c:when>
								</c:choose>
								<span class="mr-5">${s['SCHEDULER_TITLE'] }</span>
								<span class="ml-5 pointer" onclick="fn_deleteSchedule('${s['SCHEDULER_SEQ'] }')">&times;</span>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${dateList.size() eq 0 }">
		<div>등록된 일정이 없습니다.</div>
	</c:if>
</div>

<script>
	function fn_deleteSchedule(schedulerSeq){
		if(confirm("일정을 삭제하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user/mypage/deleteSchedule",
				data:{schedulerSeq:schedulerSeq},
				success:data=>{
					if(data>0){
						alert("삭제되었습니다.");
						fn_openMPModal("calendar");
					}else{
						alert("삭제에 실패했습니다.");
					}
				}
			})
		}
	}
	
	function fn_insertScheduleStart(){
		fn_openMPModal("insertSchedule");
	}
</script>
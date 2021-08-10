<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="${pageContext.request.contextPath}/resources/css/hyelin.css" rel="stylesheet">

<div class="d-flex flex-column justify-content-between align-itmes-center mb-5">
	<div style="height: 650px" class="d-flex flex-column  align-items-center" id="manageFAQDiv">
		<table class="table table-striped table-hover colcenter">
			<colgroup>
				<col class="col-2">
				<col class="col-6">
				<col class="col-1">
				<col class="col-1">
				<col class="col-2">
			</colgroup>
			<tr>
				<th class="bgColorMainColorSub whiteText colcenter">
					카테고리
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					제목
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					상태
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					수정
				</th>
				<th class="bgColorMainColorSub whiteText colcenter">
					상태 변경
				</th>
			</tr>
			
			<c:if test="${list.size()>0}">
				<c:forEach items="${list }" var="i">
					<tr>
						<td class="pointer align-middle">${i.questCategory }</td>
						<td class="pointer align-middle">${i.faqTitle }</td>
						<td class="pointer align-middle">
							<c:if test="${i.deleteFlag eq 'live' }">
								사용
							</c:if>
							<c:if test="${i.deleteFlag eq 'die' }">
								미사용
							</c:if>
						</td>
						<td class="align-middle"><button class="cancelBtn btn" onclick="fn_modifyFAQStart('${i.faqSeq }')">수정</button></td>
						<td class="align-middle">
							<c:if test="${i.deleteFlag eq 'die' }">
								<button class="checkBtn btn" onclick="fn_changeFAQStatus('${i.faqSeq }','live')">사용</button>
							</c:if>
							<c:if test="${i.deleteFlag eq 'live' }">
								<button class="cancelBtn btn" onclick="fn_changeFAQStatus('${i.faqSeq }','die')">미사용</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="5" class="text-center">내용이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>
	
	<c:if test="${list.size()>0}">
		<nav aria-label="Page navigation example">
	 		${pageBar }
		</nav>
	</c:if>
</div>

<script>
	function fn_changeFAQStatus(faqSeq, flag){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/admin/changeFAQStatus",
			data:{
				faqSeq:faqSeq,
				flag:flag
				},
			success:list=>{
				if(list>0){
					alert("상태가 변경되었습니다.");
					manageFAQ(1);
				}else{
					alert("상태 변경에 실패했습니다.");
				}
			}
		})
	}
	
	function fn_modifyFAQStart(faqSeq){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/admin/modifyFAQ/start",
			data:{faqSeq:faqSeq},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("FAQ 수정")
				$("#root").html(list)
			}
		})
	}
</script>
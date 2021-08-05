<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div>

	<form action="" method="post">
	
			<input type="hidden" id="foodSeq" name="foodSeq" value="${ f.foodSeq }">
				<table class="" style="float:left;">
					<tr>
						<th>가게이름</th>
						<td><input type="text" class="form-control" id="foodName" name="foodName" value="${ f.foodName }"></td>
					</tr>
					<tr>
						<th>대분류</th>
						<td>
							<select class="form-control" id="foodCategoryMain" name="foodCategoryMain">
								<c:forEach var="i" items="${CategoryMainList }">
									<option value="${ i }"><c:out value="${ i }"/></option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>중분류</th>
							<td>
								<select class="form-control" id="foodCategorySub" name="foodCategorySub" >
									<c:forEach var="i" items="${CategorySubList }">
										<option value="${ i }"><c:out value="${ i }"/></option>
									</c:forEach>
								</select>
							</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" class="form-control" id="foodAddr" name="foodAddr" value="${ f.foodAddr }"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" class="form-control" id="foodCall" name="foodCall" placeholder="예) 02-123-1234" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" value="${ f.foodCall }"></td>
					</tr>
					<tr>
						<th>경도</th>
						<td><input type="text" class="form-control" id="foodLongitude" name="foodLongitude" value="${ f.foodLongitude }"></td>
					</tr>
					<tr>
						<th>위도</th>
						<td><input type="text" class="form-control" id="foodLatitude" name="foodLatitude" value="${ f.foodLatitude }"></td>
					</tr>
					
				</table>
				
				<table style="float:right;">
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" rows="7" id="foodContents" name="foodContents">${ f.foodContents }</textarea></td>
					</tr>
					<tr>
						<th>오픈시간</th>
						<td><input type="text" class="form-control" id="foodTimeFirst" name="foodTimeFirst" placeholder="예) 07:00" pattern="[0-9]{2}:[0-9]{2}" value="${ f.foodTimeFirst }"></td>
					</tr>
					<tr>
						<th>닫는시간</th>
						<td><input type="text" class="form-control" id="foodTimeLast" name="foodTimeLast" placeholder="예) 10:30" pattern="[0-9]{2}:[0-9]{2}" value="${ f.foodTimeLast }"></td>
					</tr>
					<tr>
						<th>수용가능인원수</th>
						<td><input type="number" class="form-control" id="foodHead" name="foodHead" value="${ f.foodHead }" ></td>
					</tr>
					<tr>
						<th>웹사이트주소</th>
						<td><input type="url" class="form-control" id="foodUrl" name="foodUrl" value="${ f.foodUrl }"></td>
						</tr>
					
				</table>

				<div>
					<button onclick="fn_updateFoodEnd();" type="button" class="btn" style="background-color: #70b3d9;">등록</button>
					<input type="reset" class="btn btn-secondary" value="초기화">
				</div>

			</form>
	

</div>

<script>
	const fn_updateFoodEnd = () => {
		$.ajax({
			url : "${ pageContext.request.contextPath }/admin/updatefood/end",
			data : {
				"foodSeq" : $("#foodSeq").val(),
				"foodName" : $("#foodName").val(),
				"foodCategoryMain" : $("#foodCategoryMain").val(),
				"foodCategorySub" : $("#foodCategorySub").val(),
				"foodAddr" : $("#foodAddr").val(),
				"foodCall" : $("#foodCall").val(),
				"foodLongitude" : $("#foodLongitude").val(),
				"foodLatitude" : $("#foodLatitude").val(),
				"foodContents" : $("#foodContents").val(),
				"foodTimeFirst" : $("#foodTimeFirst").val(),
				"foodTimeLast" : $("#foodTimeLast").val(),
				"foodHead" : $("#foodHead").val(),
				"foodUrl" : $("#foodUrl").val()
			},
			success : data => {
				if(data > 0) {
					alert("수정되었습니다");
					location.assign("${ pageContext.request.contextPath }/admin/enter");
				}else {
					alert("수정 실패");
				}
			}
		});
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.foodForm-container {
		height : 800px;
	}
	
	.form-controller {
		display: inline; !important;
	}
	
	.foodForm-tbl {
		float: left;
		width : 400px;
	}
	.foodForm-tbl2 {
		float: left;	
		width : 400px%;
	}
</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
	
		<div class="foodForm-container">
			<h2>맛집 등록 폼</h2>
			<form action="${ path }/food/foodForm/end" method="post" enctype="multipart/form-data">
				<table class="foodForm-tbl">
					<tr>
						<th>가게이름</th>
						<td><input type="text" class="form-control" id="" name="foodName"></td>
					</tr>
					<tr>
						<th>대분류</th>
						<td>
							<select class="form-control" id="" name="foodCategoryMain">
								<c:forEach var="i" items="${CategoryMainList }">
									<option value="${ i }"><c:out value="${ i }"/></option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>중분류</th>
							<td>
								<select class="form-control" id="" name="foodCategorySub" >
									<c:forEach var="i" items="${CategorySubList }">
										<option value="${ i }"><c:out value="${ i }"/></option>
									</c:forEach>
								</select>
							</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" class="form-control" id="" name="foodAddr"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" class="form-control" id="" name="foodCall" placeholder="예) 02-123-1234" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
					</tr>
					<tr>
						<th>경도</th>
						<td><input type="text" class="form-control" id="" name="foodLongitude"></td>
					</tr>
					<tr>
						<th>위도</th>
						<td><input type="text" class="form-control" id="" name="foodLatitude"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" rows="7" id="" name="foodContents"></textarea></td>
					</tr>
					<tr>
						<th>오픈시간</th>
						<td><input type="text" class="form-control" id="" name="foodTimeFirst" placeholder="예) 07:00" pattern="[0-9]{2}:[0-9]{2}"></td>
					</tr>
					<tr>
						<th>닫는시간</th>
						<td><input type="text" class="form-control" id="" name="foodTimeLast" placeholder="예) 10:30" pattern="[0-9]{2}:[0-9]{2}"></td>
					</tr>
					<tr>
						<th>수용가능인원수</th>
						<td><input type="number" class="form-control" id="" name="foodHead"></td>
					</tr>
					<tr>
						<th>웹사이트주소</th>
						<td><input type="url" class="form-control" id="" name="foodUrl"></td>
						</tr>
					<tr>
						<th>가격대</th>
						<td><input type="number" class="form-control" id="" name="foodPrice"></td>
					</tr>
				</table>

				<table class="foodForm-tbl2">
					<c:forEach var="i" begin="1" end="6" varStatus="vs">
						<tr>
							<th>메뉴<c:out value="${ i }"/> 이름</th>
							<td><input type="text" class="form-control" id="" name="menuName" required> </td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="number" class="form-control" id="" name="menuPrice" required> </td>
						</tr>
						<tr>
							<th>사진</th>
							<td>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="customFile" name="menuPhoto" required>
									<label class="custom-file-label" for="customFile">메뉴사진<c:out value="${ i }"/></label>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>

				<div>
					<button type="submit" class="btn" style="background-color: #70b3d9;">등록</button>
					<input type="reset" class="btn btn-secondary" value="초기화">
				</div>

			</form>
		</div>
		
		
	</div>
</section>


	
<script>
	$(".custom-file-input").on("change", function() {		
		var fileName = $(this).val().split("\\").pop();
		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);  
	});
</script>

	

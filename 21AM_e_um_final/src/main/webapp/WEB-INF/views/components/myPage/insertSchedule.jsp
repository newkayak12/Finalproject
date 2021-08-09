<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<form action="" method="post" class="col-lg-8 col mt-5">
	    <div>
	        <div class="form-group">
	            <label for="category"><b>카테고리 선택</b></label>
	            <select class="form-control" id="scheduleCategory" name="category">
	                <option value="SG_1">영화</option>
	                <option value="SG_2">식사</option>
	                <option value="SG_3">기타</option>
	              </select>
	        </div><br>
	        <div class="form-group">
	            <label for="date"><b>날짜</b></label>
	            <input type="text" class="form-control" id="datepicker" name="date" placeholder="날짜 입력" required>
	        </div><br>
	        <div class="form-group">
	            <label for="title"><b>일정</b></label>
	            <input type="text" class="form-control" id="scheduleTitle" name="title" required placeholder="일정을 입력해주세요.">
	        </div><br>
	        <div class="d-flex justify-content-center mt-5">
	        	<button type="button" class="btn cancelBtn mr-4 btnWidth" onclick="fn_openMPModal('calendar');">취소</button>
	            <button type="button" class="btn checkBtn ml-4 btnWidth" onclick="fn_insertScheduleEnd();">등록</button>
	        </div>
	    </div>
	</form>
</div>

<script>
	$(function () {
	    $("#datepicker").datepicker();
	});
	
	function fn_insertScheduleEnd(){
		console.log($("#datepicker").val());
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/mypage/insertSchedule",
			data:{
				category:$("#scheduleCategory").val(),
				scheduleDate:$("#datepicker").val(),
				scheduleTitle:$("#scheduleTitle").val()
			},
			success:data=>{
				if(data>0){
					alert("일정이 등록되었습니다.");
					fn_openMPModal("calendar");
				}else{
					alert("일정 등록에 실패했습니다.");
				}
			}
		})
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	.date {
            display : flex;
           
        }
        .date * {
            border: 1px solid black;
            width : 50px;
            text-align: center;
        }
</style>

<script>
    let date = new Date();

    let year = date.getFullYear();
        console.log(year);
    let month = date.getMonth() + 1;
        console.log(month);
    let date = date.getDate();
        console.log(date);

    $(function(){
        for(let i=0; i < 5; i++) {
            $("#dates").append("div").text("test").attr({
            "width" : "100px",
            "height" : "100px"
            }).css({
            	"border" : "1px solid black"
            });
        }
    });
</script>
<script>

</script>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<div>
			<!-- 정보 영역 -->
		</div>
		
		<div>
			<form>
				<div class="foodBookingCalendar">
					<!-- 날짜 선택 영역 -->
					<div>월</div>
				        <div>화</div>
				        <div>수</div>
				        <div>목</div>
				        <div>금</div>
				        <div>토</div>
				        <div>일</div>
					</div>
					
				<div>
					<!-- 시간 선택 영역 -->
				</div>
				
				<div>
					<!-- 인원수 선택 영역 -->
				</div>
				
				<div>
					<!-- 요청사항 영역 -->
				</div>
				
				<div>
					<button class="btn btn-eum border-eum textcolor-eum" onclick="">취소</button>
					<input type="submit" value="예약하기" class="btn btn-eum bgcolor-eum">
				</div>
			</form>
		</div>
		
	
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
/* 캘린더 */
.foodBookingCalendar {
	width : 400px;
	height : 550px;
}
.calendar {
    width: 400px;
    padding-bottom: 50px;
}

.calendar-header {
	margin-top: 20px;
    display: inline-block; 
}

.ym-wrapper {
    font-size: 15px;
    text-align: center;
}

.calendar-nav {
    display: flex;
    flex-grow: 0;
    flex-shrink: 0;
    justify-content: center;
    align-items: center;
    border: 1px solid gray;
}

.nav-btn {
    width: 28px;
    height: 30px;
    border: none;
    font-size: 16px;
    line-height: 34px;
    background-color: transparent;
    cursor: pointer;
}

.go-today {
    width: 80%;
    border-left: 1px solid gray;
    border-right: 1px solid gray;
}

.calendar-main{
    border-collapse: collapse;
    width: 400px;
}

.days {
    display: flex;
    margin: 25px 0 10px;
}

.day {
    width: 100px;
    text-align: center;
    transition: all .3s;
    font-weight: bolder;
}

.dates {
    display: flex;
    flex-flow: row wrap;
    border: 1px solid gray;
    
}

.date {
    cursor: pointer;
    width: 56.85px;
    padding: 5% 2%;
    text-align: center;
    border: 1px solid gray;
    transition: all .3s;
}

.day:nth-child(7n + 1),
.date:nth-child(7n + 1) {
    color: #D13E3E;
}

.day:nth-child(7n),
.date:nth-child(7n) {
    color: #396EE2;
}

.other {
    color: rgba(88, 88, 88, 0.315) !important;
    pointer-events : none;
}

.today {
    position: relative;
    background-color: #b8dbee;
}

.selected{
    background-color: black;
    color: #ffffff !important;
}
.year, .month {
	
}
/* 정보 영역 */
.bookingFoodTitle {
	font-size: 40px;
	font-weight: 900;
}
.foodBookingTitle {
	font-weight: 900;
	color: #70b3d9;
}
</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<!-- 정보 영역 -->
		<div class="info ml-5 mr-5 mt-5 mb-3" style="display:inline-block;">
				<div class="bookingFoodTitle" style="float:left;">&nbsp;&nbsp;<c:out value="${ food.foodName }"/></div>
				<div class="ml-5" style="float:right;">
					<span class="etc"><c:out value="😋 ${ food.foodAddr }"/></span>
					<br>
					<span class="etc"><c:out value="📞 ${ food.foodCall }"/></span>&nbsp;&nbsp;&nbsp;
					<span class="etc"><c:out value="🍽 ${ food.foodTimeFirst } - ${ food.foodTimeLast }"/></span>
				</div>
		</div>
	
		<form action="${ path }/food/foodBooking/end" method="post" class="row ml-5 mr-3" onsubmit="return fn_logincheck();">
			<!-- 날짜 선택 영역 -->
			<div class="foodBookingCalendar col-lg-6">
					<p class="foodBookingTitle">&nbsp; 1. 날짜 선택</p>
					<div class="calendar">
				        <div class="calendar-header">
				            <div class="ym-wrapper">
				                <span class="year"></span>년
				                <span class="month"></span>월
				            </div>
				            <div class="calendar-nav">
				                <button type="button" class="nav-btn go-prev" onclick="prevMonth();">&lt;</button>
				                <button type="button" class="nav-btn go-today" onclick="goToday();" >오늘</button>
				                <button type="button" class="nav-btn go-next" onclick="nextMonth();">&gt;</button>
				            </div>
				            <div>
				            	<span style="color:#b8dbee;">■</span><span>오늘날짜</span>
				            	<span style="color:#ff1c1c96;">■</span><span>선택한날짜</span>
				            </div>
				        </div>
				        <div class="calendar-main">
				            <div class="days">
				            	<div class="day">일</div>
				                <div class="day">월</div>
				                <div class="day">화</div>
				                <div class="day">수</div>
				                <div class="day">목</div>
				                <div class="day">금</div>
				                <div class="day">토</div>
				            </div>
				            <div class="dates">
				            	<!-- 여기에 class="date"인 div가 들어옴 -->
				            </div>
				        </div>
				    </div>
					
			</div>	
			
			<div class="col-md-6">	
				<!-- 시간 선택 영역 -->	
				<div style="width:400px;">
					<p class="foodBookingTitle">&nbsp; 2. 시간대 선택</p>
					<c:forEach var="time" items="${ realTimeList }">
						<button onclick="fn_selectTime('${ time }', event);" type="button" class="btn m-1 foodBookingTime" style="border:1px solid gray; background-color: #f7f7f7; margin:1px;"><c:out value="${ time }"/></button>
					</c:forEach>
				</div>
					
				<!-- 인원수 선택 영역 -->	
				<div>
					<br>
					<p class="foodBookingTitle">&nbsp; 3. 인원수 선택</p>
					<select id="foodBookingHead" name="bookingHead" class="form-control" style="display:inline-block; width:400px; border:1px solid gray;">
						<option disabled="disabled">인원수를 선택하세요</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>
				
				<!-- 요청사항 영역 -->	
				<div>
					<br>
					<p class="foodBookingTitle">&nbsp; 4.요청사항 작성</p>
					<textarea id="foodBookingContents" name="bookingContents" class="form-control" style="display:inline-block; width:400px; border:1px solid gray;" rows="5" cols="60"></textarea>
				</div>
				
				<!-- 선택한 날짜랑 시간  -->
				<input type="hidden" id="bookingDateDay" name="bookingDateDay" value=""/>
				<input type="hidden" id="bookingDateTime" name="bookingDateTime" value=""/>
				<input type="hidden" id="userId" name="userId" value="${ session.userId }">
				<input type="hidden" id="foodSeq" name="foodSeq" value="${ food.foodSeq }">
				
				<!-- 버튼 영역 -->
				
				<div class="mb-5">
					<br>
					<button type="button" class="btn btn-eum border-eum textcolor-eum m-1" onclick="fn_bookingRestart();" style="border:1px solid #70b3d9;">선택 초기화</button>
					<button type="button" class="btn btn-eum border-eum textcolor-eum m-1" onclick="location.assign('${path}/food/foodView?foodSeq=${ food.foodSeq}');" style="border:1px solid #70b3d9;">돌아가기</button>
					<input type="submit" value="예약하기" class="btn btn-eum bgcolor-eum m-1" style="background-color: #70b3d9;">
				</div>
			</div>	
			
		</form>
		
	
	</div>
</section>

<script>
	const fn_logincheck = () => {
		if( !$("#userId").val() ) {
			alert("로그인해주세요");
			location.replace('${path}/');
			return false;
		}
	}
</script>

<script src="${ path }/resources/js/booking.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
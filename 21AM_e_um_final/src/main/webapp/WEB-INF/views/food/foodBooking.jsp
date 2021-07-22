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
	
		<form action="${ path }/food/foodBooking/end" method="post" class="row ml-5 mr-3">
			<!-- 날짜 선택 영역 -->
			<div class="foodBookingCalendar col-md-6">
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
						<button onclick="fn_selectTime('${ time }', event);" name="foodBookingTime" type="button" class="btn m-1 foodBookingTime" style="border:1px solid gray; background-color: #f7f7f7; margin:1px;"><c:out value="${ time }"/></button>
					</c:forEach>
				</div>
					
				<!-- 인원수 선택 영역 -->	
				<div>
					<br>
					<p class="foodBookingTitle">&nbsp; 3. 인원수 선택</p>
					<select id="foodBookingHead" name="foodBookingHead" class="form-control" style="display:inline-block; width:400px; border:1px solid gray;">
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
					<textarea id="foodBookingContents" name="foodBookingContents" class="form-control" style="display:inline-block; width:400px; border:1px solid gray;" rows="5" cols="60"></textarea>
				</div>
				
				<!-- 선택한 날짜랑 시간  -->
				<input type="hidden" id="hiddenBookingDate" name="" value=""/>
				<input type="hidden" id="" name="" value=""/>
				<!-- 버튼 영역 -->
				
				<div class="mb-5">
					<br>
					<button type="button" class="btn btn-eum border-eum textcolor-eum m-1" onclick="fn_bookingRestart();" style="border:1px solid #70b3d9;">선택 초기화</button>
					<button type="button" class="btn btn-eum border-eum textcolor-eum m-1" onclick="location.assign('${path}/food/foodView?foodSeq=${ food.foodSeq}');" style="border:1px solid #70b3d9;">돌아가기</button>
					<input type="button" value="예약하기" class="btn btn-eum bgcolor-eum m-1" style="background-color: #70b3d9;" onclick="fn_booking();">
				</div>
			</div>	
			
		</form>
		
	
	</div>
</section>

<script>
let date = new Date();

const renderCalender = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();

    document.querySelector('.year').textContent = `${viewYear}`;
    document.querySelector('.month').textContent = `${viewMonth + 1}`;

    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];

    if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

    for (let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }

    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);

    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1 ?
            'this' :
            'other';
        dates[i] = `<div onclick="fn_selectDate(${viewYear}, ${viewMonth}, ${date}, event);" name="foodBookingDate" class="date ${condition}">${date}</div>`;
    });

    document.querySelector('.dates').innerHTML = dates.join('');

    const today = new Date();
    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.this')) {
            if (+date.innerText === today.getDate()) {
                date.classList.add('today');
                break;
            }
        }
    }
};

renderCalender();

const prevMonth = () => {
    date.setMonth(date.getMonth() - 1);
    renderCalender();
};

const nextMonth = () => {
    date.setMonth(date.getMonth() + 1);
    renderCalender();
};

const goToday = () => {
    date = new Date();
    renderCalender();
};

const fn_selectDate = (viewYear, viewMonth, date, event) => {
	
				console.log(viewYear + "년");
				console.log(viewMonth+1 + "월");
				console.log(date + "일");
				console.log(event.target);
		
		// 선택한 날짜
		let selectDate = new Date(`${viewYear}-${viewMonth+1}-${date}`);
		
				console.log("선택한 날짜 : " + selectDate);
		
		// 오늘 날짜
		let today = new Date();
		
				console.log("오늘 날짜 : " + today); 


		// 현재부터 한달뒤 날짜까지만 예약가능하도록
		if( selectDate.getTime() - today.getTime() > 31*1000*60*60*24 ) {
			
			 alert("한달 이내의 날짜만 예약할 수 있습니다");
			
		} else {
			
			// 이번달일때
			if(viewMonth+1 === today.getMonth()+1) {
			
					// 선택한 날짜의 일이 오늘날짜의 일보다 작으면
					if(date < today.getDate()) {
						
		    				alert("오늘 이후의 날짜를 선택해주세요");	
		    			
					} else {
		   			
			   				 // 선택한 날짜의 칸 색을 붉은색으로
			   				 $(event.target).css({
			        				"background-color" : "#ff1c1c96",
			        				"font-weight" : "900",
			        				"color" : "black"
			   				 });
			    			$(event.target).attr("id", "selectedDate");
			    
			    			// 이제 날짜선택 불가능 ( 초기화하기 버튼으로 다시 시작해야함 )
			    			$(".date").css("pointer-events", "none");
			    				
			    			// hidden타입 input태그에 값 대입 
							$("#hiddenBookingDate").val(selectDate);
					}
				
			// 다음달일때 
			} else {
					// 선택한 날짜의 칸 색을 붉은색으로
	   				 $(event.target).css({
	        				"background-color" : "#ff1c1c96",
	        				"font-weight" : "900",
	        				"color" : "black"
	   				 });
	    			$(event.target).attr("id", "selectedDate");
	    
	    			// 이제 날짜선택 불가능 ( 초기화하기 버튼으로 다시 시작해야함 )
	    			$(".date").css("pointer-events", "none");
	    				
	    			// hidden타입 input태그에 값 대입 
					$("#hiddenBookingDate").val(selectDate);
			}
		} 
};

const fn_selectTime = (time, event) => {
	
	console.log(time);
	console.log(event.target);
	
	$(event.target).css({
		"background-color" : "#ff1c1c96",
	    "font-weight" : "900",
	    "color" : "black"
	});
	$(".foodBookingTime").css("pointer-events", "none");
	
}

const fn_bookingRestart = () => {
	
	// 날짜 클릭했을때 바뀐 색 초기화 
	$("#selectedDate").css({
				"background-color" : "",
				"font-weight" : "",
				"color" : ""
			});
	$(".date").css("pointer-events", "");
	
	// 시간 선택했을 때 바뀐 색 초기화
	$(".foodBookingTime").css({
				"background-color" : "",
				"font-weight" : "",
				"color" : ""
			});
	
	// 시간을 다시 선택할 수 있게 클릭허용 
	$(".foodBookingTime").css("pointer-events", "");
	
	// 인원수 고르는 select태그를 기본값이 보이도록 설정 
	$("#foodBookingHead").find('option:first').attr('selected', 'selected');
	
	// 요청사항 적는 textarea태그를 내용을 빈칸으로 설정 
	$("#foodBookingContents").val('');
	
}

/* const fn_booking = () => {
	
	$.ajax({
		url:"${path}/food/foodBooking/end",
		data: {
			"foodSeq": ${food.foodSeq},
			"userId" : ,
			"bookingDateDay" : ,
			"bookingDateTime" : ,
			"bookingHead" : ,
			"bookingContents"
		},
		success: data => {
			
		}
	});
}	 */
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
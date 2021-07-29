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
        dates[i] = `<div onclick="fn_selectDate(${viewYear}, ${viewMonth}, ${date}, event);" name="" class="date ${condition}">${date}</div>`;
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
							$("#bookingDateDay").val(selectDate);
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
					$("#bookingDateDay").val(selectDate);
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
	
	// hidden에 값 저장 
	let selectTime = new Date(`2021-07-22T${time}:00`);
	
		console.log("선택된 시간 : " + selectTime);
		
	$("#bookingDateTime").val(selectTime);
	
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
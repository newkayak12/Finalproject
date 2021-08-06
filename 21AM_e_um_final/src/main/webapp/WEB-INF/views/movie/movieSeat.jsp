<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<section class="mt-5 pt-5">
		<div id="root" class=" mt-5">
			<div class="select-container" style='width: 100%;'>
				<div class="select-wrapper">
					<div class="select-title">인원/좌석</div>
					<div class="select-seat-container">
						<div class="select-seat-number-container">
							<div class="select-seat-number-wrapper">
								<div class="select-seat">
									<div class="select-seat-age">인원</div>
									<div class="select-seat-number">
										<ul class="select-seat-ul select-seat-ul-normal">
											<li class="select-number-normal ">0</li>
											<li class="select-number-normal">1</li>
											<li class="select-number-normal">2</li>
											<li class="select-number-normal">3</li>
											<li class="select-number-normal">4</li>
											<!--  <li class="select-number-normal">6</li>
		                                    <li class="select-number-normal">7</li>
		                                    <li class="select-number-normal">8</li> -->
										</ul>
									</div>
								</div>
		
							</div>
							<div class="reserve-number-wrapper">
								<div class="reserve-number-title">선택된 좌석 수</div>
								<div class="reserve-number">0</div>
							</div>
						</div>
						<div class="select-seat-information">
							<div class="selected-movie"></div>
							<div class="select-seat-information-wrapper">
								<div class="select-theater-place selected-theater-place-info">${param.movieLocation }</div>
								<div class="select-theater-place selected-theater-place-info">${param.movieBox }
								</div>
								<div class="select-theater-place">
									<span>남은좌석</span><span class="remain-seats"></span>/<span
										class="all-seats"></span>
								</div>
		
							</div>
							<div class="select-theater-date">
								<div class="theater-date"></div>
								<div class="theater-time"></div>
							</div>
							<div class="selected-seats-wrapper">
								<span class="selected-seats-title">좌석번호</span> <span
									class="selected-seats">선택한 좌석이 없습니다.</span>
							</div>
							<div class="ticket-price-wrapper">
								<div class="ticket-price-title">가격</div>
								<div class="ticket-price">0원</div>
							</div>
							<form action="${path }/movie/movieReserveEnd" class="seatForm" method="post">
								<input type="hidden" id="movieSeq" name="movieSeq" value="${param.movieSeq }"> 
		                        <input type="hidden" id="movieLocation" name="movieLocation" value="${param.movieLocation }">
								<input type="hidden" id="movieBox" name="movieBox" value="${param.movieBox }">
								<input type="hidden" id="movieDate" name="movieDate" value="${param.movieDate }">
								<input type="hidden" id="movieTime" name="movieTime" value="${param.movieTime }">
								<input type="hidden" class="ticketNumber" name="ticketNumber">
								<input type="hidden" class="selectedSeat" name="selectedSeat" value="">
								<!-- 티켓의수(선택한 좌석) -->
								
								<!-- 결제 정보 -->
								<input type="hidden" class="payMoney" name="moviePrice">
								<button type="button" class="reserve-button">
									결제하기
								</button>
							</form>
						</div>
		
					</div>
					<div class="seat-container">
		
						<div class="seat-wrapper">
							<div class="screen-view-wrapper">
								<div class="screen-view">SCREEN</div>
							</div>
						</div>
		                
					</div>
				</div>
			</div>
		</div>
	</section>
<script>
		$(function(){
			seatMaker();
		})
        
        let test = [];
        let selectedSeatsArray = new Array();
        const seatWrapper = document.querySelector('.seat-wrapper');
        let clicked = '';
        let div = '';
        let seat = document.querySelectorAll('.seat');
        const selectedSeats = document.querySelector('.selected-seats');
        const allSeat = document.querySelector('.all-seats');
        const remainSeat = document.querySelector('.remain-seats');
        const reserveNumber = document.querySelector('.reserve-number');
        const selectSeatListNormal = document.querySelectorAll(
            '.select-seat-ul-normal li'
        );
        let selectSeatListUlActive = '';
        let normalNumber = 0;
        let allNumber = 0;
        let prevNumber = 0;
        let normalMoney = 0;
        let allMoney = 0;

        const selectNumberNormal = document.querySelectorAll('.select-number-normal');

        //예약 관련
        const ticketPrice = document.querySelector('.ticket-price');
        const payMoney = document.querySelector('.payMoney');

        const seatForm = document.querySelector('.seatForm');
        const reserveButton = document.querySelector('.reserve-button');
        const reserveDate = document.querySelector('.reserveDate');
        const selectedSeat = document.querySelector('.selectedSeat');
        const ticketNumber = document.querySelector('.ticketNumber');
        // toastr.options = {
        //     positionClass: 'toast-top-right',
        //     progressBar: true,
        //     timeOut: 1000,
        //     preventDuplicates: true,
        // };

        //버튼클릭시 다른 class 추가 초기화해주기
        function selectSeatList(list) {
            allNumber = 0;
            allMoney = 0;
            list.forEach(li => {
                //클릭시에 다른 class초기화해주기
                initList(list, li);
            });
        }

        function initList(list, li) {
            li.addEventListener('click', function() {
                list.forEach(li => {
                    li.classList.remove('select-seat-ul-active');
                });
                li.classList.add('select-seat-ul-active');
                selectSeatListUlActive = document.querySelectorAll(
                    '.select-seat-ul-active'
                );
                selectListUiFunction(selectSeatListUlActive);

            });
        }

        function selectListUiFunction(selectSeatListUlActive) {
        	const seatWrapper = document.querySelectorAll(".seatButtonWrapper");
        	const reserveNumber = document.querySelector(".reserve-number");
        	const seats = document.querySelector(".selected-seats");
        	
        	for(var i =0; i<seatWrapper.length;i++){
        		seatWrapper[i].remove();
        	}
        	reserveNumber.innerHTML=0;
        	seats.innerHTML=0;
        	seatMaker();
        	selectSeatListUlActive.forEach(li => {
           	
            	if (li.parentNode.classList.contains('select-seat-ul-normal')) {
                    normalNumber = Number(li.innerHTML);
                    normalMoney = 10000 * normalNumber;
                    allMoney = normalMoney;
                    allNumber = normalNumber;
                    ticketPrice.innerHTML = allMoney + '원';
                    if (allNumber > 16) {
                        li.classList.remove('select-seat-ul-active');
                        allMoney -= normalMoney;
                        allNumber = allNumber - normalNumber;

                        selectNumberNormal[0].classList.add('select-seat-ul-active');
                        ticketPrice.innerHTML = allMoney + '원';
                    }
                } 

                ticketPrice.innerHTML = allMoney + '원';

                if (allNumber > 16) {
                    console.log(li);
                    li.classList.remove('select-seat-ul-active');
                }
                payMoney.value = allMoney;
            });
        }

        selectSeatList(selectSeatListNormal);
		/* function selectedSeat(){
			$.ajax({
				url : "${path}/movie/reserveMovie",
				data : {}
			})
		} */
        function seatMaker(){
			let seats = [];
			
			$.ajax({
				url:"${path}/movie/movieSeat",
        		data:{"movieSeq":$("#movieSeq").val(),'movieLocation':$("#movieLocation").val(),"movieBox":$("#movieBox").val() },
				success:moviebox=>{
					console.log(moviebox);
					let cols = moviebox['movieColumns'];
					let rows = moviebox['movieRows'];
					
					/*  let cols =  */
			        for (let i = 1; i <=cols; i++) {
			            div = document.createElement('div');
			            div.classList = 'seatButtonWrapper';
			            seatWrapper.append(div);

			            for (let j = 1; j <=rows; j++) {
			                const input = document.createElement('input');
			                input.type = 'button';
			                input.name = 'seats';
			                input.classList = 'seat';
			                //3중포문을 사용하지 않기위해
			                mapping(input, i, j);
			                div.append(input);
			                //클릭시 이벤트
			                inputClickEvent(input);
			            }

			            seat = document.querySelectorAll('.seat');
			            remainSeat.innerHTML = seat.length;
			            allSeat.innerHTML = seat.length;
			        }
			        seat.forEach(data => {
			            //console.log(data.value.substring(1, data.value.length));
			            // console.log(data.value.substring(0, data.value.length - 1));
			            //좌석이 2나 9로 끝나는얘들은 왼쪽이나 오른쪽으로 띄워주기위한 class추가
			            if (data.value.substring(1, data.value.length) === '3') {
			                data.classList.add('left-margin');
			            } else if (data.value.substring(1, data.value.length) === '5') {
			                data.classList.add('right-margin');
			            } else if (data.value.substring(1, data.value.length) === '8') {
			                data.classList.add('right-margin');
			            } 
			            //앞자리가 E로끝나는 좌석들에 class 추가
			            if (
			                data.value.substring(0, data.value.length - 1) === 'E' ||
			                data.value.substring(0, data.value.length - 2) === 'E'
			            ) {
			                data.classList.add('top-margin');
			            }
			            if (
				             data.value.substring(0, data.value.length - 1) === 'I' ||
				             data.value.substring(0, data.value.length - 2) === 'I'
				        ) {
				             data.classList.add('top-margin');
				        }
			        });
				}
			})
		}
        
       

        
        
        
        //TODO 좌석 2개씩은 커플석으로 분리하기위해서 해당 class를 추가해줘야하는데 value가 2로끝나는얘들이랑 7로끝나는 얘들은 class를 추가해주기

        function inputClickEvent(input) {
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeatsArray = selectedSeatsArray.filter(
                    (element, index) => selectedSeatsArray.indexOf(element) != index
                );

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains('clicked')) {
                    input.classList.remove('clicked');
                    clicked = document.querySelectorAll('.clicked');

                    //배열안의 값 제거
                    selectedSeatsArray.splice(selectedSeatsArray.indexOf(e.target.value), 1);
                    clicked.forEach(data => {
                        selectedSeatsArray.push(data.value);
                    });
                    //class가 존재안할때 추가해주는 toggle
                } else {
                    input.classList.add('clicked');
                    clicked = document.querySelectorAll('.clicked');
                    //선택한 번호의 갯수를 넘기면 동작 못하게 하는 코드
                    console.log(allNumber);
                    if (clicked.length > allNumber) {
                        input.classList.remove('clicked');
                       
                        return;
                    }

                    clicked.forEach(data => {
                        selectedSeatsArray.push(data.value);
                    });
                }

                
                //좌석번호의 innerHTML 설정
                selectedSeats.innerHTML = selectedSeatsArray;
                selectedSeat.value = selectedSeats.innerHTML;
                reserveNumber.innerHTML = selectedSeatsArray.length;
                remainSeat.innerHTML = seat.length - selectedSeatsArray.length;
                // if (selectedSeatsArray.length > 4) {
                //     return;
                // }
            });
        }

        function mapping(input, i, j) {
            if (i === 1) {
                input.value = 'A' + j;
            } else if (i === 2) {
                input.value = 'B' + j;
            } else if (i === 3) {
                input.value = 'C' + j;
            } else if (i === 4) {
                input.value = 'D' + j;
            } else if (i === 5) {
                input.value = 'E' + j;
            } else if (i === 6) {
                input.value = 'F' + j;
            } else if (i === 7) {
                input.value = 'G' + j;
            } else if (i === 8) {
                input.value = 'H' + j;
            } else if (i === 9) {
            	input.value = 'I' + j;
            } else if (i === 10) {
            	input.value = 'J' + j;
            }
        }

        //form 제출시 hidden설정하기
        reserveButton.addEventListener('click', function() {
        	
            ticketNumber.value = reserveNumber.innerHTML;
            if (
                Number(ticketNumber.value) === allNumber && 
                ticketNumber.value !== '0' &&
                ticketNumber.value !== 0
            ) {
                seatForm.submit();
            } else {
                alert('좌석을 모두선택해 주세요!');
            }
        });
</script>

<style>
    /* content */
    
 #root{
 	font-family:'Noto Sans KR';
 }

.select-container {
    margin-top: 50px;
}

@media(min-width:992px){
	.select-wrapper {
	    width: 900px;
	    background-color: #F2F0E5;
	    margin: 0 auto;
	    border-left: 1px solid #dddddd;
	    border-right: 1px solid #dddddd;
	}
}
@media(min-width:796px){
	.select-wrapper {
	    width: 800px;
	    background-color: #F2F0E5;
	    margin: 0 auto;
	    border-left: 1px solid #dddddd;
	    border-right: 1px solid #dddddd;
	}
}

.select-title {
    background-color: #444444;
    color: #dddddd;
    font-size: 16px;
    text-align: center;
    padding: 10px;
}

.select-seat-container {
    display: flex;
    /* align-items: center; */
    border-bottom: 2px solid #dddddd;
}

.select-seat-number-container {
    flex-grow: 1;
    border-right: 1px solid #dddddd;
    display: flex;
    vertical-align: middle;
}

.select-seat-number-wrapper {
    padding: 15px 0 20px 20px;
    flex-grow: 1;
}

.select-seat-ul {
    display: flex;
    list-style: none;
}

.select-seat-ul>li {
    width: 20px;
    height: 20px;
    border: 1px solid #dddddd;
    text-align: center;
    font-weight: bold;
    /* line-height: 15px; */
    /* padding: 5px; */
    padding: 2px;
}

.select-seat-ul>li:hover {
    color: white;
    background-color: #222222;
    cursor: pointer;
}

.select-seat-ul-active {
    color: white;
    background-color: #222222;
}

.select-seat-ul>li:not(:first-child) {
    margin-left: 5px;
}

.select-seat-information {
    flex-grow: 1;
    padding: 15px 0 20px 20px;
}

.select-seat {
    display: flex;
    font-size: 12px;
    margin-top: 35px;
}

.select-seat:not(:first-child) {
    margin-top: 12px;
}

.select-seat-age {
    width: 40px;
}

.select-seat-number {
    margin-left: 15px;
}

.reserve-number-wrapper {
    flex-grow: 1;
    padding-top: 15px;
    border-left: 1px solid #DDDDDD;
    text-align: center;
}

.reserve-number {
    margin-top: 20px;
    font-size: 34px;
    font-weight: bold;
}

.selected-movie {
	font-size: 20px;
    margin-bottom: 5px;
    font-weight: bold;
}

.select-seat-information-wrapper {
    display: flex;
}

.select-theater-place {
    font-size: 12px;
}

.select-theater-place:not(:last-child) {
    width: 55px;
    border-right: 1px solid #dddddd;
}

.select-theater-place:last-child {
    width: 150px;
    /* border-right: 1px solid #dddddd; */
}

.select-theater-place:not(:first-child) {
    margin-left: 12px;
}

.select-theater-date {
    /*  font-size: 18px;
    margin-top: 8px;
    font-weight: bold; */
    display: flex;
}

.select-theater-date>div {
    font-size: 18px;
    margin-top: 8px;
    font-weight: bold;
}

.theater-time {
    margin-left: 5px;
}

.remain-seats {
    margin-left: 3px;
    color: rgba(255, 0, 0, 0.6);
    font-weight: bold;
}

.selected-seats-wrapper {
    margin-top: 5px;
}

.selected-seats {
    font-size: 20px;
    word-spacing: 2px;
    margin-left: 20px;
    font-weight: bold;
}

.selected-seats-title {
    color: black;
    font-size: 20px;
    font-weight: bold;
}

.ticket-price-wrapper{
	margin-top: 5px;
	display: flex;
	align-items: center;
}
.ticket-price-wrapper>div{	
	font-weight: bold;
}
.ticket-price-title{
	font-size: 13px;
}

.ticket-price {
	margin-left: 47px;
	font-size:13px;
}

.reserve-button {
    margin-top: 5px;
    display: flex;
    align-items: center;
    font-weight: bold;
    font-size: 13px;
    padding: 0;
}

.reserve-button img {
    margin-left: 20px;
    width: 60px;
}

.seat-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.screen-view {
    width: 140px;
    color: #777777;
    padding-top: 30px;
    font-size: 30px;
    text-align: center;
    margin: 0 auto 30px auto;
    border-bottom: 1px solid #666666;
    letter-spacing: 4px;
}

.seat-wrapper {
    background-color: #222222;
    width: 700px;
    height: 500px;
    /* padding-top: 120px; */
}

.seat {
    width: 30px;
    height: 30px;
}

.seat {
    font-size: 13px;
    background-color: #555555;
    color: white;
    border: 1px solid rgba(255, 0, 0, 0.6);
}

.seat:hover {
    background-color: red;
    color: white;
    cursor: pointer;
}

.seat:active {
    background-color: red;
    color: white;
}

.clicked {
    background-color: red;
    color: white;
}

.seatButtonWrapper {
    text-align: center;
}

.seatButtonWrapper>input {
    width: 30px;
    height: 30px;
}

.left-margin {
    margin-left: 30px;
}

.right-margin {
    margin-right: 30px;
}

.top-margin {
    margin-top: 30px;
}

</style>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
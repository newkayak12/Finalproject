<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	$(function(){
		$.ajax({
			url:"${path}/movie/movieList",
			success:data=>{
				console.log(data);
				for(var i=0; i<data.length;i++){
					$(".movie-list-ul").append(
							$("<li>").append($("<button>").html(data[i]["movieTitleKr"])
							.addClass('movieName col-12')
							.attr({"value":data[i]["movieSeq"],"onclick":"movieSeqFn(event);"})))
				}
			}
		})
		
	})
	
	const movieSeqFn=(e)=>{
		let seq = e.target.value;
		
		$.ajax({
			url:"${path}/movie/movieBox",
			data:{"movieSeq":seq},
			success:data=>{
				console.log(data);
				$("#location-1").html("")
				
				for(var i=0; i<data.length; i++){
					$("#location-1").append(
							$("<button>").addClass("theater-place justify-content-center")
							.html(data[i]["movieBoxSeq"]["movieLocation"])
							.attr({"value":data[i]["movieBoxSeq"]["movieLocation"],"onclick":"showDate();"}).css("text-align","center"))
				}
			}
		})
		
		$.ajax({
			url:"${path}/movie/movieTime",
			success:data=>{
				console.log(data)
				$(".reserve-time-wrapper").html("")
				for(var i=0; i<data.length;i++){
					$(".reserve-time-wrapper").append($("<button>").addClass("reserve-time-button").append($("<span>").addClass("reserve-time-want").html(data[i]["movieTime"])))
					
				}
				
			}
		})
	}
	
	const showDate=()=>{
		$(".reserve-date").css("display","flex");
	}
	
	
	
	const seoul=()=>{
		$("#location-2").css("display","none")
		$("#location-1").css("display","flex")
	}
	const gyeonggi=()=>{
		$("#location-1").css("display","none")
		$("#location-2").css("display","flex")
	}
	
</script>	

	
	<section class="mt-5 pt-5" data-spy="scroll" data-target=".movie-list-ul" data-offset="50">
		<div id="root" class="container mt-5">
			<div class="reserve-container">
		        <div class="movie-part" style="height: 498px;">
		            <div class="reserve-title">영화</div>
		            
		             <div class="movie-list-wrapper" style="overflow:scroll; height: 450px;" >
		                <div class="movie-list">
							<ul class="movie-list-ul">
				
							</ul>
		                </div>
		            </div>
		        </div>
		        <div class="theater-part">
		            <div class="reserve-title">
		                극장
		            </div>
		            <div class="theater-container" >
		                <div class="theater-wrapper" >
		                    <!-- <div class="theater-location-wrapper" >
		                        
		                    </div> -->
		                    <div class="theater-place-wrapper" id="location-1" style="overflow:scroll; height: 450px;">
		                        
		                    </div>
		                    <div class="theater-place-wrapper" id="location-2" style="display: none">
		                        
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="day-part" style="height: 498px;">
		            <div class="reserve-title" >날짜</div>
		            <div class="reserve-date" style="overflow:scroll; height: 450px; display: none"></div>
		        </div>
		        <div class="time-part">
		            <div class="reserve-title">시간</div>
		            <div class="reserve-time">
		                <div class="reserve-where"></div>
		                <div class="reserve-time-wrapper">
		                    <!-- <button class="reserve-time-button"> 
		                        <span class="reserve-time-want">ㅎ</span>
		                        
		                    
		                    </button> -->
		
		                </div>
		            </div>
		            <div class="">
		            
		            </div>
		            
		            <div>
		            <form class="moveSeatForm" action="moveSeat.do" method="post">
		            <input type="hidden" class="title" name="title"> 
		            <input type="hidden" class="movieAge" name="movieAge">
		            <input type="hidden" class="selectedTheater" name="selectedTheater">
		            <input type="hidden" class="reserveDate" name="movieDate">
		            <button class="moveSeatButton" type="button" style="vertical-align:bottom;">예매하기</button>
		            </form>
		            </div>
		        </div>
		
		    </div>
		</body>
		</html>
		
		<script>
		    const date = new Date();
		    console.log(date.getFullYear());
		    console.log(date.getMonth()+1);
		    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
		    const reserveDate = document.querySelector(".reserve-date");
		    console.log(lastDay);
		    console.log(reserveDate);
		  
		        const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
		        const year = date.getFullYear();
		        const month = date.getMonth()+1;
		        console.log(month);
		        for (i = date.getDate(); i <= lastDay.getDate(); i++) {
		
		            const button = document.createElement("button");
		            const spanWeekOfDay = document.createElement("span");
		            const spanDay = document.createElement("span");
		
		            //class넣기
		            button.classList = "movie-date-wrapper"
		            spanWeekOfDay.classList = "movie-week-of-day";
		            spanDay.classList = "movie-day";
		
		            //weekOfDay[new Date(2020-03-날짜)]
		            const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];
		            console.log(dayOfWeek);
		            //요일 넣기
		            if (dayOfWeek === "토") {
		                spanWeekOfDay.classList.add("saturday");
		                spanDay.classList.add("saturday");
		            } else if (dayOfWeek === "일") {
		                spanWeekOfDay.classList.add("sunday");
		                spanDay.classList.add("sunday");
		            }
		            spanWeekOfDay.innerHTML = dayOfWeek;
		            button.append(spanWeekOfDay);
		            //날짜 넣기
		            spanDay.innerHTML = i;
		            button.append(spanDay);
		            //button.append(i);
		            reserveDate.append(button);
		
		            dayClickEvent(button);
		        }
		
		    
		
		
		    function dayClickEvent(button) {
		        button.addEventListener("click", function() {
		            const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
		            movieDateWrapperActive.forEach((list) => {
		                list.classList.remove("movie-date-wrapper-active");
		            })
		            button.classList.add("movie-date-wrapper-active");
		        })
		    }
		</script>
		
		
		
		<style>
		
		* {
		    font-size: 11px;
		}
		
		
		
		
		
		/* content */
		
		.reserve-container {
		    margin-top: 140px;
		    display: flex;
		    justify-content: center;
		    height: 500px;
		    /* border: 1px solid #dddddd; */
		}
		
		.reserve-container>div {
		    border: 1px solid #dddddd;
		}
		
		.reserve-title {
		    border-bottom: 1px solid #dddddd;
		    background-color: #444444;
		    text-align: center;
		    color: #dddddd;
		    padding: 5px;
		    font-size: 13px;
		    font-weight: bold;
		}
		
		.movie-part {
		    width: 284px;
		}
		
		.theater-part {
		    width: 264px;
		}
		
		.day-part {
		    width: 91px;
		}
		
		.time-part {
		    width: 384px;
		}
		
		.sort-wrapper {
		    margin: 10px 6px 6px 10px;
		    /* padding: 3px; */
		    display: flex;
		    border-bottom: 1px solid #dddddd;
		    font-size: 12px;
		}
		
		.sort-wrapper>div {
		    padding: 3px;
		}
		
		.sort-wrapper>div:hover {
		    border-bottom: 1px solid #111111;
		}
		
		.sort-selected {
		    font-weight: bold;
		    border-bottom: 1px solid #111111;
		}
		
		.sort-korean {
		    margin-left: 6px;
		}
		
		.reserve-date {
		    padding-top: 5px;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    height: 450px;
		    overflow: scroll;
		    overflow-x: hidden;
		}
		
		.movie-date-wrapper {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 5px 2px;
		}
		
		.movie-week-of-day {
		    margin-left: 5px;
		    font-size: 10px;
		    width: 12px;
		    height: 22px;
		    line-height: 22px;
		}
		
		.movie-day {
		    text-align: center;
		    width: 34px;
		    height: 22px;
		    font-size: 17px;
		    font-weight: bold;
		}
		
		.saturday {
		    color: #31597E;
		    font-weight: bold;
		}
		
		.sunday {
		    color: #AF2D2D;
		    font-weight: bold;
		}
		
		.movie-date-wrapper-active {
		    background-color: #333333;
		}
		
		.movie-date-wrapper-active>* {
		    color: white;
		}
		
		.theater-wrapper {
		    padding-left: 12px;
		    padding-top: 2px;
		    display: flex;
		}
		
		.theater-location-wrapper {
		    flex-grow: 1;
		    display: flex;
		    flex-direction: column;
		}
		
		.theater-place-wrapper {
		    padding-right: 2px;
		    margin-top: 2px;
		    height: 300px;
		    flex-grow: 1;
		    display: flex;
		    flex-direction: column;
		    overflow: scroll;
		    overflow-x: hidden;
		}
		
		.theater-location {
		    height: 30px;
		    font-size: 11px;
		    text-align: right;
		    background-color: #E6E4D9;
		    padding: 6px 6px 6px 0;
		    margin-top: 1px;
		}
		
		.theater-place {
		    padding: 6px 0 6px 0;
		    /* height: 40px;
		    width : 135px; */
		    font-size: 12px;
		    font-weight: bold;
		    text-align: left;
		}
		
		.reserve-time {
		    width: 300px;
		    margin: 0 auto;
		}
		
		.reserve-where {
		    font-size: 12px;
		    margin-top: 20px;
		    margin-left: 8px;
		    font-weight: bold;
		}
		
		.reserve-time-wrapper {
		    margin-top: 10px;
		}
		
		.reserve-time-button {
		    margin-top: 10px;
		}
		
		.reserve-time-want {
		    letter-spacing: 1px;
		    font-size: 12px;
		    padding: 3px;
		    font-weight: bold;
		    border: 1px solid #dddddd;
		}
		
		.reserve-time-remain {
		    color: #97B68D;
		}
		
		.reserve-time-active {
		    background-color: #333333;
		    color: white;
		}
		
		.theater-place-active {
		    background-color: #333333;
		    color: white;
		}
		
		.movie-list-wrapper {
		    padding: 4px 15px;
		}
		
		.movie-list-ul {
		    align-items: center;
		    list-style: none;
		    padding-left : 0px;
		}
		.movie-list-ul button{
			font-weight : bold;
			font-size: 12px;
			padding: 6px 0 6px 0;
		}
		
		.movie-list-age {
		    width: 24px;
		    height: 24px;
		    line-height: 24px;
		    text-align: center;
		    /* color: white; */
		    font-weight: bold;
		    font-size: 12px;
		    border-radius: 100%;
		    /* background-color: #AF2D2D; */
		}
		.moveSeatButton{
			
			font-size: 18px;
			font-weight: bold;
			padding: 5px;
			margin-top: 20px;
			margin-left: 80px;
			border: 1px solid #333333;
		}
		.moveSeatButton:hover{
			 background-color: #333333;
			 color: white;
		}
		.fifteen {
		    color: white;
		    background-color: #AF2D2D;
		    
		}
		
		.eighteen {
		    color: white;
		    background-color: red;
		    font-size: 11px;
		}
		
		.all {
		    color: white;
		    background-color: #52AE35;
		    font-size: 11px;
		}
		
		.movie-list-title {
		    padding: 6px 4px;
		    margin-left: 5px;
		    font-size: 12px;
		}
		
		.movie-list-title-active {
		    background-color: #333333;
		}
		
		.movie-list-title-active>button {
		    font-weight: bold;
		    color: white;
		}
		
		::-webkit-scrollbar {
		    width: 10px;
		    /* height: 8px; */
		    border: 3px solid #ffffff;
		}
		
		::-webkit-scrollbar-track {
		    background: #efefef;
		    -webkit-border-radius: 10px;
		    border-radius: 10px;
		    -webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .2)
		}
		
		::-webkit-scrollbar-thumb {
		    width: 50px;
		    height: 50px;
		    background: #444444;
		    -webkit-border-radius: 8px;
		    border-radius: 8px;
		    -webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .1)
		}
		</style>
				
		
		
		</div>
	</section>
	
	
	
	
	
	
	
	
	
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
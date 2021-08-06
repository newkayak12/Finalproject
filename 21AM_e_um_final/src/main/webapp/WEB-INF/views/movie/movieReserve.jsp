<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>    

<script>
	$(function(){
		let movieSeq = $("#receiveSeq").val();
		$.ajax({
			url:"${path}/movie/movieList",
			success:data=>{
				
				console.log(data);
				for(var i=0; i<data.length;i++){
					
					if(data[i]['movieSeq']!==movieSeq){
						$(".movie-list-ul").append(
								$("<li>").addClass("movieList").append($("<button>").html(data[i]["movieTitleKr"])
										.addClass('movieName col-12')
										.attr({"value":data[i]["movieSeq"],"onclick":"movieSeqFn(event);"})))
						$("#movieSeq2").attr("value",movieSeq);
					}else{
						$(".movie-list-ul").append(
								$("<li>").addClass("movieList").append($("<button>").html(data[i]["movieTitleKr"])
										.addClass('movieName col-12 active')
										.attr({"value":data[i]["movieSeq"],"onclick":"movieSeqFn(event);"})))
					}
						
				}
			}
		})
		
		$.ajax({
			url:"${path}/movie/movieBox",
			data:{"movieSeq":movieSeq},
			success:data=>{
				console.log(data);
				$("#location-1").html("")
				$("#movieTitle").append().html("영화 : " +data[0]['movieSeq']['movieTitleKr']).css("font-weight","bold");
				$("#movieBox2").append().html("영화관 : " +data[0]['movieBoxSeq']['movieBox']).css("font-weight","bold");
				$("#movieBox3").attr("value",data[0]['movieBoxSeq']['movieBox'])
				
				for(var i=0; i<data.length; i++){
					$("#location-1").append(
							$("<button>").addClass("theater-place justify-content-center")
							.html(data[i]["movieBoxSeq"]["movieLocation"])
							.attr({"value":data[i]["movieBoxSeq"]["movieLocation"]
							,"onclick":"showDate(event);"}).css("text-align","center"))
							
							
				}
			}
		})
		
	})
	
	const movieSeqFn=(e)=>{
		let seq = e.target.value;
		$(".movieName").removeClass('active');
		$(".theater-place").removeClass('active');
		$(".movie-date-wrapper").removeClass('movie-date-wrapper-active');
		$(".reserve-time-button").removeClass('active');
		$(e.target).addClass('active');
		$("#movieSeq2").value="";		
		$("#movieSeq2").attr("value",e.target.value);
		$("#movieBox3").attr("value","");
		$.ajax({
			url:"${path}/movie/movieBox",
			data:{"movieSeq":e.target.value},
			success:data=>{
				console.log(data);
				$("#location-1").html("")
				$("#movieTitle").append().html("영화 : " +data[0]['movieSeq']['movieTitleKr']).css("font-weight","bold");
				$("#movieBox2").append().html("영화관 : " +data[0]['movieBoxSeq']['movieBox']).css("font-weight","bold");
				$("#movieBox3").attr("value",data[0]['movieBoxSeq']['movieBox'])
				
				for(var i=0; i<data.length; i++){
					$("#location-1").append(
							$("<button>").addClass("theater-place justify-content-center")
							.html(data[i]["movieBoxSeq"]["movieLocation"])
							.attr({"value":data[i]["movieBoxSeq"]["movieLocation"]
							,"onclick":"showDate(event);"}).css("text-align","center"))
							
							
				}
			}
		})
		
	}
	
	/* $(".movieName").on("click",function(){
		$("reserve-time-button")
	}); */
	
	const showDate=(e)=>{

		
		$.ajax({
			url:"${path}/movie/movieTime",
			success:data=>{

				$(".reserve-time-wrapper").html("")
				for(var i=0; i<data.length;i++){
					
					$(".reserve-time-wrapper").append($("<button>").addClass("reserve-time-button ml-3 mr-3")
							.attr({"onclick":"showTime(event)","value":data[i]['movieTime']})
							.html(data[i]["movieTime"]))				
				}
				
			}
		})
		$("#movieLocation").append().html("지역 : "+e.target.value).css("font-weight","bold");
		$("#movieLocation2").attr("value",e.target.value);
		$(".reserve-date").css("display","flex");
		$(".theater-place").removeClass('active');
		$(e.target).addClass('active');
	}
	
	const showTime=(e)=>{
		$(".reserve-time-button").removeClass('active');
		$(e.target).addClass('active');
		$("#movieTime2").attr("value","");
		$("#movieTime2").attr("value",e.target.value);
		$("#movieTime").append().html("시간 : "+ e.target.value);
		$("#infomation").css("display","block");
		
	}
	
	/* const seoul=()=>{
		$("#location-2").css("display","none")
		$("#location-1").css("display","flex")
	}
	const gyeonggi=()=>{
		$("#location-1").css("display","none")
		$("#location-2").css("display","flex")
	}
	 */
</script>	
<style>
	.active{
		background-color: #2AC1BC;
		
	}
</style>
	
	
	<section class="mt-5 pt-5">
		<div id="root" class="container mt-5">
			<input type="hidden" value="${movieSeq }" id="receiveSeq">
			<div class="col-12" style="width: 100%"><h2 class="pl-5">영화예매</h2></div>
			<div class="reserve-container">
		        <div class="movie-part" style="height: 498px; width: 282px;">
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
		                    <div class="theater-box-wrapper" id="movieBox" >
		                    
		                    </div>
		                   
		                </div>
		            </div>
		        </div>
		        <div class="day-part" style="height: 498px;">
		            <div class="reserve-title" >날짜</div>
		            <div class="reserve-date" style="overflow:scroll; height: 450px; display: none">
		            	<span class="reserve-month"></span>
		            	<span class="reserve-nextMonth"></span>
		            </div>
		        </div>
		        <div class="time-part">
		            <div class="reserve-title">시간</div>
		            <div class="reserve-time col-12" style="height: 100px;">
		                <div class="reserve-where"></div>
		                <div class="reserve-time-wrapper" style="display: none;">
		                	
		                    <!-- <button class="reserve-time-button"> 
		                        <span class="reserve-time-want">ㅎ</span>
		                        
		                    
		                    </button> -->
		
		                </div>
		            </div>
		            <div id="infomation" style="height: 200px; display: none;" >
		            	<h3 id="movieTitle">영화 : </h3>
		            	<h4 id="movieLocation">지역 : </h4> <h4 id="movieBox2">관 : </h4>
		            	<h5 id="movieDate">날짜 : </h5> <h5 id="movieTime">시간 : </h5>
		            </div>
		            
		            <div>
		            <form class="moveSeatForm" action="${path }/movie/seatStart" method="post">
			            <input type="hidden" id="movieSeq2" name="movieSeq"> 
			            <input type="hidden" id="movieTime2" name="movieTime"> 
			            <input type="hidden" id="movieLocation2" name="movieLocation">
			            <input type="hidden" id="movieBox3" name="movieBox">
			            <input type="hidden" id="movieDate2" name="movieDate">
			            <button class="moveSeatButton btn btn-primary" type="submit" style="float: right;">예매하기</button>
		            </form>
		            </div>
		        </div>
		
		    </div>
		
		</div>
	</section>
		<script>
		    const date = new Date();
		    const nextMonthDate = new Date(date.getFullYear(), date.getMonth()+1 ,1);
		    console.log(nextMonthDate);
		    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
		    const reserveNextMonth = document.querySelector(".reserve-nextMonth");
		    const reserveMonth = document.querySelector(".reserve-month");
		    /* const nextMonthDate = new Date(date.getMonth()+2);
	       	const nextMonthLastDate = new Date(new Date(date.getFullYear(), date.getMonth()+2,0)); */
		    const nextMonth = date.getMonth()+2;
	       	const nextMonthLastDay = new Date(date.getFullYear(),date.getMonth()+2,0);
	       	console.log(nextMonthLastDay);
	       	
	       		const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
		        const year = date.getFullYear();
		        const month = date.getMonth()+1;
		        
		        reserveMonth.innerHTML = month+"월";
		        for (i = date.getDate(); i <= lastDay.getDate(); i++) {
					
		            const button = document.createElement("button");
		            const spanWeekOfDay = document.createElement("span");
		            const spanDay = document.createElement("span");
					
		            //class넣기
		            button.classList = "movie-date-wrapper"
		            spanWeekOfDay.classList = "movie-week-of-day";
		            spanDay.classList = "movie-day";
		
		            //weekOfDay[new Date(2021.07.31)]
		            const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];
		            
		            
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
		            /* span.html(month+"월") */
		            //button.append(i);
		            button.value=[(year + "." +month + "." + i)];
		           /*  reserveDate.append(span); */
		            reserveMonth.append(button);
					
		            dayClickEvent(button);
		        }
		        console.log(nextMonthDate.getDate());
		        reserveNextMonth.innerHTML=nextMonth+"월";
				for (i = nextMonthDate.getDate(); i <= nextMonthLastDay.getDate(); i++) {
					
		            const button = document.createElement("button");
		            const spanWeekOfDay = document.createElement("span");
		            const spanDay = document.createElement("span");
					
		            //class넣기
		            button.classList = "movie-date-wrapper"
		            spanWeekOfDay.classList = "movie-week-of-day";
		            spanDay.classList = "movie-day";
		
		            //weekOfDay[new Date(2021.07.31)]
		            const dayOfWeek = weekOfDay[new Date(year + "." + nextMonth + "." + i).getDay()];
		            
		            
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
		            button.value=[(year + "." +nextMonth + "." + i)];
		            
		            reserveNextMonth.append(button);
					
		            dayClickEvent(button);
		        }
		    
		
		
		    function dayClickEvent(button) {
		        button.addEventListener("click", function() {
		            $(".reserve-time-wrapper").css("display","block"); 
		        	$("#movieDate").append().html("날짜 : "+ button.value);
		        	$("#movieDate2").attr("value","");
		        	$("#movieDate2").attr("value",button.value);
		            const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
		            movieDateWrapperActive.forEach((list) => {
		                list.classList.remove("movie-date-wrapper-active");
		            })
		            button.classList.add("movie-date-wrapper-active");
		        })
		    }
		    
		    
		    
		    
		    
		    
		    
		    
		</script>
		
		
		
		<style>
		
		
		#root{
		    width:100%;
		    /* min-height:500px; */
		    font-family:'Noto Sans KR';
		    
		    
		 }
		
		
		
		/* content */
		
		.reserve-container {
		    margin-top: 30px;
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
		    background-color: #2AC1BC;
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
		    background-color: #2AC1BC;
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
		    background-color: #2AC1BC;
		    color: white;
		}
		
		.theater-place-active {
		    background-color: #2AC1BC;
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
				
		
		
	
	
	
	
	
	
	
	
	
	
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
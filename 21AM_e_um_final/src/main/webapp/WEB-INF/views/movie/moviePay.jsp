<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>  

</head>
<body>


	<input type="hidden" id="movieSeq" name="movieSeq" value="${newParam.movieSeq }">
	<input type="hidden" id="movieLocation" name="movieLocation" value="${newParam.movieLocation }">
	<input type="hidden" id="movieBox" name="movieBox" value="${newParam.movieBox }">
	<input type="hidden" id="movieDate" name="movieDate" value="${newParam.movieDate }">
	<input type="hidden" id="movieTime" name="movieTime" value="${newParam.movieTime }">
	<input type="hidden" id="movieSeats" name="movieSeats" value="${newParam.selectedSeat }">
	<input type="hidden" id="moviePrice" name="moviePrice" value="${newParam.moviePrice }">
	<input type="hidden" id="movieTitle" name="movieTitle" value="${newParam.movieTitle }">
	
	 <script>
		 $(function () {
			   /* $.ajax({
		        	url:"${path}/movie/payEnd",
		        	data:{
		        		"movieSeq":$("#movieSeq").val(),
		        		"movieLocation":$("#movieLocation").val(),
		        		"movieBox":$("#movieBox").val(),
		        		"movieDate":$("#movieDate").val(),
		        		"movieTime":$("#movieTime").val(),
		        		"movieSeats":$("#movieSeats").val(),
		        		"moviePrice":$("#moviePrice").val(),
		        		"movieTitle":$("#movieTitle").val()
		        	},
		        	success:data=>{
		        		console.log(data);
		        		let result = "";
		        		for(var i=1; i<5;i++){
		        			console.log(data["movieSeat"+i]);
		        			if((data["movieSeat"+i]) !== null){
				  				result += (data["movieSeat"+i])+" ";
			  				}
		        		}
		        		
		        		$("#movieTitle1").html("영화제목 : "+data['movieTitle'])
		        		$("#movieReserveNum1").html("예매번호 : "+data['movieReservNum'])
		        		$("#movieLocation1").html("지역 :"+data['movieLocation'])
		        		$("#movieBox1").html("영화관 :"+data["movieBox"])
		        		$("#userId1").html("아이디 :"+data["userId"])
		        		$("#movieSeat1").html("좌석 :"+result)
		        		$("#movieTime1").html("시간 :"+data["movieTime"])
		        		$("#movieDate1").html("날짜 :" + data["movieDate"])
		        		$("#content").css("display","block");
		        	}
		        }) */ 
		        var IMP = window.IMP; // 생략가능
			    IMP.init('imp71220424');
			    
			    IMP.request_pay({
				    pg: 'html5_inicis',
				    pay_method: 'card',
				    merchant_uid: 'merchant_' + new Date().getTime(),
				    name: $("#movieTitle").val(),
				    /* amount: $("#moviePrice").val(),  */
				   	amount:100,
			   
			    }, function (rsp) {
				    if (rsp.success) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        $.ajax({
				        	url:"${path}/movie/payEnd",
				        	data:{
				        		
				        		"movieSeq":$("#movieSeq").val(),
				        		"movieLocation":$("#movieLocation").val(),
				        		"movieBox":$("#movieBox").val(),
				        		"movieDate":$("#movieDate").val(),
				        		"movieTime":$("#movieTime").val(),
				        		"movieSeats":$("#movieSeats").val(),
				        		"moviePrice":$("#moviePrice").val(),
				        		"movieTitle":$("#movieTitle").val()
				        	},
				        	success:data=>{
				        		
				        		console.log(data);
				        		let result = "";
				        		for(var i=1; i<5;i++){
				        			console.log(data["movieSeat"+i]);
				        			if((data["movieSeat"+i]) !== null){
						  				result += (data["movieSeat"+i])+" ";
					  				}
				        		}
				        		
				        		$("#movieTitle1").html("영화제목 : "+data['movieTitle'])
				        		$("#movieReserveNum1").html("예매번호 : "+data['movieReservNum'])
				        		$("#movieLocation1").html("지역 :"+data['movieLocation'])
				        		$("#movieBox1").html("영화관 :"+data["movieBox"])
				        		$("#userId1").html("아이디 :"+data["userId"])
				        		$("#movieSeat1").html("좌석 :"+result)
				        		$("#movieTime1").html("시간 :"+data["movieTime"])
				        		$("#movieDate1").html("날짜 :" + data["movieDate"])
				        		$("#content").css("display","block");
				        	}
				        })
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        location.assign("${path}/movie/movieReserve");
				    }
				    alert(msg);
			    }); 
		});
		
		 const fn_movieMain=()=>{
			 location.assign("${path}/movie/movieInfo");
		 }
		 const fn_Main=()=>{
			 location.assign("${path}/user/gotomain");
		 }
		 
	</script>
	
	<section class="mt-5 pt-5" >
		<div id="root" class="container mt-5">
			<div id="content" class="col-12 d-flex justify-content-around" style="border: 1px solid black; display: none;">
				    <div style="width: 600px; height: 400px; border: 1px solid black;">
			        <div><h2 id="movieTitle1">영화관 :</h2></div>
			        <div><h3 id="movieReserveNum1">예매번호 : </h3></div>
			        <div><h4 id="movieLocation1">지역 :</h4></div>
			        <div><h4 id="movieBox1">영화관 :</h4></div>       
			        <div><h5 id="userId1">아이디 :</h5></div>
			        <div><h5 id="movieSeat1">좌석 :</h5></div>
			        <div><h5 id="movieTime1">시간 :</h5></div>
			        <div><h5 id="movieDate1">날짜 :</h5></div>
			        <div class="mt-5" style="text-align: center;">
			        	<button class="btn mr-4" onclick="fn_movieMain();">영화메인</button>
			        	<button class="btn ml-4" onclick="fn_Main();">홈으로</button>
			    	</div>
			    </div>
			</div>
		</div>
	</section>
	
	<style>
		#root{
			font-family:'Noto Sans KR';
		}
	</style>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
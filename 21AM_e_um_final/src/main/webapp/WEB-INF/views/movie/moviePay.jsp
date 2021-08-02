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
		        		
		        	}
		        })
		        /* var IMP = window.IMP; // 생략가능
			    IMP.init('imp71220424');
			    
			    IMP.request_pay({
				    pg: 'html5_inicis',
				    pay_method: 'card',
				    merchant_uid: 'merchant_' + new Date().getTime(),
				    name: $("#movieTitle").val(),
				    amount: 100,
				   
			   
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
				        	}
				        })
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        location.assign("${path}/movie/movieInfo");
				    }
				    alert(msg);
			    });   */
		});
		 	
	</script>
	
	<section class="mt-5 pt-5">
		<div id="root" class="container mt-5">
			<div class="col-12" style="border: 1px solid black;">
				    <div style="width: 400px; height: 400px; border: 1px solid black; text-align: center;">
			        <div><h2 id="movieTitle">영화제목:</h2></div>
			        <div><h3 id="movie">예매번호:</h3></div>
			        <div><h4>영화지역 :</h4></div>
			        <div><h4>영화관:</h4></div>       
			        <div><p>예매아이디:</p></div>
			        <div><p>좌석:</p></div>
			        <div><p>시간 : </p></div>
			        <button>영화메인</button><button>홈으로</button>
			    </div>
			</div>
		</div>
	</section>
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
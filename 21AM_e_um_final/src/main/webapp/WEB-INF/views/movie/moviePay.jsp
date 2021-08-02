<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>  

</head>
<body>

${fuckingparam }


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
		        		"movieSeq":$("#movieSeq").value,
		        		"movieLocation":$("#movieLocation").value,
		        		"movieBox":$("#movieBox").value,
		        		"movieDate":$("#movieDate").value,
		        		"movieTime":$("#movieTime").value,
		        		"movieSeats":$("#movieSeats").value,
		        		"moviePrice":$("#moviePrice").value,
		        		"movieTitle":$("#movieTitle").value
		        	},
		        	success:data=>{
		        		console.log(data);
		        	}
		        })
		 });
			 	/* var IMP = window.IMP; // 생략가능
			    IMP.init('imp71220424');
			    
			    IMP.request_pay({
				    pg: 'html5_inicis',
				    pay_method: 'card',
				    merchant_uid: 'merchant_' + new Date().getTime(),
				    name: $("#movieTitle").val(),
				    amount: $("#moviePrice").val(),
				   
			   
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
				        		
				        	}
				        })
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        location.assign("${path}/movie/movieInfo");
				    }
				    alert(msg);
			    }); 
		});*/
		 
		 
		 
		 
		
	</script>
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
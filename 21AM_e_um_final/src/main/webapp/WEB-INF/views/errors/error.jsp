<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<title>E_um</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/js/jquery-ui-1.12.1/jquery-ui.css" 	rel="stylesheet">
<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!--폰트 타이틀-->
<link
	href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap"
	rel="stylesheet">
<!--폰트 내용-->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
</head>
<body class="d-flex flex-column justify-content-center align-items-center">
	<div class="d-flex justify-content-between mb-5">
		<img alt ="logo" src="${pageContext.request.contextPath }/resources/images/main/eum_title.png" width="40%">
		<div class="d-flex justify-content-center align-items-center tway"><p style="font-size:4vw;">잘못된 접근입니다.</p></div>
	</div>
	<div class="mt-5" id="timer">5초 후에 메인으로 돌아갑니다.</div>
	
	<script >
		
		$(function(){
			timeset()
		})
		
		var time = 5;
		function timeset (){
			let timeSet = setInterval(()=>{
				time = time-1
				$("#timer").html(time+"초 후에 메인으로 돌아갑니다.")
				if(time<1){
					
					location.assign("${pageContext.request.contextPath}/index.jsp")
					clearInterval(timeSet)
				}
			},1000)
			
		}
	
	</script>
</body>
</html>
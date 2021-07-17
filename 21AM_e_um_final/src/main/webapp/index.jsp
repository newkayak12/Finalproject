<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
	<!-- jQuery library -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script> 
	<%-- <script   src="https://code.jquery.com/jquery-3.6.0.slim.js"   integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="   crossorigin="anonymous"></script> --%>
	<!-- <script src="${path }/resources/js/jquery-3.6.0.min.js"></script> -->
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- all -->
<!-- <link rel="stylesheet" href="../webapp/resources/css/main.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sanghyun.css">
 <style>
 
 *{
    border:1px black solid
}


</style>
	
<script>
	const fn_login=()=>{
		$("#modalLoginTitle").html("로그인");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/user/login/start",
			method:"get",
			data:{"testKey":"테스트"},
			processDate:true,
			success:data=>{
				console.log(data)
				$("#minimodalRoot").html(data)
			}
		}).done(
			$("#minimodalRoot").html(data)
		)
	}
	const fn_lostAndFound=()=>{
		$("#modalLoginTitle").html("아이디/ 비밀번호 찾기");
		$("#loginContainer").css("display","none")

		
	}

</script>
</head >

<body >
	<div id="root" class="container m-auto pt-5 pr-3 pl-3" style="border: 1px red solid;"></div>
		<!-- header -->
		<header id="header-container" class="fluid-container pt-2 pb-2 pr-3 pl-3 m-0 fixed-top headerColor navbar-ligth bg-light">
			<div class="pt-1 pb-1 d-flex justify-content-end ">
				<span class="mr-3 right">
					<button class="btn btn-secondary"  data-toggle="modal" data-target="#modal" >회원가입</button>
				</span>
				<span class=" justify-content-end mr-3">
					<button class="btn btn-success" onclick="fn_login()" data-toggle="modal" data-target="#modal" >로그인</button>
				</span>
			</div>
		</header>
	
	
		<section class=" fluid-container position-relative headerfix sectionMinHeight mb-1">
			
	
				<div class="fluid-container">
					<div class="d-flex justify-content-center">
						<img src="" alt="로고" class="col-3 m-1">
					</div>
					<div class="d-flex justify-content-center">
						<div class="container text-center p-3 m-3">
							내용
							
						</div>
					</div>
				</div>
				
				<div class="d-flex flex-column align-content-center justify-content-center fluid-container">
					
					<div class="d-flex justify-content-around" >
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around row-equal-cols">
							<img src="" alt="img" class="col-12">
						</span>
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around">
							<p>내용</p>
						</span>
					</div>
	
	
					<div class="d-flex justify-content-around " >
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around">
							<p>내용</p>
						</span>
	
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around">
						<img src="" alt="img" class="col-12" >
						</span>
						
					</div>
	
					<div class="d-flex justify-content-around " >
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around row-equal-cols">
						<img src="" alt="img" class="col-12" >
						</span>
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around">
							<p>내용</p>
						</span>
					</div>
	
	
					<div class="d-flex justify-content-around " >
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around">
							<p>내용</p>
						</span>
	
						<span class="col-5 text-center p-2 d-flex flex-column justify-content-around">
						<img src="" alt="img" class="col-12" >
						</span>
						
					</div>
	
	
				</div>
	
	
	
			
		</section> 
		<footer class=" fluid-container footer-basic p-1 position-relative">
	        <ul class="list-inline m-1">
	            <li class="list-inline-item "><a href="#">Home</a></li>
	            <li class="list-inline-item "><a href="#">Services</a></li>
	            <li class="list-inline-item "><a href="#">About</a></li>
	            <li class="list-inline-item "><a href="#">Terms</a></li>
	            <li class="list-inline-item "><a href="#">Privacy Policy</a></li>
	        </ul> 
	        <p class="copyright m-1">
	            (주)이음 | 주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 |이메일 : eum@eum.com <br>
	            
	        </p>
	        <p class="copyright m-1">팀장 : 김상현 | 팀원 : 김예진 김태희 이우식 장혜린</p>
	        <p class="copyright m-1">Copyright ©2021 E_um Co.Ltd.All rights reserved</p>
	    </footer>


<!-- modal-xl -->
	<div class="modal" id="modal">
		<div class="modal-dialog  modal-dialog-centered modal-dialog-scrollable">
		  <div class="modal-content">
	  
			<!-- Modal Header -->
			<div class="modal-header">
			  <h4 class="modal-title" id="modalLoginTitle">로그인</h4>
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
	  
			<!-- Modal body -->
			<div class="modal-body" id="modalbody">
				<div id="minimodalRoot">
					
				</div>
			</div>
	  
			<!-- Modal footer -->
			<div class="modal-footer">
			  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
	  
		  </div>
		</div>


</div> <!-- root end -->
</body>
</html>
   
  
 
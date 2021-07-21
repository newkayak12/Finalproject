<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
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
    /* border:1px black solid */
}


</style>
	
<script>

	function loginAjax(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/login/start",
			method:"get",
			success:data=>{
				$("#minimodalRoot").html(data)
			}
		})
	}
	
	function lostAndFoundajax(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/lostandfound/start",
			success:data=>{
				$("#minimodalRoot").html(data)
			}
		})
	}
	function findmyidajaxstart(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/findmyid/start",
			success:data=>{
				$("#minimodalRoot").html(data)
			}
		})
	}
	function findmypwajaxstart(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/findmypw/start",
			success:data=>{
				$("#minimodalRoot").html(data)
			}
		})
	}
	function findmyidajaxmiddle(flag){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/findmy/middle",
			data:{
				"flag":flag,
				"userName":$("#userName").val(),
				"userEmail":$("#userEmail").val()
			},
			success:data=>{
				$("#minimodalRoot").html(data)
			}
		})
	}
	function findmypwajaxmiddle(flag){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/findmy/middle",
			data:{
				"flag":flag,
				"userId":$("#userId").val(),
				"userEmail":$("#userEmail").val()
			},
			success:data=>{
				$("#minimodalRoot").html(data)
			}
		})
	}
	function signupzero(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/signup/start/zero",
			success: data=>{
				$("#largemodalRoot").html(data)
			}
		})
	}
	function signupfirst(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/signup/start/first",
			success:data=>{
				$("#largemodalRoot").html(data)
			}
		})
	}
	function signupsecond(){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/user/signup/start/second",
			data:{
				"userId":$("#userId").val(),
				"userPassword":$("#userPassword").val(),
				userName:$("#userName").val(),
				"userYear":$("#userBirth").val(),
				"userEmail":$("#userEmail").val(),
				"userAddrZip":$("#userAddrZip").val(),
				"userAddrBasic":$("#userAddrBasic").val(),
				"userAddrDetail":$("#userAddrDetail").val(),
				"userGender":$("input[name=userGender]").val(),
				"userPhone":$("#userPhone").val(),
				"userNick":$("#userNick").val()
			},success:data=>{
				$("#largemodalRoot").html(data)
			}
		})
	}
	function signupthird(){
		
		valueInjection();
		let formData = new FormData($("#formdatas")[0])
		$.ajax({
			url:"${pageContext.request.contextPath}/user/signup/start/third",
			type:"post",
			enctype:"multipart/form-data",			
			data:/* {
				"userId":$("#userId").val(),
				"userPassword":$("#userPassword").val(),
				userName:$("#userName").val(),
				"userYear":$("#userBirth").val(),
				"userEmail":$("#userEmail").val(),
				"userAddrZip":$("#userAddrZip").val(),
				"userAddrBasic":$("#userAddrBasic").val(),
				"userAddrDetail":$("#userAddrDetail").val(),
				"userGender":$("#userGender").val(),
				
				"profileInterestName1":$("#profileInterestName1").val(),
				"profileInterestName1":$("#profileInterestName2").val(),
				"profileInterestName1":$("#profileInterestName3").val(),
				"profileInterestName1":$("#profileInterestName4").val(),
				"profileInterestName1":$("#profileInterestName5").val()
			} */formData,
			contentType:false,
			processData:false,
			
			
			success:data=>{
				loginAjax();
				$("#signup").modal("hide");
				$("#signin").modal("show");
			}
		})
		
	}
	function loginVerifyAjax(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/loginverify",
			data:{userId:$("#userId").val(), userPassword:$("#userPassword").val(), persistlogin:$("#persistlogin").prop("checked") },
			success:data=>{
				if(data!=0){
					location.assign("${pageContext.request.contextPath}/user/gotomain");					
				} else {
					alert('존재하지 않는 아이디 입니다.')
				}
			}
		})
	}
	
	
	const fn_login=()=>{
		$("#modalLoginTitle").html("로그인");
		loginAjax();	
	}
	const fn_lostAndFound=()=>{
		$("#modalLoginTitle").html("아이디/ 비밀번호 찾기");
		lostAndFoundajax();
	}
	const findmyid=()=>{
		$("#modalLoginTitle").html("아이디 찾기");
		findmyidajaxstart();
	}
	const findmypw=()=>{
		$("#modalLoginTitle").html("비밀번호 찾기");
		findmypwajaxstart()
	}
	const findmyidpwmiddle=()=>{
		let findflag = $("#findmyflag").val();
		
		if(findflag=='id'){
			findmyidajaxmiddle(findflag)
		} else if(findflag=='pw'){
			findmypwajaxmiddle(findflag)
		}
	}
	
	const fn_agree=()=>{
		if($("#agreebtn").attr("disabled")=="disabled"){
			$("#agreebtn").attr("disabled",false)
		} else {
			$("#agreebtn").attr("disabled",true)
		} 
	}
	const fn_signupzero=()=>{
		signupzero()
	}
	const fn_signupfirst=()=>{
		signupfirst()	
	}
	const fn_signupsecond=()=>{
		signupsecond()
	}
	const fn_signupthrid=()=>{
		signupthrid()
	}
	
	const fn_changepw=()=>{
		$.ajax({
			url:"${pageContext.request.contextPath}/user/changepw",
			data:{"userId":$("#userId").val(),"userPassword":$("#userPassword").val()},
			success:data=>{
				if(data!=0){
					alert('비밀번호 변경을 완료했습니다.')
				  fn_login() 
				} else {
					alert('비밀번호 변경에 실패했습니다.')
				}		
			}
		})
	}
	
	
	
	
	
	
</script>
</head >
<body >
	<div id="root" class="container m-auto pt-5 pr-3 pl-3" style="border: 1px red solid;"></div>
		<!-- header -->
		<header id="header-container" class="fluid-container pt-2 pb-2 pr-3 pl-3 m-0 fixed-top headerColor navbar-light bg-light">
			<div class="pt-1 pb-1 d-flex justify-content-end ">
				<span class="mr-3 right">
					<button class="btn btn-secondary eumbtn-1" onclick="fn_signupzero()" data-toggle="modal" data-target="#signup" >회원가입</button>
				</span>
				<span class=" justify-content-end mr-3">
					<button class="btn btn-success eumbtn-2" onclick="fn_login()" data-toggle="modal" data-target="#signin" >로그인</button>
				</span>
			</div>
		</header>
	
	
		<section class=" fluid-container position-relative headerfix sectionMinHeight mb-1 mt-1">
			
	
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


<!-- 
	modal-xl
	modal-dialog-scrollable
 -->
	<div class="modal" id="signin">
		<div class="modal-dialog  modal-dialog-centered ">
		  <div class="modal-content">
	  
			<!-- Modal Header -->
			<div class="modal-header">
			  <h4 class="modal-title" id="modalLoginTitle">로그인</h4>
			  <button type="button eumbtn-3" class="close" data-dismiss="modal">&times;</button>
			</div>
	  
			<!-- Modal body -->
			<div class="modal-body" id="modalbody">
				<div id="minimodalRoot" class= "p-0 d-flex justify-content-center align-content-center flex-column"style="min-height: 300px">
					
				</div>
			</div>
	  
			<!-- Modal footer -->
			<div class="modal-footer">
			  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
	  
		  </div>
		</div>
	</div>
		<!--  -->
		
		
		<div class="modal" id="signup">
			<div class="modal-dialog  modal-dialog-centered  modal-xl modal-dialog-scrollable">
			  <div class="modal-content">
		  
				<!-- Modal Header -->
				<div class="modal-header">
				  <h4 class="modal-title" id="xlmodalLoginTitle">회원가입</h4>
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		  
				<!-- Modal body -->
				<div class="modal-body" id="xlmodalbody">
					<div id="largemodalRoot" class= "p-0 d-flex justify-content-center align-content-center flex-column"style="min-height: 300px">
					
					</div>
				</div>
		  
				<!-- Modal footer -->
				<div class="modal-footer">
				  <button type="button" class="btn btn-danger eumbtn-3" data-dismiss="modal">Close</button>
				</div>
		  
			  </div>
		</div>


</div> <!-- root end -->
</body>
</html>
   
  
 
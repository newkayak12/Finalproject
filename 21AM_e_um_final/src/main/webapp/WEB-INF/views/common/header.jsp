<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }"
	scope="application" />
<c:set var="session" value="${userSession }" scope="session" />
<style>
* {
	/*    border: 1px black solid */ 
	
}
</style>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">


<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/js/jquery-ui-1.12.1/jquery-ui.css" 	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui-1.12.1/jquery-ui.js"></script>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css">
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	

<title>E_um</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon/favicon.ico" type="image/x-icon" sizes="64x64">

<link rel="icon" href="${pageContext.request.contextPath }/resources/images/favicon/favicon.ico" type="image/x-icon" sizes="64x64">

</head>
<body>

	<header>
		<nav
			class="navbar navbar-expand-sm fixed-top bgColorMainColor whiteText navbar-light justify-content-between d-flex">

			<!--로고 자리-->
			<div
				style="font-family: 'twayair', cursive; font-weight: 900; font-size: 25px;">
				<a href="${pageContext.request.contextPath }/user/gotomain" style="text-decoration: none" class="navbar_brand  ml-2 whiteText">
					<img src="${pageContext.request.contextPath }/resources/images/header/header.png" width="90px" height="45px"> 
				</a>
			</div>
			<%-- <div style="margin:0px;"><a href="${pagecontex.request.contextPath }/user/gotomain" class="navbar_brand ml-2 text-body"><img width="75px" height="37px" src="${ path }/resources/images/main/eum_title.png"></a></div> --%>
	
			<!--메뉴-->
			<div id="head_menu" class="col-6 p-0 ">
				<ul
					class="navbar-nav p-0 col-12 d-flex  flex-row justify-content-around">
					<li class="nav-item col-4 col-sm-4  col-md-3  p-0"><a
						class="nav-link text-center" href="${pageContext.request.contextPath }/friend/main"
						style="color: white !important;">친구 찾기</a></li>
					<li class="nav-item col-3  col-sm-3 col-md-3 p-0"><a
						class="nav-link text-center" href="${pageContext.request.contextPath }/group/groupMain.do"
						style="color: white !important;">소모임</a></li>
					<li class="nav-item dropdown col-4  col-md-3 p-0"><a
						class="nav-link dropdown-toggle col-12 text-center whiteText"
						href="#" id="navbardrop" data-toggle="dropdown"
						style="color: white !important;">플레이스</a>
						<div class="dropdown-menu">
							<a class="dropdown-item text-center"
								href="${pageContext.request.contextPath }/food/foodMain" style="color: #2AC1BC !important;">맛집</a>
							<a class="dropdown-item text-center"
								href="${pageContext.request.contextPath }/movie/movieInfo"
								style="color: #2AC1BC !important;">영화</a>
						</div></li>
				</ul>
			</div>

			<!--아이콘 메뉴-->
			<div id="icon_menu" class="iconbox">
				<ul class="navbar-nav">

					<li class="nav-item col-3"><i class="fas fa-bell fa-lg fa-7x"
						id="alarmicon" onclick="showalarm()" style="font-size: 20px;"></i>
						<span class="small text-center"
						style="position: fixed; top: 5px; right: 170px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display: none; width: 25px; height: 25px"
						id="alarmCount"></span></li>

					<li class="nav-item col-3 "><i class="fas fa-user fa-lg fa-7x"
						style="font-size: 20px;" onclick="showmypage()"></i></li>

					<li class="nav-item col-3"><i
						class="fa fa-address-book fa-lg fa-7x" aria-hidden="true"
						style="font-size: 20px;" onclick="showfriendList()"></i></li>


					<li class="nav-item col-3"><i
						class="fas fa-comments fa-lg fa-7x" style="font-size: 25px;"
						onclick="showchatList()"></i> <span class="small text-center"
						style="position: fixed; top: 5px; right: 10px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display: none; width: 25px; height: 25px"
						id="chatCount"></span></li>

				</ul>
				<div id="toolbox" class="border">
					<div style="position: fixed; right: 5px;" id="innerXbox"
						class="text-center d-flex justify-content-between ">
						<div id="controlpanel"></div>
						<div class="pr-4" onclick="closetoolbox()">X</div>
					</div>


					<div class="mt-4 text-center" id="toolinnerbox"></div>
				</div>
			</div>

			<i class="fas fa-align-justify fa-lg" id="hamburgerbtn"
				onclick="ham()"> </i>

		</nav>
		<div class="hamback" onclick="unham()"></div>

		<div class="hamdown col-6">
			<div class="mt-5 d-flex justify-content-end">
				<i class="fas fa-times closeham" onclick="unham()"></i>
			</div>

			<ul class="hamnav mt-2 mb-2 navbar-nav col-5 p-0">
				<li class="nav-item"><a class="nav-link text-center"
					href="${pageContext.request.contextPath }/friend/main">친구 찾기</a></li>
				<li class="nav-item"><a class="nav-link text-center"
					href="${pageContext.request.contextPath }/group/groupMain.do">소모임</a></li>
				<li class="nav-item"><a
					class="nav-link dropdown-toggle col-12 text-center"
					onclick="sumbmenucontroller()" href="#">플레이스</a></li>
			</ul>
			<div id="submenu" class="mt-1 col-5 p-0">
				<div class="text-center ">
					<a class="nav-link" href="${pageContext.request.contextPath }/food/foodMain">맛집</a>
				</div>
				<div class="text-center ">
					<a class="nav-link" href="${pageContext.request.contextPath }/movie/movieInfo">영화</a>
				</div>
			</div>

		</div>


	</header>
	<div class="modal" id="headerprofile">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div style="background-color: rgb(113, 120, 127);">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body"
					style="background-color: rgb(113, 120, 127);">
					<div
						class="d-flex flex-column justify-content-center align-items-center">

						<img id="headerProfileImage" class="mt-3"
							style="width: 200px; height: 200px; border-radius: 100%;">
						<div class="mt-5 mb-5">
							<div id="headerProfileNickname" class="text-center mb-3 col-12"
								style="font-size: 20px; color: white"></div>
							<div id="headerProfileStatus" class="text-center col-12"
								style="font-size: 20px; color: white"></div>
						</div>

					</div>
				</div>

				<!-- Modal footer -->
				<div class="d-flex flex-row justify-content-center pt-2 pb-2" style="background-color: rgb(113, 120, 127);">
					<span class="ml-2 mr-2" id="headerGoprofile"> 
					<i class="fa fa-th-large m-4" aria-hidden="true" style="font-size: 30px; color: white"></i>
					<div class="text-center" style="color: white;">프로필 보기</div>
					</span> <span class="ml-2 mr-2" id="headerChat"> 
					<i class="fa fa-comments m-4 mb-1 " aria-hidden="true" style="font-size: 30px; color: white"></i>
						<div class="text-center" style="color: white;" >채팅하기</div>
					</span>

					<!-- <button type="button" class="btn btn-primary eumbtn-1" data-dismiss="modal" id="headerGoprofile">프로필</button> -->
					<!-- <button type="button" class="btn btn-success eumbtn-2" data-dismiss="modal" id="headerChat" >채팅</button> -->
				</div>

			</div>
		</div>
	</div>
	<div id="chatdraggerable" class="ui-widget-content " style="content:''; z-index:400; min-width:300px; width:500px; min-height:400px; height:500px; position:absolute;   top:100px; left:50px; border:1px black solid; display:none; background-color: white">
		<div class="col-12 border d-flex justify-content-between" style="height:10%; max-height:50px position:fixed; top:0px;">
			<span id="headerchatidBox">제목</span>
			<span onclick ="headerchatclean()">X</span>
		</div>
		<div id="chatRoottop" class="col-12 border mb-0" style="height:80%;  overflow:auto;">
			
		</div>
		<div class="col-12 border mb-0 d-flex justify-content-around align-items-center" style="height:10%; max-height:100px; position:absolute; bottom:0px;">
			<input type="text" id="chatinputboxTop" class="col-9 border" placeholder="내용을 입력하세요" onkeyup="entertosend()"> <input type="button" id="headerbtn" class="checkBtn col-2" value="전송" onclick="sendmsg()">

			<input type="hidden" id="chatRoomTophidden1">
			<input type="hidden" id="chatRoomTophidden2">
		</div>
	</div>
	
<div class="toast" style = "position:fixed; top: 60px; right:0px; width: 200px; max-width:300px">
  <div class="toast-header" style="background-color : #2AC1BC; color:black; font-weight:bold">
    <span id="toastId"></span>
    <span id="toastCount" class="ml-4 small badge badge-light"></span>
  </div>
  <div class="toast-body" id="toastContent">
    Some text inside the toast body
  </div>
</div>
	
	<script>
	
	function profileChat(){
		$("")
	}
	
/* 헤더 채팅 */
function headerchatclean(){
	$("#headerchatroot").html("")
	$("headerchatidBox").html("")
	$("#chatdraggerable").css("display","none")
	let room = $("#chatRoomTophidden1").val();
	let target = $("#chatRoomTophidden2").val();
	let myId= '${userSession.userId}'
		
		let data = '{"room":"","my":"'+myId+'","target":"'+target+'","flag":"fin","msg":""}';
		let result = JSON.parse(data)
		socket.send(data)
	
	
}
	
	




	if($(".iconboxfooter").css("display")=="none"){
		/*  console.log('헤더') */ 
	} else {
		/* console.log('푸터') */					
	}

	
	/* 초기화 , 알람 */

$(function(){
	alarmCount()
	fn_chatAlarmCount();
	onlinesocketinit()
	$("#chatdraggerable").draggable();
	$("#chatdraggerable").resizable();
	
	/* console.log("start"+$(".iconboxfooter").css("display")) */
	    	
    setInterval(()=>{
    	alarmCount()
    	fn_chatAlarmCount();
    	onlinesend()
    	/* $('.toast').toast('show'); */
    	
    },20000)
})





let onlinesocket = null;
let onlinelist  = '';
function onlinesocketinit(){
	onlinesocket = new SockJS('${pageContext.request.contextPath}/online');
	onlinesocket.onopen=e=>{
		
		onlinesocket.send("${userSession.userId}")
		/* console.log(e) */
	}
	
	onlinesocket.onmessage=onlinereceive
}

function onlinesend(){
	onlinesocket.send("${userSession.userId}")
}

function onlinereceive(e){
	let temp = e["data"]
	temp = temp.replace(/\//gi, "");
	let data = JSON.parse(temp);
		if(data["flag"]=='online'){
			console.log(data["data"])
			/* let dt = data["data"].substring(1,e["data"].length-1) */
			/* onlinelist = dt.split(", "); */
			onlinelist = data["data"]
			$(".offline").css("color","#bababa")
			
				onlinelist.forEach((v,i)=>{
					$("#"+v+'t').css("color","rgb(40,198,50)")
					$("#"+v+'b').css("color","rgb(40,198,50)")
				})
	 
			
		} else {
			let count = 0;
			let countvalue=''
			let id = '';
			let msg = data["data"][0]["chats"][0]["chatContent"]
			console.log(data)
			data["data"].forEach((v,i)=>{
				
				v["chats"].forEach((v,i)=>{
					count+=1;
				})
			}) 
			if(data["data"][0]["chatrommId1"]=='${userSession.userId}'){
				id= data["data"][0]["chatrommId2"]
			} else {
				id = data["data"][0]["chatrommId1"]
			}
			
			console.log(count)
			console.log(id)
			console.log(msg)
			if(count>1){
				countvalue= '외 '+count+'건의 메시지'
			} 
			
			$("#toastId").html(id);
			$("#toastCount").html(countvalue)
			$("#toastContent").html(msg)
			$('.toast').toast("show");
 /* 			$('.toast').toast({delay:1000,animation:true}); */ 
 
 			let sound = new Audio();
			 sound.src= "${pageContext.request.contextPath}/resources/sound/Pulse.mp3";
			 /* sound.loop(false);
			 sound.volume(1) */
			 sound.play()
			console.log("runtoast")
			/* 
			$("#toastId").html("");
			$("#toastCount").html("")
			$("#toastContent").html("") */
		}
	
}

/*
 <span id="toastId"></span>
    <span id="toastCount"></span>
  </div>
  <div class="toast-body">
    Some text inside the toast body
  </div>
*
*
*/



function online(){
/* console.log(onlinelist) */
	
	/* onlinesocket.onmessage=e=>{
		let dt = e["data"].substring(1,e["data"].length-1)
		let onlinelist = dt.split(", ");


 */
 $("#controlpanelprev").html("")
			let userId = '${userSession.userId}'
		$.ajax({
			url:"${pageContext.request.contextPath}/friend/fetchfriendlist",
			data:{'userId':userId},
			success:data=>{
					
				$("#toolinnerbox").html("")
				$("#footerinnerContainer").html("")
				
				data.forEach((v,i)=>{
					let out = $("<div>").attr({"class":"d-flex flex-row justify-content-between mt-2 border" , "onclick":"headerProfile('"+v["friendId"]["userId"]+"','"+v["friendId"]["profileImageFile"]+"','"+v["friendId"]["userNick"]+"','"+v["friendId"]["profileStatus"]+"')", "data-toggle":"modal","data-target":"#headerprofile"}).css("color","black")
					let profilebox = $("<span>").attr({"class":"ml-2 mr-2 d-flex flex-row"})
					let photo = $("<img>").attr("src","${pageContext.request.contextPath}/resources/upload/profile/"+v["friendId"]["profileImageFile"]).css({"height":"25px","width":"25px", "border-radius":"100%"})
					let	nick = $("<span>").html(v["friendId"]["userNick"]).css("color","gray")
					let statusbox = $("<i>").css({"color":"#bababa", "font-weight":"bolder","font-size":"12px"}).attr({"class":"pr-2 pt-2 fas fa-circle offline ", "id": v["friendId"]["userId"]+'t'})
						

					profilebox.append(photo).append(nick)
					out.append(profilebox).append(statusbox)
					$("#toolinnerbox").append(out);
					
					let outf = $("<div>").attr({"class":"d-flex flex-row justify-content-between mb-2 border" , "onclick":"footerProfile('"+v["friendId"]["userId"]+"','"+v["friendId"]["profileImageFile"]+"','"+v["friendId"]["userNick"]+"','"+v["friendId"]["profileStatus"]+"')"})
					let profileboxf = $("<span>").attr("class","ml-2 mr-2 d-flex flex-row")
					let photof = $("<img>").attr("src","${pageContext.request.contextPath}/resources/upload/profile/"+v["friendId"]["profileImageFile"]).css({"height":"35px","width":"35px", "border-radius":"100%"})
					let nickf = $("<span>").html(v["friendId"]["userNick"])
					let statusboxf= $("<i>").css({"color":"#bababa", "font-weight":"bolder","font-size":"12px"}).attr({"class":"pr-2 pt-2 fas fa-circle offline ", "id": v["friendId"]["userId"]+'b'})
						
					
					profileboxf.append(photof).append(nickf)
					outf.append(profileboxf).append(statusboxf)
					
					$("#footerinnerContainer").append(outf).attr("class","p-2")
					
				})
				
				
			}
			
		})
			
			
		/* } */

 }

/* ******************** 카카오 ***************** */
function kakaoLogout(){
		Kakao.init('55ed969ca9bcce24d1c9c11d44e0c525');
		
		if(!Kako.Auth.getAccessToken()){
			
			/* console.log("not logged in") */
			return
		}
		Kakao.Auth.logout(function(){
			console.log(Kakao.Auth.getAccessToken())
		})
	}

/****************************************************  */


/* **************** 햄버거 ********************************************** */
	const ham=()=>{
		
		if($(".hamdown").css("display")=='none'){
			$('.hamback').show();
			$('.hamdown').show(250);
			$('.closeham').show();
			$('body').css("overflow","hidden");
		} else if($(".hamdown").css("display")=='block'){
			$('body').css("overflow","");
			$('.hamdown').hide(250);
			$('.hamback').css("display","none")
		}
		/* $('.hamdown').animate({
			right:"0px"
		},200,function(){
			$('.hamdown').css("display","block")
		})
		$('.hamback').css("display","block")*/
		
		
		
	}
	const unham=()=>{
		$('body').css("overflow","");
		$('.hamdown').hide(250);
		$('.hamback').css("display","none")
	}
	const sumbmenucontroller=()=>{
		$("#submenu").slideToggle(240);
	}
	
	/* **************** 햄버거 끝********************************************** */
	
	
	
	/* ***********************************마이페이지패널******************************* */
	const showmypage=()=>{
		$("#controlpanel").html("")
		$("#toolbox").slideToggle(240)
		$("#toolinnerbox").html("")
		$("#menubox").html("")
		/*  프로필 / 마이페이지 / 로그아웃 / 고객센터*/
		let mypagelink = $("<div>").append($("<a>").html("마이페이지").attr({
			"href":"${pageContext.request.contextPath}/user/mypage/start?userId=${userSession.userId}", 
			"class" : "tway blackText"
		}).css("text-decoration","none"))
		let profilelink = $("<div>").html($("<a>").html("프로필").attr({"href":"${pageContext.request.contextPath}/profile/open/${userSession.userId}", "class" : "tway blackText"}).css("text-decoration","none"))
		let supportlink = $("<div>").html($("<a>").html("고객센터").attr({"href":"${pageContext.request.contextPath}/#","class" : "tway blackText"}).css("text-decoration","none"))
		let logoutlink = $("<div>").html($("<a>").html("로그아웃").attr({"href":"${pageContext.request.contextPath}/user/logout","onclick":"kakaoLogout()", "class" : "tway blackText"}).css("text-decoration","none"))
		
		$("#toolinnerbox").html($("<div>").append(mypagelink).append(profilelink).append(supportlink).append(logoutlink).attr({"class":"text-center pt-4","id":"menubox"}))
		
		
		console.log('${userSession.userRole}')
		if('${userSession.userRole}' =='admin'){
			$("#menubox").append($("<div>").html($("<a>").html("관리자").attr({"href":"${pageContext.request.contextPath}/admin/enter", "class" : "tway blackText"}).css("text-decoration","none")))
		}
		
		
		
		let mypagelinkf = $("<div>").append($("<a>").html("마이페이지").attr({"href":"${pageContext.request.contextPath}/user/mypage/start?userId=${userSession.userId}","class" : "tway blackText" }).css("text-decoration","none"))
		let profilelinkf = $("<div>").html($("<a>").html("프로필").attr({"href":"${pageContext.request.contextPath}/user/profile/start?userId=${userSession.userId}", "class" : "tway blackText"}).css("text-decoration","none"))
		let supportlinkf = $("<div>").html($("<a>").html("고객센터").attr({"href":"${pageContext.request.contextPath}/#", "class" : "tway blackText"}).css("text-decoration","none"))
		let logoutlinkf = $("<div>").html($("<a>").html("로그아웃").attr({"href":"${pageContext.request.contextPath}/user/logout","onclick":"kakaoLogout()", "class" : "tway blackText"}).css("text-decoration","none"))
		$("#footerinnerContainer").html($("<div>").append(mypagelinkf).append(profilelinkf).append(supportlinkf).append(logoutlinkf)).attr("class","text-center pt-4")
				
		/* 문제점 2 */
		
			
	}
	
	
	/***************************** 푸터 *************************** */
	const fn_showprofilebot=()=>{
		$("#controlpanelfooter").html("")
		showmypage()
		/* $("#footerContainer").css("overflow","visible") */
		
			if($("#footerContainer").css("display")=='none'){
				$("body").css("overflow","hidden")
				$("#footerContainer").show(240)
			} else {
				$("body").css("overflow","visible")
				$("#footerContainer").hide(240)
			}
	}
	
	
	
	
	
	
	
	
	/******************** 친구 목록 *****************************************************************8 */
	const fn_friendList=()=>{
		let userId = '${userSession.userId}'
		$.ajax({
			url:"${pageContext.request.contextPath}/friend/fetchfriendlist",
			data:{'userId':userId},
			success:data=>{
					
				
				
				
				data.forEach((v,i)=>{
					let out = $("<div>").attr({"class":"d-flex flex-row justify-content-between mt-2 border" , "onclick":"headerProfile('"+v["friendId"]["userId"]+"','"+v["friendId"]["profileImageFile"]+"','"+v["friendId"]["userNick"]+"','"+v["friendId"]["profileStatus"]+"')", "data-toggle":"modal","data-target":"#headerprofile"}).css("color","black")
					let profilebox = $("<span>").attr({"class":"ml-2 mr-2 d-flex flex-row"})
					let photo = $("<img>").attr("src","${pageContext.request.contextPath}/resources/upload/profile/"+v["friendId"]["profileImageFile"]).css({"height":"25px","width":"25px", "border-radius":"100%"})
					let nick = $("<span>").html(v["friendId"]["userNick"])
					let statusbox =''
					
					if(onlinelist.includes(v["friendId"]["userId"])){
						statusbox= $("<i>").css({"color":"rgb(40,198,50)", "font-weight":"bolder","font-size":"12px"}).attr("class","pr-2 pt-2 fas fa-circle")
					} else {
						statusbox= $("<i>").css({"color":"#bababa", "font-weight":"bolder","font-size":"12px"}).attr("class","pr-2 pt-2 fas fa-circle")
					}
					
					profilebox.append(photo).append(nick)
					out.append(profilebox).append(statusbox)
					$("#toolinnerbox").append(out);
					
					let outf = $("<div>").attr({"class":"d-flex flex-row justify-content-between mb-2 border" , "onclick":"footerProfile('"+v["friendId"]["userId"]+"','"+v["friendId"]["profileImageFile"]+"','"+v["friendId"]["userNick"]+"','"+v["friendId"]["profileStatus"]+"')"})
					let profileboxf = $("<span>").attr("class","ml-2 mr-2 d-flex flex-row")
					let photof = $("<img>").attr("src","${pageContext.request.contextPath}/resources/upload/profile/"+v["friendId"]["profileImageFile"]).css({"height":"35px","width":"35px", "border-radius":"100%"})
					let nickf = $("<span>").html(v["friendId"]["userNick"])
					
					let statusboxf= ''
						if(onlinelist.includes(v["friendId"]["userId"])){
							statusboxf= $("<i>").css({"color":"rgb(40,198,50)", "font-weight":"bolder","font-size":"12px"}).attr("class","pr-2 pt-2 fas fa-circle")
						} else {
							statusboxf= $("<i>").css({"color":"#bababa", "font-weight":"bolder","font-size":"12px"}).attr("class","pr-2 pt-2 fas fa-circle")
						}
					
					profileboxf.append(photof).append(nickf)
					outf.append(profileboxf).append(statusboxf)
					$("#footerinnerContainer").append(outf)
					
				})
				
				
			}
			
		})
		
		
	}
	
	/* 헤더 친구 목록  */
	function showfriendList(){
		
		$("#toolinnerbox").html("");
		$("#controlpanel").html("친구목록")
		// fn_friendList();
		online()
		$("#toolbox").toggle(240);
	}
	
	/* 푸터 친구 목록 */
	function friendListbot(){
		
		$("#controlpanelfooter").html("친구목록")
		$("#footerinnerContainer").html("")
		/* fn_friendList(); */
		online();
		if($("#footerContainer").css("display")=='none'){
			$("#footerinnerContainer").css("overflow","auto");
			$("body").css("overflow","hidden")
			$("#footerContainer").show(240)
		} else {
			$("body").css("overflow","")
			$("#footerContainer").hide(240)
		}
	}
	
	
	
	
	
	
	/***********************************************************************/
	
	
	
	
	/**************** 친구 프로필 -> 채팅/ ->인스타프로필로 *************************************/
	
	
	
	
	/* 헤더 친구 프로필 */
	function headerProfile(userId,profileImage,nickname,status){
		
		$("#headerProfileImage").attr({'src':"${pageContext.request.contextPath}/resources/upload/profile/"+profileImage,"width":"200px"})
		$("#headerProfileNickname").html(nickname)
		if(status != 'null'){
			
		$("#headerProfileStatus").html(status)
		}
		$("#headerGoprofile").attr("onclick","fn_goProfile('"+userId+"')")
		$("#headerChat").attr("onclick","fn_startChat('','${userSession.userId}','"+userId+"')")
		/* chatroom,id1, id2 */
	}
	
	/* 푸터 친구 프로필 */
	function footerProfile(userId,profileImage,nickname,status){
		$("#controlpanelfooter").html("프로필")
		$("#controlpanelprev").html($("<img>").attr({"src":"${pageContext.request.contextPath}/resources/images/user/previous.png","onclick":"online();"}).css({"width":"30px","height":"30px"}))
		
		
		$("#footerinnerContainer").html("")
		
		let phof = $("<img>").attr({'src':"${pageContext.request.contextPath}/resources/upload/profile/"+profileImage,"width":"200px"})
		let nickf = $("<div>").html(nickname).attr("class","mt-3")
		let statf=$("<div>").attr("class","mt-3")
			if(status != 'null'){
				
				statf.html(status)
			}
		
		
		let profspan = $("<span>").attr("class","ml-2 mr-2")
		let chatfspan = $("<span>").attr("class","ml-2 mr-2")
		
		let prof = $("<i>").attr({"onclick":"fn_goProfile('"+userId+"')", "class":'fa fa-th-large m-4', "aria-hidden":"true"}).css({"color":"white","font-size":"30px"})
		let chatf = $("<i>").attr({"onclick":"fn_startChat('','${userSession.userId}','"+userId+"')",'class':'fa fa-comments m-4 mb-1 ', "aria-hidden":"true"}).css({"color":"white","font-size":"30px"})
		
		let profdiv =$("<div>").html("프로필 보기").attr("class","text-center").css("color","white")
		let chatfdiv = $("<div>").html("채팅하기").attr("class","text-center").css("color","white")
		
		
		
		profspan.append(prof).append(profdiv)
		chatfspan.append(chatf).append(chatfdiv)
		
		let fprofilecontainer = $("<div>").attr("class","d-flex flex-column justify-content-center align-items-center pt-2 pb-2 mt-2 mb-3").css({"background-color":"rgb(113,120,127)","color":"white"})
		let fbox = $("<div>").attr("class","d-flex flex-row justify-content-center pt-2 pb-2").css("background-color","rgb(113,120,127)")
		fbox.append(profspan).append(chatfspan)
		fprofilecontainer.append(phof).append(nickf).append(statf)
		
		
		let resultbox = $("<div>").attr("class","d-flex flex-column justify-content-center pt-2 pb-2 mt-3 mb-2").css({"background-color":"rgb(113,120,127)","height":"600px"})
		
		
			resultbox.append(fprofilecontainer).append(fbox)
		$("#footerinnerContainer").append(resultbox)
		
	}
	
	
	/* 
	
		<div class="d-flex flex-row justify-content-center pt-2 pb-2" style="background-color: rgb(113,120,127);">
      <span class="ml-2 mr-2"  id="headerGoprofile"> 
      	<i class="fa fa-th-large m-4" aria-hidden="true" style="font-size:30px; color: white"></i>
      	<div class="text-center" style="color:white;">프로필 보기</div>
      </span>
      <span class="ml-2 mr-2" id="headerChat" >
      	<i class="fa fa-comments m-4 mb-1 " aria-hidden="true" style="font-size:30px; color: white"></i>
      	<div class="text-center" style="color:white;" >채팅하기</div>
      </span >
	  
        <!-- <button type="button" class="btn btn-primary eumbtn-1" data-dismiss="modal" id="headerGoprofile">프로필</button> -->
        <!-- <button type="button" class="btn btn-success eumbtn-2" data-dismiss="modal" id="headerChat" >채팅</button> -->
      </div>
	
	*/
	

	/***************************************************************/
	
	
	
	/* 프로필로 가기 */
	const fn_goProfile=(userId)=>{
		location.assign('${pageContext.request.contextPath}/profile/open/'+userId);
		
		
	}
	
	/* 
		채팅방을 검색해서 시퀀스를 받아서
		
		
		MAP에는 아이디를 받는  MAP이 있어야하고
		채팅방을 갖는 MAP이 있어야한다. 
		
		
		1. 시퀀스가 있으면 소켓을 열고, 
		2. 시퀀스가 없으면 채팅방을 만든다.
			2.1 시퀀스가 있으면 소켓을 연다.
			
		3. 소켓을 열면 채팅방 시퀀스랑 아이디, 상대 아이디를 보낸다. 
		  3.1 상대방 아이디가 있으면 실시간
		  		MAP에 있는 세션으로 메시지를 전달
		  			INSERT를 계속 해줘야한다. 이게 문제... 
		  3.2 상대방 아이디가 없으면 데이터 베이스로 저장한다 .
		  		없으면, controller를 불러서 데이터 베이스로 저장
		  		
	
	
	
	*/
	/* *******채팅******************************** */
	let sockect = null;
	const fn_startChat=(chatroom,id1, id2)=>{
		
		$("#headerprofile").modal("hide")
		/* console.log("start"+$(".iconboxfooter").css("display")) */
		if($(".iconboxfooter").css("display")=="none"){
			
			/* console.log("socketstart header") */
			/* 헤더 ui */
					let tar = '';
					if(id1!='${userSession.userId}'){
						tar = id1;
					} else {
						tar =id2;
					}
					
				$("#chatdraggerable").css("display","block");
				$("#headerchatidBox").html(tar)
			
		} else {
			
			/*  */
			/* footerui */
			let tar = '';
			/* console.log("socketstart header") */
			if(id1!='${userSession.userId}'){
				tar = id1;
			} else {
				tar =id2;
			}
			
			chatInterfacebottom();
		}
		
		
		/* console.log("socketstart") */
		socket = new SockJS("${pageContext.request.contextPath}/chat")
		let myId =''
		let target = '' 
			
		if(id1=='${userSession.userId}'){
			myId = id1;
			target = id2
		} else {
			myId = id2;
			target = id1
		}
	/* 	console.log(myId)
		console.log(target) */
		
		socket.onopen=function(e){
		/* console.log(myId)
		console.log(target) */
			let data = '{"room":"","my":"'+myId+'","target":"'+target+'","flag":"init","msg":""}';
			let result = JSON.parse(data)
			socket.send(data)
		/* 	console.log("open")
			console.log(socket) */
			
		}
		
		socket.onmessage=msghandle;
		
		socket.onclose=function(e){
			let data = '{"room":"","my":"'+myId+'","target":"'+target+'","flag":"fin","msg":""}';
			let result = JSON.parse(data)
			socket.send(data)
			/* console.log(socket) */
			
		}
		
		
		
	}
	
	
	function chatInterfacebottom(){
		$("body").css("overflow","hidden")
		$("#footerinnerContainer").html("")
		
		$("#controlpanelprev").html($("<img>").attr({"src":"${pageContext.request.contextPath}/resources/images/user/previous.png","onclick":"fin()"}).css({"width":"30px","height":"30px"}))
		
		let	chatRootBottom = $("<div>").attr({"id":"chatRootBottom", "class":"col-12"}).css({"height":"100%","max-height":"800px"}).css({"overflow-y":"auto"})
		
		let chatRootDockBottom = $("<div>").attr({"id":"chatRootDockBottom", "class":"col-12 border mb-3  pl-3 pr-3 d-flex justify-content-around"}).css({"position":"absolute","bottom":"0px","background-color":"white"})
		let chatinputboxBottom = $("<input>").attr({"id":"chatinputboxBottom","type":"text","placeholder":"채팅을 입력하세요","class":"col-10","onkeyup":"entertosend()"})
		let chatRoomBottomhidden1 = $("<input>").attr({"id":"chatRoomBottomhidden1", "type":"hidden"})
		let chatRoomBottomhidden2 = $("<input>").attr({"id":"chatRoomBottomhidden2", "type":"hidden"})
		let chatSendBottom = $("<input>").attr({"id":"chatSendBottom","type":"button", "class":"checkBtn","value":"전송","onclick":"sendmsg()"})
		
		/* 1방 2상대 */
		chatRootDockBottom.append(chatRoomBottomhidden1).append(chatRoomBottomhidden2).append(chatinputboxBottom).append(chatSendBottom)
		
		$("#footerinnerContainer").append(chatRootBottom).append(chatRootDockBottom).attr("class","p-0")
		/* console.log('s2') */
	}
	
	/* *******채팅 보내기******************************** */

	let nickname='';
	let photos = '';
	function msghandle(e){
		let temp = e["data"]
			temp = temp.replace(/\//gi, "");
		let data = JSON.parse(temp);
		
				
		
		if(data["flag"]=='init'){
			let target = ''
			
			
			/* console.log(data) */

			
			if(data["data"]["chatrommId1"]=='${userSession.userId}'){
		 		target = data["data"]["chatrommId2"]
		 	} else {
		 		target = data["data"]["chatrommId1"]
		 	}
			
			
			if($(".iconboxfooter").css("display")=="none"){
				
				
			/* 	console.log('헤더에 방번호???????????????????????ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ/')
				console.log(data["data"]["chatRoomSeq"]) */
				$("#chatRoomTophidden1").val(data["data"]["chatRoomSeq"])
				$("#chatRoomTophidden2").val(target)
			} else {
				/* console.log('푸터')					 */
				 $("#controlpanelfooter").html(target)
				 
				 $("#chatRoomBottomhidden1").val(data["data"]["chatRoomSeq"])
				 $("#chatRoomBottomhidden2").val(target)
				 /* roomseq , target */
			}
			 
			 
			 let chatRootBottom = $("#chatRootBottom");
			 chatRootBottom.html("")
			 let chatRoottop = $("#chatRoottop");
			 chatRoottop.html("")
			 
			/*  console.log(socket)
			 console.log("==========================")
			 console.log(data) */
			 if(data["data"]["chats"]!=null){
				 data["data"]["chats"].forEach((v,i)=>{
			 	
				 		if(v["chatSender"]["userNick"]=='${userSession.userNick}'){
				 			let cover = $("<div>").attr("class","d-flex justify-content-end align-content-center mt-1 mb-1")
				 			let outter = $("<div>").attr("class","col-6")
				 			let inner = $("<div>").attr("class","d-flex justify-content-between ")
				 			let content = $("<div>").html(v["chatContent"]).css({"word-wrap":"break-word","word-break":"normal"}).attr('class','balloonright mt-4')
				 			let timeline = $("<span>").attr("class","small").html(v["chatSendTime"].substring(10));
				 			
				 			
	
				 			if($(".iconboxfooter").css("display")=="none"){
				 						/* console.log('헤더') */
				 						chatRoottop.append(cover.append(outter.append(inner.append(content).append(timeline))))
		 					} else {
				 						/* console.log('푸터') */					
						 				chatRootBottom.append(cover.append(outter.append(inner.append(content).append(timeline))))
		 					}
				 			
				 		} else {
				 			
				 			
				 			nickname = v["chatSender"]["userNick"];
				 			photos=v["chatSender"]["profileImageFile"]
				 				
				 			let aCover = $("<div>").attr("class","d-flex mt-1 mb-1 pt-1 pb-1 justify-content-start align-content-center")
				 			let aphoto = $("<div>").html($("<img>").css({"object-fit":"cover","border-radius":"100%"}).attr({"height":"60px", "width":"60px","src":"${pageContext.request.contextPath}/resources/upload/profile/"+v["chatSender"]["profileImageFile"]}))
				 			let aoutter = $("<div>").attr("class","col-6 my-auto")
				 			let anickandtime = $("<div>").append($("<span>").html(v["chatSender"]["userNick"])).append($("<span>").attr("class","ml-2 small").css("color","gray").html(v["chatSendTime"].substring(10) ))
				 			let acontent = $("<div>").html(v["chatContent"]).css({"word-wrap":"break-word","word-break":"normal"}).attr("class","balloonleft")
				 			
				 			
					 			if($(".iconboxfooter").css("display")=="none"){
					 				/* console.log('헤더') */
						 			chatRoottop.append(aCover.append(aphoto).append(aoutter.append(anickandtime).append(acontent)))
					 			} else {
					 				/* console.log('푸터') */					
						 			chatRootBottom.append(aCover.append(aphoto).append(aoutter.append(anickandtime).append(acontent)))
					 			}
				 		}
				 		
				 		
				 	})
				
			 }
			 	
			 	if($(".iconboxfooter").css("display")=="none"){
					/* console.log('헤더') */
					$("#chatRoottop").scrollTop($("#chatRoottop")[0].scrollHeight)
				} else {
					/* console.log('푸터') */					
					$("#chatRootBottom").scrollTop($("#chatRootBottom")[0].scrollHeight)
				}

		} else if(data["flag"]=='running'){
			
			if($("#chatRoomTophidden1").val()==data["room"]||$("#chatRoomBottomhidden1").val()==data["room"]){
			
				/* console.log('들어오냐? ') */
				let chatRootBottom = $("#chatRootBottom");
				let chatRoottop = $("#chatRoottop");
				/* {room=CR_1, my=newkayak12, target=yejin1234, flag=running, msg=밥은 먹었어?, type=text} */
				if(data["my"]=='${userSession.userId}'){
					
					
		 			let cover = $("<div>").attr("class","d-flex justify-content-end align-content-center mt-1 mb-1")
		 			let outter = $("<div>").attr("class","col-6")
		 			let inner = $("<div>").attr("class","d-flex justify-content-between ")
		 			let content = $("<div>").html(data["msg"]).css({"word-wrap":"break-word","word-break":"normal"}).attr('class','balloonright mt-4')
		 			let timeline = $("<span>").attr("class","small").html(data["time"]);
		 			
		 			
			 			if($(".iconboxfooter").css("display")=="none"){
			 				/* console.log('헤더') */
				 			chatRoottop.append(cover.append(outter.append(inner.append(content).append(timeline))))
			 			} else {
			 				/* console.log('푸터') */					
				 			chatRootBottom.append(cover.append(outter.append(inner.append(content).append(timeline))))
			 			}
		 			
		 			
		 		} else {
		 			/* console.log('들어오냐? 타인') */
		 			let chatRootBottom = $("#chatRootBottom");
		 			let chatRoottop = $("#chatRoottop");
	
		 			/* console.log(nickname)
		 			console.log(photos)
		 			console.log(data)
		 			console.log(data["msg"])
		 			 */
		 			let bCover = $("<div>").attr("class","d-flex mt-1 mb-1 pt-1 pb-1 justify-content-start align-content-center")
		 			let bphoto = $("<div>").html($("<img>").css({"object-fit":"cover","border-radius":"100%"}).attr({"height":"60px", "width":"60px","src":"${pageContext.request.contextPath}/resources/upload/profile/"+photos}))
		 			let boutter = $("<div>").attr("class","col-6 my-auto")
		 			let bnickandtime = $("<div>").append($("<span>").html(nickname)).append($("<span>").attr("class","ml-2 small").css("color","gray").html(data["time"]))
		 			let bcontent = $("<div>").html(data["msg"]).css({"word-wrap":"break-word","word-break":"normal"}).attr("class","balloonleft")
		 			
		 			
			 			if($(".iconboxfooter").css("display")=="none"){
			 				/* console.log('헤더') */
			 				chatRoottop.append(bCover.append(bphoto).append(boutter.append(bnickandtime).append(bcontent)))	
			 			} else {
			 				/* console.log('푸터') */					
				 			chatRootBottom.append(bCover.append(bphoto).append(boutter.append(bnickandtime).append(bcontent)))
			 			}
		 			
		 		}
				
				
				if($(".iconboxfooter").css("display")=="none"){
					/* console.log('헤더') */
					$("#chatRoottop").scrollTop($("#chatRoottop")[0].scrollHeight)
				} else {
					/* console.log('푸터') */					
					$("#chatRootBottom").scrollTop($("#chatRootBottom")[0].scrollHeight)
				}
			
			
			}
			
		}
		
	}
	
	function entertosend(){
		if (window.event.keyCode == 13) {
			 
			sendmsg()
       }
	}
	
	
	function sendmsg(){
	let my = '${userSession.userId}'
	let flag = "running"
	let room = '';
	let target = '';
	let msg  = '';
	
		
		if($(".iconboxfooter").css("display")=="none"){
		/* 	console.log('헤더 send 방번 호!!!!!!!!!!!!!!!!')
			console.log(room) */
			room = $("#chatRoomTophidden1").val();
			target = $("#chatRoomTophidden2").val();
			msg = $("#chatinputboxTop").val()
		} else {
			/* console.log('푸터 send')					 */
			room = $("#chatRoomBottomhidden1").val();
			target = $("#chatRoomBottomhidden2").val();
			msg = $("#chatinputboxBottom").val()
		}
		
		
		
		/* console.log(msg) */
		let data = {"room":room,"my":my,"target":target,"flag":flag,"msg":msg, "type":"text"};
		let result = JSON.stringify(data);
		socket.send(result)
		/* console.log(socket) */
		
	
	

			if($(".iconboxfooter").css("display")=="none"){
				/* console.log('헤더') */
				$("#chatinputboxTop").val("")
			} else {
				/* console.log('푸터') */					
				$("#chatinputboxBottom").val("")
			}
	}
	
	function fin(){
		let room = $("#chatRoomBottomhidden1").val();
		let target = $("#chatRoomBottomhidden2").val();
		let myId= '${userSession.userId}'
		
		let data = '{"room":"","my":"'+myId+'","target":"'+target+'","flag":"fin","msg":""}';
		let result = JSON.parse(data)
		socket.send(data)
		fn_chatList();
	}
	
	/* *******채팅******************************** */
	
	
	
	
	/* 채팅 카운트 */
	const fn_chatAlarmCount=()=>{
		let userId = '${userSession.userId}'
		$.ajax({
			url:"${pageContext.request.contextPath}/fetch/chatalarm",
			data:{"userId":userId},
			success:data=>{
				/* console.log(data) */
				if(data>0){
				$("#chatCount").html(data).css("display","block")
				$("#chatCountbot").html(data).css("display","block")
					
				} else{
					$("#chatCount").css("display","none")
					$("#chatCountbot").css("display","none")
				}
				
			}
		})
		
	}
	
	
	
	
	
	
	
	
	/***********************채팅목록********************************/
	const fn_chatList=()=>{
		$("#controlpanelfooter").html("채팅 목록")
		$("#controlpanelprev").html("")
		
		let userId = '${userSession.userId}'
			/* let userNick ='${userSession.userNick}'
		
		let chatlistbox = $("<div>").attr({"class":"d-flex flex-row justify-content-around  border mt-2"}).css("height","60px")
		let profile =$("<img>").css({"color":"black","width":"50px","height":"50px","border-radius":"100%"})
		let nick = $("<span>").css({"color":"black","font-size":"16px"})
		let profilebox = $("<span>")
		let msgbox = $("<span>").attr("class","col-8 p-0")
		let msg = $("<div>").css({"color":"black","font-size":"16px"})
		let date =$("<div>").css({"color":"black","font-size":"10px"}).attr("class"," d-flex justify-content-between")
		let innerbox = $("#toolinnerbox")
		let rbox =$("<div>")
		
		let chatlistboxf = $("<div>").attr({"class":"d-flex flex-row justify-content-around  border mt-2"}).css("height","60px")
		let profilef =$("<img>").css({"color":"black","width":"50px","height":"50px","border-radius":"100%"})
		let nickf = $("<span>").css({"color":"black","font-size":"16px"})
		let profileboxf = $("<span>")
		let msgboxf = $("<span>").attr("class","col-8 p-0")
		let msgf = $("<div>").css({"color":"black","font-size":"16px"})
		let datef =$("<div>").css({"color":"black","font-size":"10px"}).attr("class"," d-flex justify-content-between")
		let innerboxf = $("#toolinnerbox")
		let rboxf =$("<div>") */
		
		$.ajax({
			url:"${pageContext.request.contextPath}/fetch/chatlist",
			data:{"userId":userId},
			success:data=>{
				/* data.forEach((v,i)=>{
					
							
							
					v["chats"].forEach((v2,i2)=>{
						if(v2["chatSender"]["userNick"]!=userNick){
							profile.attr({"src":"${pageContext.request.contextPath}/resources/upload/profile/"+v2["chatSender"]["profileImageFile"]})
							nick.html(v2["chatSender"]["userNick"])
							
							chatlistbox.append(profile)
							
							profilef.attr({"src":"${pageContext.request.contextPath}/resources/upload/profile/"+v2["chatSender"]["profileImageFile"]})
							nickf.html(v2["chatSender"]["userNick"])
							
							chatlistboxf.append(profilef)
						}
					})
					
					
					
					
							msgf.html(v["chats"][0]["chatContent"])
							datef.append(nickf).append($("<span>").append(v["chats"][0]["chatSendTime"]))
							msgboxf.append(datef).append(msgf)
					
							chatlistbox.append(msgbox)
							
							
							msg.html(v["chats"][0]["chatContent"])
							date.append(nick).append($("<span>").append(v["chats"][0]["chatSendTime"]))
							msgbox.append(date).append(msg)
							
							chatlistboxf.append(msgboxf)
							
							$("#rbox").append(chatlistbox)
							$("#rboxf").append(chatlistboxf)
							
							console.log($("#rbox").html())
							console.log($("#rboxf").html())
							$("#toolinnerbox").append(r)
							$("#footerinnerContainer").html(rtempf)
					
				})
							
						
			} */
			/* $("#toolbox").css("background-color","2AC1BC") */
			$("#toolinnerbox").html(data)
			$("#footerinnerContainer").html(data)
			}
		})
		/* toolinnerbox */
		
							
	}
	
	/* 헤더 채팅 리스트 */
	function showchatList(){
		
		
		$("#controlpanel").html("채팅목록")
		$("#toolbox").toggle(240)
		$("#toolinnerbox").html("")
		
		let room = $("#chatRoomBottomhidden1").val();
		let my = '${userSession.userId}'
		let target = $("#chatRoomBottomhidden2").val();
		let flag = "running"
		let msg = $("#chatinputboxBottom").val()
		
		
		
		fn_chatList()
	}
	
	/* 푸터 채팅 리스트 */
	function showchatListf(){
		if($("#footerContainer").css("display")=='none'){
			fn_chatList()
			$("#footerContainer").show(240)	
			$("body").css("overflow","hidden")
		} else {
			$("#footerContainer").hide(240)	
			$("body").css("overflow","")
		}
		
		/* $("#footerContainer").toggle(240)
		$("#footerinnerContainer").html("") */
	}
	
	
	
	
	
	
	
	
	/********************************************************************/
	
	
	
	
	
	
	/* ************************************알람 *********************************** */

	
	/* 알람 카운터*/
    const alarmCount=()=>{
        let SessionMyId = '${userSession.userId}';
        $.ajax({
            url:"${pageContext.request.contextPath}/alarm/count",
            data:{userId:SessionMyId},
            success:data=>{
            	
            	if(data>0){
            		$("#alarmCountbot").css("display","inline")
            		$("#alarmCountbot").html(data)
	                $("#alarmCount").html(data)
	                $("#alarmCount").css("display","inline")
                } else {
                	$("#alarmCount").css("display","none")
	                $("#alarmCount").html("")
	                $("#alarmCountbot").css("display","none")
            		$("#alarmCountbot").html("")
                }

            }
        })

    }
     
    
	
	
	
	/* 알람 내용 채우기 */
	function alarmlist(){
		let userId = '${userSession.userId}';
		$.ajax({
			url:"${pageContext.request.contextPath}/alarm/fetchAlarm",
			data:{"userId":userId},
			success:data=>{
				
					let outter =$("<div>")
					let outterf =$("<div>")
					
				if(data.length>0){
						data.forEach((v,i)=>{
							/* console.log(v) */
							if(v["alarmRead"]=='unread'){
							let friendList = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between"}).css({"background-color":"#46a4e0","opacity":"0.8","color":"#edeced" }).html($("<span>").html(v['alarmContent']).attr("onclick","fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')")).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"','e')"}));
							let friendListf = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between"}).css({"background-color":"#46a4e0","opacity":"0.8","color":"#edeced" }).html($("<span>").html(v['alarmContent']).attr("onclick","fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')")).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"','e')"}));
								outter.append(friendList);
								outterf.append(friendListf);
							}else {
								let friendList = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between"}).css({"background-color":"white","opacity":"0.8","color":"black" }).html($("<span>").html(v['alarmContent']).attr("onclick","fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')")).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"','e')"}));
								let friendListf = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between"}).css({"background-color":"white","opacity":"0.8","color":"black" }).html($("<span>").html(v['alarmContent']).attr("onclick","fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')")).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"','e')"}));
								outter.append(friendList);
								outterf.append(friendListf);
							}
						})
						/* 문제점 1 
							,"onclick":"fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')"
						*/
						
							$("#footerinnerContainer").html(outterf)
							$("#toolinnerbox").html(outter)
				} else {
					
					outter.html("내용이 없습니다.").attr("class","text-center")
					outterf.html("내용이 없습니다.").attr("class","text-center")
					$("#toolinnerbox").html(outter)
					$("#footerinnerContainer").html(outterf)
				
				}
				/* toolinnerbox */
			}
		})
	}
	/*  헤더 알람 */	
	const showalarm=()=>{
		$("#controlpanel").html("알람")
		$("#toolbox").slideToggle(240)
		alarmlist();
				
	}
	/* 푸터 알람 */
	const fn_showalarmbot=()=>{
		$("#controlpanelfooter").html("알람")
		alarmlist();
		
		$("#footerContainer").toggle(240)
		/* $("#footerContainer").css("overflow","scroll") */
			 if($("#footerContainer").css("display")=='block'){
				 $("body").css("overflow","hidden")
				 $("#footerinnerContainer").css("overflow","auto")
			} else {
				 $("body").css("overflow","visible")
				
			} 
	}
	
	
	/* ************************************************************************ */
	
	
	
	
	
	
	const fn_delAlarm=(seq, event)=>{
		/* console.log("delAlarm") */
		/* console.log(event.stopPropagation()) */
		$.ajax({
			url:"${pageContext.request.contextPath}/alarm/deleteAlarm",
			data:{"alarmSeq": seq},
			success:data=>{
				
				/* 알람 삭제 */
		/* 		console.log(data) */
			}
		})
		
		alarmlist();
		
	}
	
	const fn_read=(seq, key, ref)=>{
		let userId = '${userSession.userId}';
		
		$.ajax({
			url:"${pageContext.request.contextPath}/alarm/readAlarm",
			data:{"alarmSeq":seq},
			success:data=>{
				if(data>0){
					alarmlist();
					
					
					
						 switch (key) {
						case "friend_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage/start?userId='+userId+"&flag="+"friend"+"&tab="+"친구 신청 목록")
							break;
						case "guestbook_alarm":
							location.assign('${pageContext.request.contextPath}/profile/open/'+userId)
							break;
						case "accept_friend_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage/start?userId='+userId+"&flag="+"friend")
							break;
						case "feed_alarm":
							location.assign('${pageContext.request.contextPath}/profile/open/'+userId+'?feedSeq='+ref);
							break;
						case "feed_like_alarm":
							location.assign('${pageContext.request.contextPath}/profile/open/'+userId+'?feedSeq='+ref);
							break;
						case "calendar_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage/start?userId='+userId+"&flag="+"calendar")
							break;
						case "movie_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage/start?userId='+userId+"&flag="+"movie")
							break;
						case "support_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage/start?userId='+userId+"&flag="+"support")
							break;
						case "food_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage/start?userId='+userId+"&flag="+"food")
							break;
						default:
							break;
						
						/* console.log(key)
						console.log(seq) */
						 
						} 
				}
			}
		})
		
	}
	const closetoolbox=()=>{
		/* $("#toolbox").css("display","none") */
		$("#toolbox").hide(240);
	}
	
	
	
	
	
	
	
	
	
	
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value="<%=request.getContextPath() %>" scope="application"/>
<c:set var="session" value="${userSession }" scope="session"/>
<style>
 *{
 	    /* border: 1px black solid    */ 
 }
</style>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link href="<c:url value="${path }/resources/css/main.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!--폰트 타이틀-->
	<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
	<!--폰트 내용-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>E_um</title>

</head>
<body>
<header>
 <nav class="navbar navbar-expand-sm fixed-top bgColorMainColor whiteText navbar-light justify-content-between d-flex">
	
        <!--로고 자리-->
        <div style="font-family: 'twayair', cursive; font-weight: 900; font-size: 25px;"><a href="${pageContext.request.contextPath }/user/gotomain" style="text-decoration: none" class="navbar_brand  ml-2 whiteText">E_um</a></div>
		<%-- <div style="margin:0px;"><a href="${pagecontex.request.contextPath }/user/gotomain" class="navbar_brand ml-2 text-body"><img width="75px" height="37px" src="${ path }/resources/images/main/eum_title.png"></a></div> --%>

        <!--메뉴-->
     <div id="head_menu" class="col-6 p-0 ">
        <ul class="navbar-nav p-0 col-12 d-flex  flex-row justify-content-around">
            <li class="nav-item col-4 col-sm-4  col-md-3  p-0"><a class="nav-link text-center" href="${path }/friend/main" style="color:white !important;">친구 찾기</a></li>
            <li class="nav-item col-3  col-sm-3 col-md-3 p-0"><a class="nav-link text-center" href="${path }/group/groupMain.do" style="color:white !important;">소모임</a></li>
            <li class="nav-item dropdown col-4  col-md-3 p-0">
                <a class="nav-link dropdown-toggle col-12 text-center whiteText" href="#" id="navbardrop" data-toggle="dropdown" style="color:white !important;">플레이스</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item text-center" href="${path }/food/foodMain" style="color: #2AC1BC !important;">맛집</a>
                    <a class="dropdown-item text-center" href="${path }/movie/movieInfo" style="color: #2AC1BC !important;">영화</a>
                </div>
            </li>
        </ul>
    </div>

        <!--아이콘 메뉴-->
        <div id="icon_menu" class="iconbox">
            <ul class="navbar-nav">
            
			    <li class="nav-item col-3">
			        <i class="fas fa-bell fa-lg fa-7x" id="alarmicon" onclick ="showalarm()" style="font-size:20px;" ></i>
			    <span class="small text-center"  style="position: fixed; top: 5px; right: 170px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display:none; width: 25px; height: 25px" id="alarmCount"></span>
			    </li>
			    
			    <li class="nav-item col-3 ">
			    	<i class="fas fa-user fa-lg fa-7x" style="font-size:20px;"  onclick="showmypage()"></i>
		    	</li>
			    
			    <li class="nav-item col-3">
			    	<i class="fa fa-address-book fa-lg fa-7x" aria-hidden="true" style="font-size:20px;" onclick="showfriendList()"></i>
			    </li>
			    
			    
			    <li class="nav-item col-3">
			        <i class="fas fa-comments fa-lg fa-7x"  style="font-size:25px;" onclick="showchatList()"></i>

			        <span class="small text-center"  style="position: fixed; top: 5px; right: 10px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display:none; width: 25px; height: 25px" id="chatCount"></span>
			    </li>
		    	
			</ul>
            <div id="toolbox" class="border">
	            <div style="position: fixed; right:5px;" id="innerXbox" class="text-center d-flex justify-content-between ">
		            <div id="controlpanel"> </div>
		            <div class="pr-4" onclick="closetoolbox()">X</div>
	            </div>
	            
	            
		         <div class="mt-4 text-center" id="toolinnerbox">
		           
	            </div>
            </div>
        </div>
        
         <i class="fas fa-align-justify fa-lg" id="hamburgerbtn" onclick="ham()">
         </i>
         
    </nav>
    <div class="hamback"  onclick="unham()"></div>
    
    	<div  class="hamdown col-6">
    		<div class="mt-5 d-flex justify-content-end">
    			<i class="fas fa-times closeham" onclick="unham()"  ></i>
    		</div>
    		
    		<ul class="hamnav mt-2 mb-2 navbar-nav col-5 p-0" >
	    		<li class="nav-item"><a class="nav-link text-center" href="${path }/friend/main">친구 찾기</a></li>
	    		<li class="nav-item"><a class="nav-link text-center" href="${path }/group/groupMain.do">소모임</a></li>	
	    		<li class="nav-item"><a class="nav-link dropdown-toggle col-12 text-center" onclick="sumbmenucontroller()" href="#">플레이스</a></li>
    		</ul>
    			<div id="submenu" class="mt-1 col-5 p-0">
		    		<div class="text-center " ><a class="nav-link" href="${path }/food/foodMain">맛집</a></div>	
		    		<div class="text-center " ><a class="nav-link" href="${path }/movie/movieInfo">영화</a></div>
	    		</div>	
    		
    	</div>
    	
   
</header>
<div class="modal" id="headerprofile">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div  style="background-color: rgb(113,120,127);">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" style="background-color: rgb(113,120,127);">
        <div class="d-flex flex-column justify-content-center align-items-center">
        	
       		<img id="headerProfileImage" class="mt-3" style="width: 200px; height: 200px; border-radius: 100%;">
        	<div class="mt-5 mb-5">
        		<div id="headerProfileNickname" class="text-center mb-3 col-12" style="font-size: 20px; color: white" >
        		</div>
        		<div id="headerProfileStatus" class="text-center col-12" style="font-size: 20px; color: white">
        		</div>
        	</div>
        	
        </div>
      </div>

      <!-- Modal footer -->
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

    </div>
  </div>
</div>
<script>


$(function(){
	alarmCount()
	fn_chatAlarmCount();
    setInterval(()=>{
    	alarmCount()
    	fn_chatAlarmCount();
    },20000)
})

let onlinelist=[]

function online(){
  let onlinelist =[];
  
  
	let socket = new SockJS('${pageContext.request.contextPath}/online');
	
	
	socket.onopen=e=>{
		
		socket.send("${userSession.userId}")
	}

	
	socket.onmessage=e=>{
		let dt = e["data"].substring(1,e["data"].length-1)
		let onlinelist = dt.split(", ");




			let userId = '${userSession.userId}'
		$.ajax({
			url:"${pageContext.request.contextPath}/friend/fetchfriendlist",
			data:{'userId':userId},
			success:data=>{
					
				console.log(data)
				
				
				data.forEach((v,i)=>{
					let out = $("<div>").attr({"class":"d-flex flex-row justify-content-between mt-2 border" , "onclick":"headerProfile('"+v["friendId"]["userId"]+"','"+v["friendId"]["profileImageFile"]+"','"+v["friendId"]["userNick"]+"','"+v["friendId"]["profileStatus"]+"')", "data-toggle":"modal","data-target":"#headerprofile"}).css("color","black")
					let profilebox = $("<span>").attr({"class":"ml-2 mr-2 d-flex flex-row"})
					let photo = $("<img>").attr("src","${pageContext.request.contextPath}/resources/upload/profile/"+v["friendId"]["profileImageFile"]).css({"height":"25px","width":"25px", "border-radius":"100%"})
					let	nick = $("<span>").html(v["friendId"]["userNick"]).css("color","gray")
					
					let statusbox =''


					if(onlinelist.includes(v["friendId"]["userId"])){
						statusbox= $("<i>").css({"color":"rgb(40,198,50)", "font-weight":"bolder","font-size":"12px"}).attr("class","pr-2 pt-2 fas fa-circle")
					} else {
						statusbox= $("<i>").css({"color":"#bababa", "font-weight":"bolder","font-size":"12px"}).attr("class","pr-2 pt-2 fas fa-circle")
					}
// <i class="fas fa-circle"></i>

					// let statusbox  = $("<span>").html(v["friendId"]["profileStatus"]).css({ "text-overflow":"ellipsis","overflow":"hidden","white-space":"nowrap","border-radius":"5%"}).attr({"class":"border"})


					
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

 }

/* ******************** 카카오 ***************** */
function kakaoLogout(){
		Kakao.init('55ed969ca9bcce24d1c9c11d44e0c525');
		
		if(!Kako.Auth.getAccessToken()){
			
			console.log("not logged in")
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
		
		/*  프로필 / 마이페이지 / 로그아웃 / 고객센터*/
		
		let mypagelink = $("<div>").append($("<a>").html("마이페이지").attr({
			"href":"${pagecontext.request.contextPath}/user/mypage/start?userId=${userSession.userId}", 
			"class" : "tway blackText"
		}).css("text-decoration","none"))
		let profilelink = $("<div>").html($("<a>").html("프로필").attr({"href":"${pagecontext.request.contextPath}/profile/open/${userSession.userId}", "class" : "tway blackText"}).css("text-decoration","none"))
		
		let supportlink = $("<div>").html($("<a>").html("고객센터").attr({"href":"${pagecontext.request.contextPath}/#","class" : "tway blackText"}).css("text-decoration","none"))
		let logoutlink = $("<div>").html($("<a>").html("로그아웃").attr({"href":"${pagecontext.request.contextPath}/user/logout","onclick":"kakaoLogout()", "class" : "tway blackText"}).css("text-decoration","none"))
		$("#toolinnerbox").html($("<div>").append(mypagelink).append(profilelink).append(supportlink).append(logoutlink)).attr("class","text-center pt-4")
		
		let mypagelinkf = $("<div>").append($("<a>").html("마이페이지").attr({"href":"${pagecontext.request.contextPath}/user/mypage/start?userId=${userSession.userId}","class" : "tway blackText" }).css("text-decoration","none"))
		let profilelinkf = $("<div>").html($("<a>").html("프로필").attr({"href":"${pagecontext.request.contextPath}/user/profile/start?userId=${userSession.userId}", "class" : "tway blackText"}).css("text-decoration","none"))
		let supportlinkf = $("<div>").html($("<a>").html("고객센터").attr({"href":"${pagecontext.request.contextPath}/#", "class" : "tway blackText"}).css("text-decoration","none"))
		let logoutlinkf = $("<div>").html($("<a>").html("로그아웃").attr({"href":"${pagecontext.request.contextPath}/user/logout","onclick":"kakaoLogout()", "class" : "tway blackText"}).css("text-decoration","none"))
		$("#footerinnerContainer").html($("<div>").append(mypagelinkf).append(profilelinkf).append(supportlinkf).append(logoutlinkf)).attr("class","text-center pt-4")
				
		/* 문제점 2 */
		
			
	}
	
	
	/***************************** 푸터 *************************** */
	const fn_showprofilebot=()=>{
		$("#controlpanelfooter").html("")
		showmypage()
		/* $("#footerContainer").css("overflow","visible") */
		$("#footerContainer").toggle(240)
		
			if($("#footerContainer").css("display")=='block'){
				$("body").css("overflow","hidden")
			} else {
				$("body").css("overflow","visible")
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
		} else {
			$("body").css("overflow","")
		}
		$("#footerContainer").toggle(240)
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
		$("#headerChat").attr("onclick","fn_startChat('"+userId+"')")
		
	}
	
	function footerProfile(userId,profileImage,nickname,status){
		
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
		let chatf = $("<i>").attr({"onclick":"fn_startChatf('"+userId+"')",'class':'fa fa-comments m-4 mb-1 ', "aria-hidden":"true"}).css({"color":"white","font-size":"30px"})
		
		let profdiv =$("<div>").html("프로필 보기").attr("class","text-center").css("color","white")
		let chatfdiv = $("<div>").html("채팅하기").attr("class","text-center").css("color","white")
		
		
		
		profspan.append(prof).append(profdiv)
		chatfspan.append(chatf).append(chatfdiv)
		
		let fprofilecontainer = $("<div>").attr("class","d-flex flex-column justify-content-center align-items-center pt-2 pb-2 mt-2 mb-3").css({"background-color":"rgb(113,120,127)","color":"white"})
		let fbox = $("<div>").attr("class","d-flex flex-row justify-content-center pt-2 pb-2").css("background-color","rgb(113,120,127)")
		fbox.append(profspan).append(chatfspan)
		fprofilecontainer.append(phof).append(nickf).append(statf)
		
		
		let resultbox = $("<div>").attr("class","d-flex flex-column justify-content-center pt-2 pb-2 mt-3 mb-2").css("background-color","rgb(113,120,127)")
		
		
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
	/* 채팅 */
	let sockect = null;
	const fn_startChat=(chatroom,id1, id2)=>{
		socket = new SockJS("${pageContext.request.contextPath}/chat")
		
		
		
		socket.onopen=function(e){
			let data = '{"room":"","my":"'+id1+'","target":"'+id2+'","flag":"init","msg":""}';
			let result = JSON.parse(data)
			socket.send(data)
			console.log(e)
			
		}
		
		socket.onmessage=msghandle;
		
		
	}
	
	
	function msghandle(e){
		console.log(e)
	}
	
	
	function sendsmg(room, my, target, flag, msg){
		let data = {"room":room,"my":my,"target":target,"flag":flag,"msg":msg};
		let result = JSON.parse(data);
		socket.send(result)
	}
	
	
	/* 채팅 카운트 */
	const fn_chatAlarmCount=()=>{
		let userId = '${userSession.userId}'
		$.ajax({
			url:"${pageContext.request.contextPath}/fetch/chatalarm",
			data:{"userId":userId},
			success:data=>{
				console.log(data)
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
		fn_chatList()
	}
	
	/* 푸터 채팅 리스트 */
	function showchatListf(){
		$("#footerContainer").toggle(24)
		$("#footerinnerContainer").html("")
		fn_chatList()
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
							console.log(v)
							if(v["alarmRead"]=='unread'){
							let friendList = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between","onclick":"fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')"}).css({"background-color":"#46a4e0","opacity":"0.8","color":"#edeced" }).html($("<span>").html(v['alarmContent'])).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"')"}));
							let friendListf = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between","onclick":"fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')"}).css({"background-color":"#46a4e0","opacity":"0.8","color":"#edeced" }).html($("<span>").html(v['alarmContent'])).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"')"}));
								outter.append(friendList);
								outterf.append(friendListf);
							}else {
								let friendList = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between","onclick":"fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')"}).css({"background-color":"white","opacity":"0.8","color":"black" }).html($("<span>").html(v['alarmContent'])).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"')"}));
								let friendListf = $("<div>").attr({"class":" small pl-1 pt-2 mt-1 pb-2 d-flex justify-content-between","onclick":"fn_read('"+v["alarmSeq"] +"','"+v["alarmToggle"]["alarmKey"]+"','"+v["refSeq"]+"')"}).css({"background-color":"white","opacity":"0.8","color":"black" }).html($("<span>").html(v['alarmContent'])).append($("<span>").html("X").attr({"class":"pr-2", "onclick":"fn_delAlarm('"+v["alarmSeq"] +"')"}));
								outter.append(friendList);
								outterf.append(friendListf);
							}
						})
						/* 문제점 1 */
						
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
	
	
	
	
	
	
	const fn_delAlarm=(seq)=>{
		$.ajax({
			url:"${pageContext.request.contextPath}/alarm/deleteAlarm",
			data:{"alarmSeq": seq},
			success:data=>{
				
				/* 알람 삭제 */
				console.log(data)
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
							location.assign('${pageContext.request.contextPath}/user/mypage?userId='+userId+"&flag="+"requestfriend")
							break;
						case "guestbook_alarm":
							location.assign('${pageContext.request.contextPath}/profile/open/'+userId)
							break;
						case "accept_friend_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage?userId='+userId+"&flag="+"friend")
							break;
						case "feed_alarm":
							location.assign('${pageContext.request.contextPath}/profile/open/'+userId+'?feedSeq='+ref);
							break;
						case "feed_like_alarm":
							location.assign('${pageContext.request.contextPath}/profile/open/'+userId+'?feedSeq='+ref);
							break;
						case "calendar_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage?userId='+userId+"&flag="+"calendar")
							break;
						case "movie_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage?userId='+userId+"&flag="+"movie")
							break;
						case "support_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage?userId='+userId+"&flag="+"support")
							break;
						case "food_alarm":
							location.assign('${pageContext.request.contextPath}/user/mypage?userId='+userId+"&flag="+"food")
							break;
						default:
							break;
						
						console.log(key)
						console.log(seq)
						
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






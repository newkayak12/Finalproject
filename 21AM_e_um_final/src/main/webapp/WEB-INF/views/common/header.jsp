<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value="<%=request.getContextPath() %>" scope="application"/>
<c:set var="session" value="${userSession }" scope="session"/>
<style>
 *{
 	 /* border: 1px black solid  */
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


	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>E_um</title>

</head>
<body>
<header>
 <nav class="navbar navbar-expand-sm fixed-top navbar-light bg-light justify-content-between d-flex">
	
        <!--로고 자리-->
        <!-- <div style="font-family: 'Arizonia', cursive; font-weight: bold;"><a href="#" class="navbar_brand ml-2 text-body">E_UM</a></div> -->
		<div style="margin:0px;"><a href="${path }/user/gotomain" class="navbar_brand ml-2 text-body"><img width="75px" height="37px" src="${ path }/resources/images/main/eum_title.png"></a></div>

        <!--메뉴-->
     <div id="head_menu" class="col-6 p-0">
        <ul class="navbar-nav p-0 col-12 d-flex flex-row justify-content-around">
            <li class="nav-item col-4 col-sm-4  col-md-3  p-0"><a class="nav-link text-center" href="${path }/friend/main">친구 찾기</a></li>
            <li class="nav-item col-3  col-sm-3 col-md-3 p-0"><a class="nav-link text-center" href="${path }/group/groupMain.do">소모임</a></li>
            <li class="nav-item dropdown col-4  col-md-3 p-0">
                <a class="nav-link dropdown-toggle col-12 text-center" href="#" id="navbardrop" data-toggle="dropdown">플레이스</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item text-center" href="${path }/food/foodMain">맛집</a>
                    <a class="dropdown-item text-center" href="${path }/movie/movieInfo">영화</a>
                </div>
            </li>
        </ul>
    </div>

        <!--아이콘 메뉴-->
        <div id="icon_menu" class="iconbox">
            <ul class="navbar-nav">
			    <li class="nav-item col-4 "><i class="fas fa-user fa-lg fa-7x" style="font-size:38px;"></i></li>
			    <li class="nav-item col-4">
			        <i class="fas fa-comments fa-lg fa-7x"  style="font-size:38px;"></i>
			        <span class="small" style="position: relative; top: -35px; right: -10px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display: none;" id="chatCount"></span>
			    </li>
			    <li class="nav-item col-4">
			        <i class="fas fa-bell fa-lg fa-7x" id="alarmicon" onclick ="showalarm()" style="font-size:38px;" ></i>
			    <p class="small text-center"  style="position: fixed; top: 5px; right: 20px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display:none; width: 25px; height: 25px" id="alarmCount"></p>
			    </li>
			</ul>
            <div id="toolbox" class="border">
	            <div style="position: fixed; right:5px;" id="innerXbox" class="text-center d-flex justify-content-between">
		            <div id="controlpanel"> 알림 </div>
		            <div class="pr-4" onclick="closetoolbox()">X</div>
	            </div>
	            
	            
		         <div class="mt-4" id="toolinnerbox">
		           
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
<script>
	const ham=()=>{
		$('body').css("overflow","hidden");
		/* $('.hamdown').animate({
			right:"0px"
		},200,function(){
			$('.hamdown').css("display","block")
		})
		$('.hamback').css("display","block")*/
		$('.hamback').show();
		$('.hamdown').show(250);
		$('.closeham').show();
		
		
	}
	const unham=()=>{
		$('body').css("overflow","");
		$('.hamdown').hide(250);
		$('.hamback').css("display","none")
	}
	const sumbmenucontroller=()=>{
		$("#submenu").slideToggle(240);
	}
	

	$(function(){
        setInterval(()=>{
        	alarmCount()
        },2000)
    })
	
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
	const showalarm=()=>{
/* 		$("#toolbox").css("display","block") */
		$("#toolbox").slideToggle(240)
		alarmlist();
				
	}
	const closetoolbox=()=>{
		/* $("#toolbox").css("display","none") */
		$("#toolbox").hide(240);
	}
	
	/* 알람 내용 채우기 */
	function alarmlist(){
		let userId = '${userSession.userId}';
		console.log(userId)
		$.ajax({
			url:"${pageContext.request.contextPath}/alarm/fetchAlarm",
			data:{"userId":userId},
			success:data=>{
				console.log(data)
					let outter =$("<div>")
				data.forEach((v,i)=>{
					
					
					
					if(v["alarmRead"]=='unread'){
					let friendList = $("<div>").attr({"class":"small"}).css({"background-color":"#46a4e0","opacity":"0.8","color":"#edeced" }).html(v['alarmContent']);
					outter.append(friendList);
						
						
					}/*  else if() */
					
					
				})
				
				
					$("#toolinnerbox").html(outter)
				
				/* toolinnerbox */
			}
		})
	}
	
</script>






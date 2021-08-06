<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="${pageContext.request.contextPath}/resources/css/hyelin.css" rel="stylesheet">
    
    
<section class="my-5 py-5">
	<div id="root" class="container my-5">
		<div class="d-flex justify-content-center mt-3 mb-5">
	        <span style="font-family: twayair;"><h1>MY PAGE</h1></span>
	    </div>
	    
	    <div class="d-flex flex-wrap justify-content-center mt-5">
	        <div class="col-3 my-3 mx-1 mx-md-3 px-0 d-flex justify-content-center" onclick="fn_openMPModal('info','none');">
	            <div class="mpBox col-lg-9 col py-3 px-0 d-flex flex-column align-items-center">
	                <i class="fas fa-user-edit iSize"></i>
	                <div class="mt-3"><h6>INFO</h6></div>
	            </div>
	        </div>
	        <div class="col-3 my-3 mx-1 mx-md-3 px-0 d-flex justify-content-center" onclick="fn_openMPModal('friend','none');">
	            <div class="mpBox col-lg-9 col py-3 px-0 d-flex flex-column align-items-center">
	                <i class="fas fa-users iSize"></i>
	                <div class="mt-3"><h6>FRIEND</h6></div>
	            </div>
	        </div>
	        <div class="col-3 my-3 mx-1 mx-md-3 px-0 d-flex justify-content-center" onclick="fn_openMPModal('movie','none');">
	            <div class="mpBox col-lg-9 col py-3 px-0 d-flex flex-column align-items-center">
	                <i class="fas fa-film iSize"></i>
	                <div class="mt-3"><h6>MOVIE</h6></div>
	            </div>
	        </div>
	        <div class="col-3 my-3 mx-1 mx-md-3 px-0 d-flex justify-content-center" onclick="fn_openMPModal('food','none');">
	            <div class="mpBox col-lg-9 col py-3 px-0 d-flex flex-column align-items-center">
	                <i class="fas fa-utensils iSize"></i>
	                <div class="mt-3"><h6>RESTAURANT</h6></div>
	            </div>
	        </div>
	        <div class="col-3 my-3 mx-1 mx-md-3 px-0 d-flex justify-content-center" onclick="fn_openMPModal('calendar','none');">
	            <div class="mpBox col-lg-9 col py-3 px-0 d-flex flex-column align-items-center">
	                <i class="far fa-calendar-check iSize"></i>
	                <div class="mt-3"><h6>CALENDAR</h6></div>
	            </div>
	        </div>
	        <div class="col-3 my-3 mx-1 mx-md-3 px-0 d-flex justify-content-center" onclick="fn_openMPModal('support','none');">
	            <div class="mpBox col-lg-9 col py-3 px-0 d-flex flex-column align-items-center">
	                <i class="fas fa-paper-plane iSize"></i>
	                <div class="mt-3"><h6>SUPPORT</h6></div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 마이페이지 모달 -->
	<div class="modal" id="myPageModal">
	  <div class="modal-dialog modal-xl">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title pointFont mainColor"></h4>
	        <button type="button" class="close mainColor" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" style="font-family:Noto Sans KR">
	        
	      </div>
	    </div>
	  </div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(function(){
		let flag ='${flag}';
		let tab='${tab}';
		
		if(flag!='none'){
			fn_openMPModal(flag,tab);
		}
	})
	
	function fn_openMPModal(flag,tab){
		let modalName="";
		let modalTitle="";
//		console.log(flag);
		
		switch(flag){
			case "info": modalName="infoModal"; modalTitle="회원정보 수정"; break;
			case "friend": modalName="friendModal"; modalTitle="내 친구 관리"; break;
			case "movie": modalName="movieModal"; modalTitle="영화 예매 정보"; break;
			case "food": modalName="foodModal"; modalTitle="내 맛집 관리"; break;
			case "calendar": modalName="calendarModal"; modalTitle="내 일정 관리"; break;
			case "support": modalName="supportModal"; modalTitle="내 문의사항"; break;
		}
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/mypage/openModal",
			data:{"modalName":modalName},
			success:data=>{
				$("#myPageModal .modal-title").html(modalTitle);
				$("#myPageModal .modal-body").html(data);
				$("#myPageModal .modal-body ul a").each((i,data)=>{
					if(data.innerText==tab) {
						$(data).trigger("click");
					}
				});
				$("#myPageModal").modal("show");
			}
		})
	}
	
	const fn_checkNick=()=>{
		if(fn_validateNick($("#newNick").val())){
			$.ajax({
			    url:"${pageContext.request.contextPath}/user/nickCheker",
			    data:{userNick:$("#newNick").val()},
			    success:data=>{
			        if(data!=0){
		                $("#NickSign>small").html("이미 존재하는 닉네임입니다.").css("color","red");
		                $("#NickChangeBtn").attr("disabled", true);
		            } else {
		                $("#NickSign>small").html("사용 가능한 닉네임입니다.").css("color","darkgreen");
		                $("#NickChangeBtn").attr("disabled", false);
		            }
			    }
			})
		}
	}
	
	const fn_pw_normaliztion=()=>{
        if(fn_passwordValidate($("#newpw").val())){
            $("#newpwSign>small").html("사용 가능한 비밀번호입니다.").css("color","darkgreen")
            $("#pwChangeBtn").attr("disabled", false);
        }
    }
	
	const fn_pwCheck=()=>{
        if($("#newpw").val()==$("#pwck").val()){
			$("#pwckSign>small").html("비밀번호가 일치합니다.").css("color","darkgreen")
			$("#pwChangeBtn").attr("disabled", false);
        } else {
	        $("#pwckSign>small").html("비밀번호가 불일치합니다.").css("color","red")
	        $("#pwChangeBtn").attr("disabled", true);
        }
    }
	
	const fn_address_enroll_validate=()=>{
    	if($("#sample6_postcode").val().length==0||$("sample6_address").val().length==0){
    		alert("필수 입력 사항입니다.");
    		$("#sample6_postcode").focus();
    		return false;
    	}
    }
	
	
</script>
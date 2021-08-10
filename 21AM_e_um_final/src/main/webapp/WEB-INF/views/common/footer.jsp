<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

		<div id="footerContainer" style="">
			<div class="d-flex justify-content-between align-itmes-center border col-12" style="height: 40px!important;" id="panel">
				<span id="controlpanelprev" class="d-flex justify-content-center align-itmes-center"></span>
				<span id="controlpanelfooter" class="d-flex flex-column justify-content-center align-itmes-center"></span>
				<span id="controlpanelnext"></span>
			</div>
			<div id="footerinnerContainer" style="height: 100%" class="mb-5 p-0" >
				
			</div>
				
		</div>
<footer class="footer mt-5 pt-0 dockbar">
		
	 <div id="icon_menu" class="iconboxfooter  mt-2 mb-2  col-12 " style="height:fit-content;"> 
          <ul class="navbar-nav d-flex flex-row  justify-content-between pr-4 pl-4 col-12">  
          
                <li class="nav-item" >
                	<i class="fas fa-bell fa-lg  p-2 fa-7x" style="font-size:30px" onclick="fn_showalarmbot(); "></i>
               		<!-- <span  class="p-2" id="alarmCountbot" style="font-size:16px; position:relative; bottom:30px; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white;  width: 50px !important;  z-index: 200"></span> -->
               		<span class="small text-center"  style=" position:fixed; left:70px; bottom: 30px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display:none; width: 30px; height: 30px; font-size:18px" id="alarmCountbot"></span>
                </li>
                
                
                
                <li class="border mt-2 mb-2"></li>
				<li class="nav-item">            
                	<i class="fas fa-user fa-lg  p-2 fa-7x" style="font-size:30px" onclick="fn_showprofilebot()"></i>
                </li >
                <li class="border mt-2 mb-2"></li>
                
                <li class="nav-item">
                	<i class="fas fa-address-book fa-lg fa-7x mt-2" style="font-size:30px;" onclick="friendListbot()"></i>
                </li>
                
                <li class="border mt-2 mb-2"></li>
                
                <li class="nav-item">
                	<i class="fas fa-comments fa-lg p-2 fa-7x " style="font-size:30px" onclick = "showchatListf()"></i>
                	<span class="small" style="width: 30px; height: 30px; font-size:18px; position:fixed;  right:30px; bottom: 30px; z-index: 200; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display: none;" id="chatCountbot">12</span>
                </li>
                <!--span알림  -->
          </ul>
     </div> 
     
	
		<a id="MOVE_TOP_BTN" href="#" style="position: fixed; right:50px; bottom:110px; border-radius: 100%; display: none;" class="gototop p-2"><i class="fas fa-arrow-up" style="color: white; font-size:32px;"></i></a>
	

	<div class="footerInfo">
	    <ul class="list-inline pt-3">
	        <li class="list-inline-item"><a href="${pageContext.request.contextPath }/">메인</a></li>
	        <li class="list-inline-item border" style="height: 15px"></li>
	        <li class="list-inline-item"><a href="${pageContext.request.contextPath }/faq/open">고객센터</a></li>
	        <li class="list-inline-item border" style="height: 15px"></li>
	        <li class="list-inline-item"><a href="#">개인정보 보호 정책 및 약관</a></li>
	       <!--  <li class="list-inline-item"><a href="#">Terms</a></li>
	        <li class="list-inline-item"><a href="#">Privacy Policy</a></li> -->
	    </ul>
	     <p class="copyright m-1">
	            (주)이음 | 주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 |이메일 : eum@eum.com <br>
	            
	        </p>
	        <p class="copyright m-1">팀장 : 김상현 | 팀원 : 김예진 김태희 이우식 장혜린</p>
	        <p class="copyright m-1">Copyright ©2021 E_um Co.Ltd.All rights reserved</p>
    </div>
    
</footer>
<script type="text/javascript">
$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 1000) {
			$('#MOVE_TOP_BTN').fadeIn();
		} else {
			$('#MOVE_TOP_BTN').fadeOut();
		}
	});
	$("#MOVE_TOP_BTN").click(function() {
		$('html, body').animate({
			scrollTop : 0
			}, 400);
		return false;
	});
	
	
});

function response(){
	if($("#iconboxfooter").css('display')!='none'){
		$("section").css('margin-bottom',"40px")
	}else {
		$("section").css('margin-bottom',"0px")
	}
}


</script>


</body>
</html>
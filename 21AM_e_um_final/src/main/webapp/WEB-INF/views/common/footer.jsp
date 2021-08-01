<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

		<div id="footerContainer" style="">
			<div class="d-flex justify-content-between  border col-12">
				<span id="controlpanelprev"></span>
				<span id="controlpanelfooter"></span>
				<span id="controlpanelnext"></span>
			</div>
			<div id="footerinnerContainer" style="height:570px !important" class="mb-5 p-0" >
				
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
     


	<div class="footerInfo">
	    <ul class="list-inline pt-3">
	        <li class="list-inline-item"><a href="#">Home</a></li>
	        <li class="list-inline-item"><a href="#">Services</a></li>
	        <li class="list-inline-item"><a href="#">About</a></li>
	        <li class="list-inline-item"><a href="#">Terms</a></li>
	        <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
	    </ul>
	    <p class="copyright">E_um | address : 서울특별시 역상동 테헤란로  | email : eum@eum.com</p> 
	    <p class="copyright">SanghyunKim YejinKim TaehuiKim WoosikLee HyerinJang</p>
	    <p class="copyright">Copyright ©2021 E_um Co.Ltd.All rights reserved</p>
    </div>
    
</footer>



</body>
</html>
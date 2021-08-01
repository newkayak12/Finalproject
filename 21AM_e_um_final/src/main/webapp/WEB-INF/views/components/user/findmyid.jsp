    <%@ page language="java" contentType="text/html; charset=UTF-8"%>
    
   <div style="min-height:300px">
	    <div class="mb-3">
	       		<img src="${pageContext.request.contextPath}/resources/images/user/previous.png" alt="뒤로가기" onclick="fn_lostAndFound()" width="20px" class="m-1">
	      	</div>
	    <div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
	        <span class="m-2 d-flex justify-content-center align-items-center p-3 w-fitcontent">
	            <span class="w-25 pointFont">Name</span>
	            &nbsp;&nbsp;
	            <input type="text" id="userName" class="w-20">
	            &nbsp;&nbsp;
	          
	        </span>	
	        <span class="m-2 d-flex justify-content-center align-content-center p-3 w-fitcontent">
	            <span class="w-10 pointFont">EMail</span>
	            &nbsp;&nbsp; 
	            <input type="email" id="userEmail" class="w-20 ">
	             
	            
	        </span>
	        <span class="m-2 d-flex justify-content-center align-content-center p-3 w-fitcontent">
	           
	            <input type="button" id="findid" class="w-20 checkBtn " value="아이디 찾기" onclick="findmyidpwmiddle()">
	            &nbsp;&nbsp; 
	        </span>
	        <input type="hidden" id="findmyflag" value="${flag}">
	    </div>
    </div>


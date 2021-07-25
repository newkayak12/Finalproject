<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
    <span class="m-2 d-flex justify-content-center align-items-center p-3 w-fitcontent">
        <span class="w-10">ID</span>
        &nbsp;&nbsp;
        <input type="text" id="userId" class="w-50" style="height:30px" placeholder="아이디">
        &nbsp;&nbsp;
        <input type="checkbox" class="w-10" id="persistlogin" >
        &nbsp;&nbsp; 
        <span class="w-10">아이디 저장</span>
    </span>	
    <span class="m-2 d-flex justify-content-center align-content-center p-3 w-fitcontent">
        <span class="w-10">PW</span>
        &nbsp;&nbsp; 
        <input type="password" id="userPassword" class="w-75 " style="height:30px" placeholder="비밀번호">
         
        &nbsp;&nbsp; 
        <input type="button" onclick="loginVerifyAjax()" class=" eumbtn-2 btn " value="로그인">
    </span>
    <span class="m-2 d-flex justify-content-center align-content-center p-3 w-fitcontent">
        &nbsp;&nbsp; 
        <input type="button" id="kakao" class="w-20 " value="카카오 로그인">
        &nbsp;&nbsp; 
        &nbsp;&nbsp; 
        <input type="button" id="naver" class="w-20 " value="네이버 로그인">
        &nbsp;&nbsp; 
       
        
    </span>
    <span class="d-flex flex-row w-50 justify-content-around align-content-center">
        <span onclick="fn_lostAndFound()">
               아이디/비밀번호
        </span>
        
    </span>
</div>

<script>
$(function(){
    let cookie = '${persistLogin}'
    if(cookie!='none'&&cookie!=''){
        $("#persistlogin").attr("checked",true)
        $("#userId").val(cookie);
    }

})
</script>
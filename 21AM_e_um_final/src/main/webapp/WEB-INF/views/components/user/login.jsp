<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
    <span class="m-2 d-flex justify-content-center align-items-center p-3 w-fitcontent">
        <span class="w-10">ID</span>
        &nbsp;&nbsp;
        <input type="text" id="userId" class="w-20">
        &nbsp;&nbsp;
        <input type="checkbox" class="w-10">
        &nbsp;&nbsp; 
        <span class="w-10">아이디</span>
    </span>	
    <span class="m-2 d-flex justify-content-center align-content-center p-3 w-fitcontent">
        <span class="w-10">PW</span>
        &nbsp;&nbsp; 
        <input type="password" id="userPassword" class="w-20 ">
        &nbsp;&nbsp; 
        &nbsp;&nbsp; 
        &nbsp;&nbsp; 
        &nbsp;&nbsp; 
        <input type="button" onclick="" value="로그인" class="w-10">
    </span>
    <span class="d-flex flex-row w-50 justify-content-around align-content-center">
        <span onclick="fn_lostAndFound()">
               아이디/비밀번호
        </span>
        
    </span>
</div>
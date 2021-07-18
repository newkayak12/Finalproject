<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 	<div style="min-height:300px">
       	<div class="mb-3">
       		<img src="#.jpg" alt="뒤로가기" onclick="fn_login()">
       	</div>
        <div class="d-flex justify-content-around flex-row align-items-center" id="lostandfoundContainer" style="min-height:200px">
            <span class="lostbox border  text-center justify-content-center  align-content-center d-flex flex-column h-100 col-5 mr-1 ml-1" style="min-height:200" onclick="findmyid()" >
                아이디 찾기
            </span>
            <span class=" lostbox border  text-center justify-content-center align-content-center  d-flex flex-column h-75 col-5 mr-1 ml-1" style="min-height:200" onclick="findmypw()">
                비밀번호 찾기
            </span>
        </div>        
   </div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

   
<div class="pt-5">
	<div class="d-flex justify-content-around p-3">
		<span class="col-3 text-center align-self-center border adminMenu" onclick="manageUser(1)">회원 관리</span>
		<span class="col-3 text-center border adminMenu" onclick="manageGroup()">소모임 관리</span>
		<span class="col-3 text-center border adminMenu" onclick="manageService()">고객센터 관리</span>
	</div>
	<div class="d-flex justify-content-around p-3">
		<span class="col-3 text-center border adminMenu" onclick="manageMovie()">영화 관리</span>
		<span class="col-3 text-center border adminMenu" onclick="manageFood()" >맛집 관리</span>
		<span class="col-3 text-center border adminMenu" onclick="manageReport()">신고 관리</span>
	</div>
</div>
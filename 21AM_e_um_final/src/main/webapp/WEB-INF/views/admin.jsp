<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	/* *{border:1px black solid} */
</style>
<section class="mt-5 pt-5">   
	<div class="d-flex justify-content-around pl-5 pr-5">
		<span id="prev" class="col-1 pt-1 text-center" style="visibility:hidden">
			<img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="25px" height="25px">
		</span>
		<span id="title" class="col-8 text-center tway" style="font-size:20px;" >
			타이틀
		</span>
		<span class="col-1"></span>
	</div>
   	<div id="root" class="container md-mt-5 mt-0 ">




	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(function(){
		managerMain();
	})
	
	function managerMain(){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/menu",
			success: data=>{
				$("#title").html("관리자 메뉴")
				$("#root").html(data)
			}
		})
	}
	
	function manageUser(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/manageuser',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible");
				$("#title").html("회원 관리")
				$("#root").html(list)
			}
			
		})
		
	}
	function managerGroup(){
		
	}
	function managerService(){
		
	}
	
	function managerMovie(){
		
	}
	function managerFood(){
		
	}
	function managerReport(){
		
	}
	
	
</script>
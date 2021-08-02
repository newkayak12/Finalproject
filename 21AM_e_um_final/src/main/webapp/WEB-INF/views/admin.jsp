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
	<div class="d-flex justify-content-around pl-5 pr-5 mb-3">
		<span  class="col-1 pt-1 text-center" >
			<img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="25px" height="25px" onclick="managerMain()" id="prev" style="visibility:hidden">
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
				$("#prev").css("visibility","hidden")
				$("#root").html(data)
			}
		})
	}
	
	function manageUser(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/manageuser',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("회원 관리")
				$("#root").html(list)
			}
			
		})
		
	}
	function manageGroup(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managegroup',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("그룹 관리")
				$("#root").html(list)
			}
		})
		
	}
	function manageService(){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/manageservice',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("회원 관리")
				$("#root").html(list)
			}
		})
	
	}
	
	function manageMovie(){
		
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managemovie',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("회원 관리")
				$("#root").html(list)
			}
		})
		
	}
		
	function manageFood(){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managefood',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("회원 관리")
				$("#root").html(list)
			}
		})
		
	}
	function manageReport(){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managereport',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("회원 관리")
				$("#root").html(list)
			}
		})
		
	}
	
	
</script>
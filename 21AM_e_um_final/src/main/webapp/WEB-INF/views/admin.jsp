<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	/* *{border:1px black solid} */
	#adminMenus * {
		cursor: pointer;
	}
</style>
<section class="mt-5 ">  
 
	<div class="d-flex justify-content-around pl-5 pr-5  blackText">
		<%-- <span  class="col-1 pt-1 text-center" >
			<img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="25px" height="25px" onclick="managerMain()" id="prev" style="visibility:hidden">
		</span> --%>
		<span id="title" class="col-8 text-center tway mt-4" style="font-size:20px;" >
			타이틀
		</span>
		<!-- <span class="col-1"></span> -->
	</div>
	
	<div class="d-flex flex-row">
		<div id="adminMenus" class=" blackText   mr-2 d-flex flex-column p-1" style="width: 150px">
			<span class="text-center cursor pointFont" style=" font-size:20px" onclick ="manageUser()">회원관리</span>
			<span class="text-center cursor pointFont" style=" font-size:20px" onclick ="groupsub()">소모임관리</span>
			<span id="groupsub" class="text-center cursor " style="display:none;">
				<div class="text-center cursor pointFont" style="font-size:16px; color:#2AC1BC;" onclick ="manageGroup()"> 소모임 조회 </div>
				<div class="text-center cursor pointFont" style="font-size:16px; color:2AC1BC;"> 소모임 승인 </div>			
						
			</span>
			<span class="text-center cursor pointFont" style="font-size:20px" onclick ="moviesub()">영화관리</span>
			<span id="moviesub" class="text-center cursor " style="display:none;">
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick="manageMovie();"> 영화 조회 </div>
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick="enrollMovie();"> 영화 등록 </div>						
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick="managePerson();"> 인물 조회 </div>
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick="registPerson();"> 인물 등록 </div>					
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick="showTicketingList()"> 예매 조회 </div>
			</span>
			<span class="text-center cursor pointFont" style="font-size:20px" onclick="foodSub()">맛집관리</span>
			<span id="foodsub" class="text-center cursor " style="display:none;">
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px"  onclick ="manageFood()">조회 및 정보수정</div>
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="writeFood()"> 맛집 등록 </div>
			</span>
			<span class="text-center cursor pointFont" style="font-size:20px" onclick="serviceSub()">고객센터관리</span>
				<span id="serviceSub" class="text-center cursor " style="display:none;">
					<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="manageFAQ(1);"> FAQ 조회 </div>
					<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="writeFAQ();"> FAQ 등록 </div>
					<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="manageQNA(1)"> 문의사항 답변 </div>
				</span>
			<span class="text-center cursor pointFont" style="font-size:20px" onclick="reportsub()">신고관리</span>
			<span id="reportsub" class="text-center cursor " style="display:none;">
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="manageReport()"> 피드 </div>
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="manageFeedComment()"> 피드 댓글 </div>			
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px"> 영화 리뷰</div>			
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="manageFoodReview()"> 맛집 리뷰 </div>
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick ="manageGroupBoard()"> 소모임 게시글 </div>			
				<div class="text-center cursor pointFont" style="color:2AC1BC; font-size:16px" onclick="manageGroupBoardComment()"> 소모임 댓글</div>			
			</span>
			
		</div>
	
	   	<div id="root" class="container md-mt-5 mt-3 p-3" style="height: 800px">
	
	
	
	
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(function(){
		manageUser();
	})
	
	/* function managerMain(){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/menu",
			success: data=>{
				$("#title").html("관리자 메뉴")
				$("#prev").css("visibility","hidden")
				$("#root").html(data)
			}
		})
	} */
	
	function manageUser(cPage){
		$.ajax({
			url:'${ pageContext.request.contextPath }/admin/manageuser',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("회원 관리")
				$("#root").html(list)
				$("#moviesub").hide(240)
				$("#groupsub").hide(240)
				$("#foodsub").hide(240)
				$("#serviceSub").hide(240)
				$("#reportsub").hide(240)
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
	
	/* 소모임 승인 자리 > groupApprove */
	
	function manageFood(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managefood',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("음식점 조회")
				$("#root").html(list)
			}
		})
		
	}
	
	function writeFood(){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/writefood',
			
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("음식점 입력")
				$("#root").html(list)
			}
		})
	}
	
	/* 음식 수정 자리 amendFood  */
	
	function manageFAQ(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/manageFAQ',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("FAQ 조회")
				$("#root").html(list)
			}
		})
	}
	
	function writeFAQ(){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/writeFAQ/start',
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("FAQ 등록")
				$("#root").html(list)
			}
		})
	}
	
	function manageQNA(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/manageQNA',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("QNA 조회")
				$("#root").html(list)
			}
		})
	}
	
	
	/* 피드 */
	function manageReport(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managefeed',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("피드 관리")
				$("#root").html(list)
			}
		})
		
	}
	
	/*  피드 댓글  manageFeedComment */
	function manageFeedComment(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managefeedComment',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("피드 댓글 관리")
				$("#root").html(list)
			}
		})
		
		
	}
	
	/*  영화 리뷰  manageMovie */
	/*  맛집 리뷰  manageFood */
	function manageFoodReview(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managefoodreview',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("맛집 리뷰 관리")
				$("#root").html(list)
			}
		})
	}
	
	
	/*  소모임 게시글  manageGroupBoard */
	function manageGroupBoard(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managegroupboard',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("소모임 게시글 관리")
				$("#root").html(list)
			}
		})
	}
	
	/*  소모임 댓글  manageGroupBoardComment */
	function manageGroupBoardComment(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managegroupboardcomment',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("소모임 댓 관리")
				$("#root").html(list)
			}
		})
	}
	
	
	/* 영화 조회  */
	function manageMovie(cPage){
		
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/managemovie',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("영화 관리")
				$("#root").html(list)
			}
		})
		
	}
	
	/* 영화 등록 enrollMovie  */
	function enrollMovie(){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/enrollMovie',
			success:data=>{
				$("#prev").css("visibility","visible")
				$("#title").html("영화 등록")
				$("#root").html(data)
			}
		})
	}
	
	
	/* 인물 조회 managePerson */
	function managePerson(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/movie/managePerson',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("영화인물 조회")
				$("#root").html(list)
			}
		})
	}
	
	/* 인물 등록 registPerson */
	function registPerson(){
		$.ajax({
			url:'${pageContext.request.contextPath}/movie/enrollPerson',
			success:data=>{
				$("#prev").css("visibility","visible")
				$("#title").html("영화인물 등록")
				$("#root").html(data)
			}
		})
		
	}
	
	
	/* 예매 조회 ShowTicketingList */
	function showTicketingList(cPage){
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/ShowTicketingList',
			data:{"cPage":cPage},
			success:list=>{
				$("#prev").css("visibility","visible")
				$("#title").html("예매 조회")
				$("#root").html(list)
			}
				
		})
	}
	
	
	
	
	
	
	
	
	
	
	
	function foodSub(){
		$("#foodsub").slideToggle(240)
		$("#moviesub").hide(240)
		$("#groupsub").hide(240)
		$("#serviceSub").hide(240)
		$("#reportsub").hide(240)
	} 
	function moviesub(){
		$("#moviesub").slideToggle(240)
		$("#foodsub").hide(240)
		$("#groupsub").hide(240)
		$("#serviceSub").hide(240)
		$("#reportsub").hide(240)
	}
	function groupsub(){
		$("#groupsub").slideToggle(240)
		$("#moviesub").hide(240)
		$("#foodsub").hide(240)
		$("#serviceSub").hide(240)
		$("#reportsub").hide(240)
	}
	function serviceSub(){
		$("#serviceSub").slideToggle(240)
		$("#moviesub").hide(240)
		$("#foodsub").hide(240)
		$("#groupsub").hide(240)
		$("#reportsub").hide(240)
	}
	function reportsub(){
		$("#reportsub").slideToggle(240)
		$("#moviesub").hide(240)
		$("#groupsub").hide(240)
		$("#foodsub").hide(240)
		$("#serviceSub").hide(240)
	}
	
	
	
	
	
</script>
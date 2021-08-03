<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>

</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-3">
	
		<!-- 메뉴 -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a class="sort nav-link active" data-toggle="tab" id="FOOD_NAME" href="#menu1">가나다순</a>
			</li>
			<li class="nav-item">
				<a class="sort nav-link" data-toggle="tab" id="FOOD_STAR" href="#menu2">별점높은순</a>
			</li>
			<li class="nav-item">
				<a class="sort nav-link" data-toggle="tab" id="FOOD_COMMENT" href="#menu3">리뷰많은순</a>
			</li>
			<li class="nav-item">
				<a class="sort nav-link" data-toggle="tab" id="FOOD_COMMENT" href="#menu3">좋아요많은순</a>
			</li>
			<li class="nav-item">
				<a class="sort nav-link" data-toggle="tab" id="FOOD_COMMENT" href="#menu3">조회수많은순</a>
			</li>
			<!-- <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">음식종류별 맛집</a>
				<div class="dropdown-menu">
					<a class="sort dropdown-item" data-toggle="tab" href="#menu4">한식</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu5">중식</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">일식</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">이탈리안</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">아메리칸</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">기타</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">카페/디저트</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">주점</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">지역별 맛집</a>
				<div class="dropdown-menu">
					<a class="sort dropdown-item" data-toggle="tab" href="#menu4">강남구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu5">강동구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">관악구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">마포구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">서초구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">성동구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">송파구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">영등포구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">용산구</a>
					<a class="sort dropdown-item" data-toggle="tab" href="#menu6">종로구</a>
				</div>
			</li> -->
			
		</ul>
	
	  <!-- 내용  -->
		<div class="tab-content">
	
			<div id="menu1" class="container tab-pane active"><br>
				<p>가나다가나다</p>
			</div>
	
			<div id="menu2" class="container tab-pane fade"><br>
				<p>54321</p>
			</div>
	
			<div id="menu3" class="container tab-pane fade"><br>
				<p>많다적다순으로 좌르륵</p>
			</div>
			
			
	
		</div>
	
	
	
	</div>
</section>

<script>
	$(function(){
		
		$(".sort").click( (e) => {
			let col;
			let val;
			
			col = $(e.target).
		} );
		
		
		
		/* $.ajax({
			url : "${path}/food/allFoodNameAsc",
			success : data => {
				console.log(data);
			}
		}); */
	});
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
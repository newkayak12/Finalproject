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
				<a class="nav-link active" data-toggle="tab" href="#menu1" id="foodNameAsc" onclick="fn_sorting('foodNameAsc');">가나다순</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#menu2" onclick="fn_sorting('foodStarDesc');">별점 높은순</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#menu3" onclick="fn_sorting('foodCommentCountDesc');">리뷰 많은순</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#menu4" onclick="fn_sorting('foodLikeCountDesc');">좋아요 많은순</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#menu5" onclick="fn_sorting('foodViewCountDesc');">조회수 많은순</a>
			</li>

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
			
			<div id="menu4" class="container tab-pane fade"><br>
				<p>많다적다순으로 좌르륵</p>
			</div>
			
			<div id="menu5" class="container tab-pane fade"><br>
				<p>많다적다순으로 좌르륵</p>
			</div>
	
		</div>
	
	
	
	</div>
</section>

<script>
	$( function() {
		let con = "#foodNameAsc";
	} );

	const fn_sorting = (con) => {
		
		$.ajax({
			url : "${path}/food/allFoodSorting",
			data : {
				"con" : con, 
				"cPage" : 1
			}, 
			success : data => {
				console.log(data);
			}
		});
	}
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
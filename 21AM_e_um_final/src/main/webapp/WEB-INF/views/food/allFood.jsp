<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<style>
#allFood .nav-link { color : #2AC1BC !important; }
#allFood .active { color : black !important; }
</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-3">
	
	<h3 class="tway blackText" style="text-align:center;">맛집 전체보기</h3>
	<br>
	
	<div id="allFood">
		<!-- 메뉴 -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
				<a class="nav-link active tway" data-toggle="tab" href="#menu1" id="foodNameAsc" onclick="fn_sorting('foodNameAsc', event);">가나다순</a>
			</li>
			<li class="nav-item tway">
				<a class="nav-link" data-toggle="tab" href="#menu2" id="foodStarDesc" onclick="fn_sorting('foodStarDesc', event);">별점 높은순</a>
			</li>
			<li class="nav-item tway">
				<a class="nav-link" data-toggle="tab" href="#menu3" id="foodCommentCountDesc" onclick="fn_sorting('foodCommentCountDesc', event);">리뷰 많은순</a>
			</li>
			<li class="nav-item tway">
				<a class="nav-link" data-toggle="tab" href="#menu4" id="foodLikeCountDesc" onclick="fn_sorting('foodLikeCountDesc', event);">좋아요 많은순</a>
			</li>
			<li class="nav-item tway">
				<a class="nav-link" data-toggle="tab" href="#menu5" id="foodViewCountDesc" onclick="fn_sorting('foodViewCountDesc', event);">조회수 많은순</a>
			</li>

		</ul>
		
		<br>
	
	  <!-- 내용  -->
		<div class="tab-content">
	
		</div>
	
	
	</div>
	</div>
</section>

<script>

	$( function() {
		let con = "foodNameAsc";
		$.ajax({
			url : "${path}/food/allFoodSorting",
			data : {
				"con" : con, 
				"cPage" : 1
			}, 
			success : data => {
				$(".tab-content").append(data);
			}
		});
	} );

	
	const fn_sorting = (con, e) => {
		
		let href = $(e.target).attr("href");
		 
		$(".tab-content").html("");
		
		$.ajax({
			url : "${path}/food/allFoodSorting",
			data : {
				"con" : con, 
				"cPage" : 1
			}, 
			success : data => {
				$(".tab-content").append(data);
			}
		});
	}
	
	// 맛집 더보기
	let cPage = 1;
	const moreList = (e) => {
		
		let con = $(".active").attr("id");
		console.log(con);
		
		$.ajax({
			url : "${path}/food/allFoodSorting?cPage=" + (++cPage),
			data : {
				"con" : con
			},
			success : data => {
				// 사용자가 누른 더보기버튼은 사라지게끔 
				$(e.target).parent().css("display", "none");
				$(".tab-content").append(data);
			}
		});
	}
	
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container">
	<h4 class="mainColor tway ml-3">평점이 높은 맛집</h4>
	
	<div id="" class="row justify-content-center features">
		<c:forEach items="${ fSlist }" var="f" varStatus="vs">
			<c:if test="${ vs.count < 5 }">
				<div class="col-6 col-md-4 col-lg-3 item" style="text-align:center;">
					<div class="box">
						<a class="open_food_modal" href="javascript:void(0)" onclick="fn_foodmodal('${ f.foodSeq }')" data-target="#foodModal" data-toggle="modal">
							<div>
								<img class="mainPageImages" src="${ pageContext.request.contextPath }/resources/upload/food/${f.menus[0]}">
								<div class="info mt-1 ml-4" style="text-align:left;">
									<span class="mainPageFoodName"><c:out value="${ f.foodName }"/></span>&nbsp;
									<strong class="mainPageFoodStar"><fmt:formatNumber type="number" pattern="0.0" value="${ f.foodStar }"/></strong>
									<p class="mainPageFoodAddrCate"><c:out value="${fn:substring(f.foodAddr, 4, 6)}"/>&nbsp;-&nbsp;<c:out value="${ f.foodCategoryMain }"/></p>
								</div>
							</div>
						</a>
					</div> <!-- box -->
				</div>
			</c:if>
		</c:forEach>
	</div>
</div> <!--container-->

<div class="container">

	<h4 class="mainColor tway ml-3">리뷰가 많은 맛집</h4>
	
	<div id="" class="row justify-content-center features">
	
		<c:forEach items="${ fClist }" var="f" varStatus="vs">
		<c:if test="${ vs.count < 5 }">
			<div class="col-6 col-md-4 col-lg-3 item" style="text-align:center;">
				<div class="box">
					<a class="open_food_modal" href="javascript:void(0)" onclick="fn_foodmodal('${ f.foodSeq }')" data-target="#foodModal" data-toggle="modal">
						<div>
							<img class="mainPageImages" src="${ pageContext.request.contextPath }/resources/upload/food/${f.menus[0]}">
							<div class="info mt-1 ml-4" style="text-align:left;">
								<span class="mainPageFoodName"><c:out value="${ f.foodName }"/></span>&nbsp;
								<strong class="mainPageFoodStar"><fmt:formatNumber type="number" pattern="0.0" value="${ f.foodStar }"/></strong>
								<p class="mainPageFoodAddrCate"><c:out value="${fn:substring(f.foodAddr, 4, 6)}"/>&nbsp;-&nbsp;<c:out value="${ f.foodCategoryMain }"/></p>
							</div>
						</div>
					</a>
				</div> <!-- box -->
			</div>
		</c:if>
		</c:forEach>
	</div>
</div> <!--container--> 

<div class="container">

	<h4 class="mainColor tway ml-3">예약이 많은 맛집</h4>
	
	<div id="" class="row justify-content-center features">
	
		<c:forEach items="${ fBlist }" var="f" varStatus="vs">
		<c:if test="${ vs.count < 5 }">
			<div class="col-6 col-md-4 col-lg-3 item" style="text-align:center;">
				<div class="box">
					<a class="open_food_modal" href="javascript:void(0)" onclick="fn_foodmodal('${ f.foodSeq }')" data-target="#foodModal" data-toggle="modal">
						<div>
							<img class="mainPageImages" src="${ pageContext.request.contextPath }/resources/upload/food/${f.menus[0]}">
							<div class="info mt-1 ml-4" style="text-align:left;">
								<span class="mainPageFoodName"><c:out value="${ f.foodName }"/></span>&nbsp;
								<strong class="mainPageFoodStar"><fmt:formatNumber type="number" pattern="0.0" value="${ f.foodStar }"/></strong>
								<p class="mainPageFoodAddrCate"><c:out value="${fn:substring(f.foodAddr, 4, 6)}"/>&nbsp;-&nbsp;<c:out value="${ f.foodCategoryMain }"/></p>
							</div>
						</div>
					</a>
				</div> <!-- box -->
			</div>
		</c:if>	
		</c:forEach>
	</div>
</div> <!--container-->
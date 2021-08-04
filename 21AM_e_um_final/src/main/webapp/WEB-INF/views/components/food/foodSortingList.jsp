<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }"
	scope="application" />
<c:set var="session" value="${userSession }" scope="session" />
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">

<style>
.mainPageImages { width : 200px; height:150px; border-radius: 10px; object-fit:cover;}
.mainPageFoodName { color : #3a3a3a; font-size : 20px; font-weight:900; }
.mainPageFoodStar { color : #2AC1BC; font-size : 20px; font-weight:900;}
.mainPageFoodAddrCate { color : gray; font-size : 15px; font-weight:900; }
a { text-decoration:none !important; } 
a:hover { text-decoration:none !important; }
.lightgray { color : lightgray; font-size:13px; }
.fcMore { text-align:center;  border-top : 1px solid lightgray;}
.fcMore a { text-decoration: none; color : black; font-size : 17px;}
</style>

<div class="features-boxed">

		<c:if test="${  list ne null and fn:length(list) ne 0 }">

				<div class="container">
				
					<div id="" class="row justify-content-center features">
					
						<c:forEach items="${ list }" var="f">
						
							<div class="col-6 col-md-4 col-lg-3 item" style="text-align:center;">
							
								<div class="box" style="margin-bottom: 20px;">
								
									<a href="${ pageContext.request.contextPath }/food/foodView?foodSeq=${f.foodSeq}">
										
										
											<img class="mainPageImages" src="${ pageContext.request.contextPath }/resources/upload/food/${f.menus[0]}">
											<div class="info mt-1 ml-4" style="text-align:left;">
											
												<span class="mainPageFoodName"><c:out value="${ f.foodName }"/></span>&nbsp;
												<strong class="mainPageFoodStar"><fmt:formatNumber type="number" pattern="0.0" value="${ f.foodStar }"/></strong>
												<br>
												<span class="mainPageFoodAddrCate"><c:out value="${fn:substring(f.foodAddr, 4, 6)}"/>&nbsp;-&nbsp;<c:out value="${ f.foodCategoryMain }"/></span>
												<br>
												<span class="lightgray"><i class="far fa-eye"></i>&nbsp;<c:out value="${ f.foodViewCount }"/></span>&nbsp;&nbsp;
												<span class="lightgray"><i class="fas fa-pencil-alt"></i>&nbsp;<c:out value="${ f.commentCount }"/></span>&nbsp;&nbsp;
												<span class="lightgray"><i class="fas fa-heart"></i>&nbsp;<c:out value="${ f.foodLikeCount }"/></span>
											
											</div>
										
									</a>
									
								</div> <!-- box -->
								
								
							</div>
							
						</c:forEach>
						
					</div>
					
				</div> <!--container-->
				
		</c:if>
		<c:if test="${ list ne null and fn:length(list) ne 0  }">
			<c:if test="${ cPage * 12 < totalFoodCount }">
				<div class="fcMore mainColor tway p-3">
					<a href="javascript:void(0)" onclick="moreList(event);">▾&nbsp;&nbsp;더보기&nbsp;&nbsp;▾</a>
				</div>
			</c:if>
		</c:if>
			
</div> <!-- features-boxed -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }"
	scope="application" />
<c:set var="session" value="${userSession }" scope="session" />
<div class="features-boxed">
			
				<div class="container">
				
					<h4 class="mainColor tway">평점이 높은 맛집</h4>
					
					<div id="" class="row justify-content-center features">
					
						<c:forEach items="${ list }" var="f">
						
							<div class="col-6 col-md-3 item" style="text-align:center;">
							
								<div class="box">
								
									<a class="open_food_modal" href="javascript:void(0)" onclick="fn_foodmodal('${ f.foodSeq }')" data-target="#foodModal" data-toggle="modal">
										
										<div>
											<img class="mainPageImages" src="${ path }/resources/upload/food/${f.menus[0].menuPhoto}">
											<div class="info mt-1 ml-4" style="text-align:left;">
												<span class="mainPageFoodName"><c:out value="${ f.foodName }"/></span>&nbsp;
												<strong class="mainPageFoodStar"><fmt:formatNumber type="number" pattern="0.0" value="${ f.foodStar }"/></strong>
												<p class="mainPageFoodAddrCate"><c:out value="${fn:substring(f.foodAddr, 4, 6)}"/>&nbsp;-&nbsp;<c:out value="${ f.foodCategoryMain }"/></p>
											</div>
										</div>
									</a>
									
								</div> <!-- box -->
								
								
							</div>
							
						</c:forEach>
						
					</div>
					
				</div> <!--container-->
			
		</div> <!-- features-boxed -->
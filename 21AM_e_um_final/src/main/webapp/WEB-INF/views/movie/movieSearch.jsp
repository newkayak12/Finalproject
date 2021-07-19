<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<section class="mt-5 mb-5">
	    <div id="root" class="container mt-5" data-ride="carousel" data-interval="false">
	    	<h3 style="margin-left:20px">검색된 영화</h3>
	    	
	    	<div class="row justify-content-center features">
	    		<c:forEach var="l" items="${list }">
	    			 <div class="col-6 col-md-3 item active">
		                <div class="box">
		                  <div class="movieBox" onclick="moveFn('${l.movieSeq}');" data-target="#myModal" data-toggle="modal">
			                 <figure class="movie_list">
			                   <div class="thumb">
			                     <img class="thumb-size col-12"
			                          src="${applicationScope.path }/resources/upload/movie/movie_poster/${l.moviePhoto}"
			                          data-original=""
			                          data-error=""/>
			                   </div>
		                   <figcaption>
		                     <div class="info">
		                       <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                       <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                       <p class="etc"><c:out value="예매율 ${l.movieReserveRate }"/></p>
		                     </div>
		                   </figcaption>
		                 </figure>
		               </div>
		             </div>
		            </div>
	    		</c:forEach>
	    	</div>
	    </div>
   </section>
	








<%@ include file="/WEB-INF/views/common/footer.jsp" %>
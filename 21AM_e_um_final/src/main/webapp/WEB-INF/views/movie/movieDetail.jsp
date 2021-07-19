<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<%-- <c:if var="${movie }" test="${movie }"> --%>
	<section class="mt-5">
	   <div id="root" class="container mt-5">
	       <div class="movie-detail">
	        <div class="title"><h3>영화상세</h3></div>
	        <div class="sect-base-movie pb-3">
	            <div class="box-image">
	                <span class="thumb-image justify-content-center">
	                    <img class="thumb-size col-12" src="${applicationScope.page }/resources/upload/movie/movie_poster/${movie.moviePhoto }" alt="">
	                </span>
	            </div>
	            <div class="box-contents ml-5 pt-5">
	                <div class="title_all">
	                    <strong>${movie.movieTitleKr }</strong>
	                    <span style="border : 2px solid lightgreen; color:lightgreen;">${movie.movieStatus }</span>
	                    <p>${movie.movieTitleEn }</p>
	                </div>
	                <div class="score">
	                    <span>예매율 &nbsp;
	                        <strong>${movie.movieReserveRate }</strong>
	                    </span><br>
	                    <span>영화평점 &nbsp;
	                        <strong>${movie.movieTotalEvalution }</strong>
	                    </span>
	                </div>
	                <button class="btn btn-success mt-5">예매하기</button>
	            </div>
	        </div>
	        
	        
	         <div class="cols-content mt-5" id="menu">
	            <div class="col-detail pb-5">
	                <ul class="tab-menu pb-5">
	                    <li><button class="btn">기본정보</button></li>
	                    <li><button class="btn">트레일러</button></li>
	                    <li><button class="btn">관람평</button></li>
	                    <li><button class="btn">예매분포</button></li>
	                </ul>
	                <div class="sect-story">
	                    <p>${movie.movieContents }</p>
	                </div>
	            </div>
	        </div> 
	        
	        <div class="container">
			  <table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>원제</th>
			        <td>${movie.movieTitleEn }</td>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <th>개봉일</th>
			        <td><fmt:formatDate value="${movie.movieOpenDate }" pattern="yyyy년 MM월 dd일"/></td>
			      </tr>
			      <tr>
			        <th>상영시간</th>
			        <td>${movie.movieRunningTime }</td>
			      </tr>
			      <tr>
			        <th>연령등급</th>
			        <td>${movie.movieAge }</td>
			      </tr>
			      <tr>
			        <th>감독</th>
			        <td>${movie.movieDirector }</td>
			      </tr>
			      <tr>
			        <th>배우</th>
			        <%-- <td>${movie.moviePersonName }</td> --%>
			      </tr>
			    </tbody>
			  </table>
			</div>
	    </div>
	<%-- </c:if> --%>



<style>
    .movie-detail{
        
    }
    .title{
        border-bottom: 3px solid black;
    }
    .title > h3{
        font-size: 36px;
        font-weight: 1000;
    }
    .sect-base-movie{
        margin-top: 40px;
        display: flex;
        border-bottom: 2px solid black;
       
    }
    .box-image{
        width: 200px;
        height:300px;
        display: inline-block;
        justify-content: center;
    }
    .box-image img{
       
        height: 300px;  
        margin-left: 30px; 

    }
    .box-contents{
        height: 300px;
        display: inline-block;
    }
    .cols-content{
        float: none;
        
    }
    .title_all{}
    .title_all strong{
        font-size: 25px;
       
    }
    .title_all p{
        margin-top: 0px;
    }
    .tab-menu{
    	list-style: none;
    }
    .tab-menu li{
    	display: inline-block;
    }
    .sect-story{
    	border-bottom: 2px solid black;
    }
</style>
   </div>
</section>








<%@ include file="/WEB-INF/views/common/footer.jsp" %>
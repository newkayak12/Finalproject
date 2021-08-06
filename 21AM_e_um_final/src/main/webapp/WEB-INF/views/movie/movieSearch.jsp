<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 <style>
     
     #root{
     	font-family:'NanumBarunGothic';
     }
     .features-boxed {
        
      }

      .features-boxed p {
        color: #7d8285;
      }

      .features-boxed h3 {
        font-weight: bold;
        /* margin-bottom: 40px; */
        padding-top: 40px;
        color: inherit;
      }

      @media (max-width:500px) {
        .features-boxed h2 {
          margin-bottom: 25px;
          padding-top: 25px;
          font-size: 24px;
        }
      }

      .features-boxed .intro {
        font-size: 16px;
        max-width: 500px;
        margin: 0 auto;
      }

      .features-boxed .intro p {
        margin-bottom: 0;
      }

      .features-boxed .features {
        padding: 50xp 0;
      }

      .movieBox {
        text-align: center;
      }

      .features-boxed .item .box {
        text-align: center;
        
        background-color: #fff;
        margin-bottom: 30px;
      }

      .title {
        font-size: 22px;
        margin-bottom: 8px;
        margin-top: 0;
        color: black;
      }

      .features-boxed .item {
        font-size: 25px;
        margin-bottom: 8px;
        margin-top: 0;
        color: skyblue;
      }

      .thumb-size {
        width: 200px;
        height: 280px; 
      }
      .modal-body .thumb-size {
        float: left;
      }

      div.modal-info {
        padding: 10 10 10 10;
      }
      .title{
      	text-align:center;
      }
      .search_point{
      	font-size : 16px;
      }
      .etc{
      	font-size : 16px;
      }
      #movie_video{
      	margin-top:50px;
      }
      .cursor{
      	cursor: pointer;
      }
      
    </style>

	<section class="mt-5 pt-5">
		<div id="root" class="container mt-5">
			<section class="mt-5 mb-5 mt-5">
			    <div data-ride="carousel" data-interval="false">
			    	<h3 style="margin-left:20px">검색된 영화</h3>
			    	
			    	<div class="row justify-content-center features">
			    		<c:forEach var="l" items="${list }">
			    			 <div class="col-6 col-md-3 item active">
				                <div class="box">
				                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq }');" data-target="#myModal" data-toggle="modal">
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
		</div>
	</section>	

	<script>
		const moveFn=(movieSeq)=>{
			console.log(movieSeq);
			location.assign("<%=request.getContextPath()%>/movie/movieDetail?movieSeq="+movieSeq);
		}
		
		
		
		
	</script>






<%@ include file="/WEB-INF/views/common/footer.jsp" %>
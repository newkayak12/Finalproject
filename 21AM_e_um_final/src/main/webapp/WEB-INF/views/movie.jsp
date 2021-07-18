<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    
    <script>
    	<%-- $(function(){
    		$.ajax({
    			url:"<%=request.getContextPath()%>/movie/movieInfo",
    			success:data=>{
    				console.log(data);
    			}
    		});
    	}) --%>
    	
    	const moveFn=(movieSeq)=>{
    		$.ajax({
    			url:"<%=request.getContextPath()%>/movie/moviePoster",
    			data:{"movieSeq":movieSeq},
    			success:data=>{
    				let date = data["movieOpenDate"];
    				let result = date.split("-");
    				
    				console.log(date);
    				console.log("hello"+data);
    				$("#modalImage").attr("src","${applicationScope.path}/resources/upload/movie/movie_poster/"+data["moviePhoto"])
    				$("#modalTitleKr").html(data["movieTitleKr"])
    				$("#modalTitleEn").html(data["movieTitleEn"])
    				$("#modalOpenDate").html("개봉일 : "+result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일")
    				$("#modalReserveRate").html("예매율 : "+data["movieReserveRate"]+"%")
    			}
    		});
    	}
    
    	
    </script>
   
   
   <%-- <c:out value="${list }"/> --%>
   
    <style>
     .features-boxed {
        border: 1px solid skyblue;
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

      .features-boxed .item {
        text-align: center;
      }

      .features-boxed .item .box {
        text-align: center;
        padding: 20px;
        background-color: #fff;
        margin-bottom: 30px;
      }

      .features-boxed .item .title {
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
        height: 250px; 
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
      
    </style>
    <section class="features-boxed">
	    <div id="carousel-main" class="carousel slide" data-ride="carousel" data-interval="false">
	    	<h3 style="margin-left:80px">박스오피스 순위</h3>
	    	
	    	<div class="row justify-content-center features">
	    		<c:forEach var="l" items="${list }" begin="0" end="3">
	    			 <div class="col-6 col-md-3 item active">
		                <div class="box">
		                  <div onclick="moveFn('${l.movieSeq}');" data-target="#myModal" data-toggle="modal">
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
   
   
   <section>
   		<div class="modal" id="myModal">
		    <div class="modal-dialog modal-dialog-centered">
		      <div class="modal-content">
		
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <!-- <h4 class="modal-title">Modal Heading</h4> -->
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		
		        <!-- Modal body -->
		        <div class="modal-body">
		          <div id="modal-content">
			          <div class="text-center mb-4">  
			            <img id="modalImage" class="thumb-size" src="">
			            <div class="modal-info">
			              <h3 id="modalTitleKr"></h3>
			              <h5 id="modalTitleEn"></h5>
			              <p id="modalOpenDate"></p>
			              <p id="modalReserveRate"></p>
		              </div>
		              <div class="mt-4 p-4 d-flex justify-content-around">
		              	<button class="btn btn-success">상세보기</button><button class="btn btn-primary">예매하기</button>
		              </div>
		            </div>
		          </div>
		        </div>
		
		        
		
	      </div>
	    </div>
	  </div>
   </section>
   
   
   
   
   
   
   
   
   
   
   
   


</body>
</html>
   
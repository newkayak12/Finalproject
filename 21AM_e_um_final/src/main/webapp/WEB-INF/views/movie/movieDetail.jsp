<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	
	<script>
		const moveFn=(moviePersonName)=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/movie/moviePerson",
				data:{"moviePersonName":moviePersonName},
				success:data=>{
					console.log(data);
					let date = data["moviePersonBirth"];
					let result = date.split("-"); 

						console.log(data["movies"]);
					$("#modalImage").attr("src","${applicationScope.path}/resources/upload/movie/movie_person_picture/"+data["moviePersonPhoto"])
					/* $("#modalTitleKr").html(data["movieTitleKr"])
					$("#modalTitleEn").html(data["movieTitleEn"])
					$("#modalOpenDate").html("개봉일 : "+result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일")
					$("#modalReserveRate").html("예매율 : "+data["movieReserveRate"]+"%")
					$("#btn1").attr("value",data["movieSeq"])  */
					$("#modalPersonName").html(data["moviePersonName"])
					$("#modalBirth").html("출생 : " +result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일")
					$("#modalPhilmo").html("")
					data["movies"].forEach((v,i)=>{
						
						$("#modalPhilmo").append($("<li>").html(v).attr("class","list-group-item col-12 small").css("max-height","40px"));
					})
					/* for(int i=0; i<data["movies"].length; i++){
						$("#modalPhilmo").append($("<li>").html(data[i]));
					}  */
				}
			});
		}
	
	
	</script>
	
	
	
	
	<section class="mt-5 pt-5">
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
	                <ul class="tab-menu pb-5 text-center">
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
			          <td> 
				          <c:forEach var="r" items="${movie.moviePersonName }" varStatus="i" >
				      		 <a href="" class="movieBox" onclick="moveFn('${r.moviePersonName}');" data-target="#myModal" data-toggle="modal"> 
				      		 	<c:out value="${r.moviePersonName }"/>
				      		 	<c:if test="${ !i.last }">,</c:if>
				      	  	</a>
				      	  </c:forEach>
			      	  </td>
			      </tr>
			    </tbody>
			  </table>
			</div>
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
			              <h3 id="modalPersonName"></h3>
			              <h5 class="mt-2" id="modalBirth"></h5>
			              <h4 class="pt-2">필모그래피</h4>
			              <ul id="modalPhilmo" class="list-group text-center">
			              
			              <ul>
		              	</div>
		              
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
	   </section>



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
      .tab-menu{
      	list-style: none;
      }
      .tab-menu li{
      	display: inline-block;
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
        margin-right: 30px;
        width: 200px;
        height:300px;
        display: inline-block;
    }
    .box-image img{
        width: 200px;
        height: 300px;  
        margin-left: 30px; 
    }
    .box-contents{
        width: 765px;
        height: 350px;
        display: inline-block;
        margin-left: 30px;
        
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
    </style>










<%@ include file="/WEB-INF/views/common/footer.jsp" %>
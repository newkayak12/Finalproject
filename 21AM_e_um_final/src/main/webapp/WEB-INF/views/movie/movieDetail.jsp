<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
		
		<%-- function trailerAjax(){
    		console.log(movieSeq);
			$.ajax({
    			url:"<%=request.getContextPath()%>/movie/selectMovieVideo",
    			data:{"movieSeq":movieSeq},
    			success:data=>{
    				$("#movieVideo").attr("src",data["movieVideo"])
    			}
    		})
    	} --%>
		
		const basicInfoShow=()=>{
			$("#basicInfocontainer").css("display","block")
			$("#trailercontainer").css("display","none")
			$("#reviewcontainer").css("display","none")
			$("#graphcontainer").css("display","none")
		}
		const trailerShow=(movieSeq)=>{
			$("#basicInfocontainer").css("display","none")
			$("#trailercontainer").css("display","block")
			$("#reviewcontainer").css("display","none")
			$("#graphcontainer").css("display","none")
			
			$.ajax({
    			url:"<%=request.getContextPath()%>/movie/selectMovieVideo",
    			data:{"movieSeq":movieSeq},
    			success:data=>{
    				$("#movieVideo").attr("src",data["movieVideo"])
    			}
    		})
			
			
		}
		const reviewShow=(movieSeq)=>{
			$.ajax({
    			url:"<%=request.getContextPath()%>/movie/movieReview",
    			data:{"movieSeq":movieSeq},
    			success:data=>{
    				console.log(data);
    				for(var i=0; i<data.length;i++){
    					let date = data[i].movieReviewWriteDate;
        				let result = date.split("-");
        				console.log(result);
    					$(".writer").html(data[i].userId.userId)
	    				$(".star-point").html("★"+data[i].movieEvaluationAvg)
	    				$(".review").html(data[i].movieReviewContent)
	    				$(".writeDate").html(result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일")
    				}
    			}
    		})
    		
			
			$("#basicInfocontainer").css("display","none")
			$("#trailercontainer").css("display","none")
			$("#reviewcontainer").css("display","block")
			$("#graphcontainer").css("display","none")
			
		}
		const graphShow=()=>{
			$("#basicInfocontainer").css("display","none")
			$("#trailercontainer").css("display","none")
			$("#reviewcontainer").css("display","none")
			$("#graphcontainer").css("display","block")
			
		}
		
		const reviewWrite=(movieSeq)=>{
			location.assign("<%=request.getContextPath()%>/movie/movieWriteStart?movieSeq="+movieSeq);
		}
	
	</script>
	
	
	<section class="mt-5 pt-5">
		<div id="root" class="container mt-5">
			<section>
			   <div>
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
			            <div class="col-detail pb-3">
			                <ul class="tab-menu pl-0 pb-5 text-center">
			                    <li><button class="btn" id="basicinfobtn" onclick="basicInfoShow()">기본정보</button></li>
			                    <li><button class="btn" id="trailerbtn" onclick="trailerShow('${movie.movieSeq}')">트레일러</button></li>
			                    <li><button class="btn" id="reviewbtn" onclick="reviewShow('${movie.movieSeq}')">관람평</button></li>
			                    <li><button class="btn" id="graphbtn" onclick="graphShow()">예매분포</button></li>
			                </ul>
			               
			            </div>
			        </div> 
			        
			        <div class="container" id="basicInfocontainer">
		         		<div class="sect-story">
		                    <p>${movie.movieContents }</p>
	               		 </div>
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
					<!-- 기본정보 -->
					<div id="trailercontainer" class="p-3 pt-0 " >
						<iframe id="movieVideo" src=""
		                    style="width:100%; height:450px;"
		                    frameborder="0" allow="accelermeter; clipboard-white; encrypted-media; gyroscope; picture-in-picture" allowfullscreen" >
                        
                   		 </iframe>
					</div>
					<div id="reviewcontainer" class="">
						<h3 id="gwan">관람평</h3>
						<button class="btn btn-primary float-right" onclick="reviewWrite('${movie.movieSeq}');">작성하기</button>
						<table class="table">
						    <thead>
						      <tr>
						        <th>작성자</th>
						        <th>별점</th>
						        <th>리뷰</th>
						        <th>작성일</th>
						      </tr>
						    </thead>
						    <tbody>
							    <tr class="table-container">
							        <td class="writer">
							        <td class="star-point">
							        <td class="review">
							        <td class="writeDate">
							    </tr>
						    </tbody>
						  </table>
					</div>
					
					<div id="graphcontainer">
						graph
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
		</div>
	</section>	


<style>
     #trailercontainer{
     	display:none;
     }
     #reviewcontainer{
     	display:none;
     }
     #graphcontainer{
     	display:none;
     }
     
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
    #gwan{
    	display: inline-block;
    }
    </style>










 <%@ include file="/WEB-INF/views/common/footer.jsp" %> 
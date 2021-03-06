<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/taehui.css">
    <script>
    	<%-- $(function(){
    		$.ajax({
    			url:"<%=request.getContextPath()%>/movie/movieInfo",
    			success:data=>{
    				console.log(data);
    			}
    		});
    	}) --%>
    	
    	/* modal 화면 가져오기  */
    	const moveFn=(movieSeq)=>{
    		$.ajax({
    			url:"${path}/movie/moviePoster",
    			data:{"movieSeq":movieSeq},
    			success:data=>{
    				console.log(data);
    				let date = data["movieOpenDate"];
    				let result = date.split("-");
    				$("#modalImage").attr("src","${applicationScope.path}/resources/upload/movie/"+data["moviePhoto"])
    				$("#modalTitleKr").html(data["movieTitleKr"])
    				$("#modalTitleEn").html(data["movieTitleEn"])
    				$("#modalOpenDate").html("개봉일 : "+result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일")
    				$("#modalReserveRate").html("예매율 : "+data["movieReserveRate"]+"%")
    				
    				$("#btn1").attr("value",data["movieSeq"])
    				$("#btn2").attr("value",data["movieSeq"])
    			}
    		});
    	}
    	
    	
    	/* 예매율 1등 비디오 가져오기  */
    	$(function(){
    		$.ajax({
    			url:"${path}/movie/movieVideo",
    			success:data=>{
    				console.log(data);
    				$("#movieVideo").attr("src",data["movieVideo"])
    			}
    		})
    	})
    	
    	/* 모달에서 상세페이지 이동 */
    	const move_movieDetail=(e)=>{
    		console.log(e.target.value);//MO_3
    		location.assign("${path}/movie/movieDetail?movieSeq="+e.target.value);
    	}
    	
    	/* 검색 보내기 */
    	 const movieSearch=()=>{
    		let search = $("#search").value;
    		if(search.length<2){
    			alert("검색어는 두글자 이상 입력하세요");
    		}else{
    			$("#searchForm").submit();
    		}
    		
    	} 
    	
    	/* 예매페이지로 이동 */ 
    	const moveReserve=(e)=>{
    		let movieSeq = e.target.value;
    		location.assign("${path}/movie/movieReserve?movieSeq="+movieSeq);
    	}
    
    	
    </script>
   
   

    <style>
    
     #root{
	    /* min-height:500px; */
	    font-family:'Noto Sans KR';
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
        font-size: 18px;
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
      .corsor{
      	cursor:pointer
      }

    </style>
    
    
    <section class="mt-5 pt-5">
        <div id="root" class="container mt-5">
            <div class="mb-3 pb-1">
                <form id="searchForm" class="float-right mr-5" action="<%=request.getContextPath() %>/movie/searchMovie">
                    <input type="text" name="search" id="search" style="width:300px; height:30px;" placeholder="보고싶은 영화를 검색하세요">
                    <button class="btn-primary" onclick="movieSearch();">검색</button>
                </form>
            </div>           
            <section class="mt-5 mb-lg-0 pt-5 pt-lg-3 pb-  mb-5">
            	<div id="recommand-container" class="caru992 carousel slide col-12  mt-0 container pt-4 border" data-ride="carousel">
            	<h3 class="mt-5" style="font-weight: bold">박스오피스 순위</h3>
	                <div class="carousel-inner" id="recommand-inner-conatiner ">
	                  
	                  	<!-- 2 -->	      
	                    <div class="carousel-item active">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        
		                        <c:forEach var="l" items="${list }" begin="0" end="3">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size "
		                                              src="${applicationScope.path }/resources/upload/movie/${l.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                        
		                        
		                    </div>
	                    </div>
	                    
	                    
						<!-- 2 -->	                  
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l" items="${list }" begin="4" end="7">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   <!--  3 -->
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l" items="${list }" begin="8" end="11">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   
	                </div>
		                <a class="carousel-control-prev carubtn" href="#recommand-container" data-slide="prev">
					    <!-- <span class="carousel-control-prev-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="50px">
					  </a>
					  <a class="carousel-control-next carubtn" href="#recommand-container" data-slide="next">
					    <!-- <span class="carousel-control-next-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="50px">
					  </a>
                </div>
                
                <!-- caru991  -->
                <div id="recommand-containerMark2" class="caru991 carousel slide col-12  mt-0 container pt-4 border" data-ride="carousel">
            	<h3 style="font-weight: bold">박스오피스 순위</h3>
	                <div class="carousel-inner" id="recommand-inner-conatiner ">
	                  
	                  	<!-- 2 -->	      
	                    <div class="carousel-item active">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        
		                        <c:forEach var="l" items="${list }" begin="0" end="2">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                        
		                        
		                    </div>
	                    </div>
	                    
	                    
						<!-- 2 -->	                  
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l" items="${list }" begin="3" end="5">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   <!--  3 -->
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l" items="${list }" begin="6" end="8">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l" items="${list }" begin="9" end="11">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   
	                </div>
		                <a class="carousel-control-prev carubtn" href="#recommand-containerMark2" data-slide="prev">
					    <!-- <span class="carousel-control-prev-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="50px">
					  </a>
					  <a class="carousel-control-next carubtn" href="#recommand-containerMark2" data-slide="next">
					    <!-- <span class="carousel-control-next-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="50px">
					  </a>
                </div>
                
                
                <div id="recommand-container2" class="caru992 carousel slide col-12  mt-0 container pt-4 border" data-ride="carousel">
            	<h3 class="mt-5" style="font-weight: bold">개봉예정</h3>
	                <div class="carousel-inner" id="recommand-inner-conatiner ">
	                  
	                  	<!-- 2 -->	      
	                    <div class="carousel-item active">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        
		                        <c:forEach var="l2" items="${list2 }" begin="0" end="3">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l2.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size "
		                                              src="${applicationScope.path }/resources/upload/movie/${l2.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l2.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l2.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l2.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                        
		                        
		                    </div>
	                    </div>
	                    
	                    
						<!-- 2 -->	                  
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l2" items="${list2 }" begin="4" end="7">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l2.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l2.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l2.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l2.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l2.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   <!--  3 -->
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l2" items="${list2 }" begin="8" end="11">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l2.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l2.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l2.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l2.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   
	                </div>
		                <a class="carousel-control-prev carubtn" href="#recommand-container2" data-slide="prev">
					    <!-- <span class="carousel-control-prev-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="50px">
					  </a>
					  <a class="carousel-control-next carubtn" href="#recommand-container2" data-slide="next">
					    <!-- <span class="carousel-control-next-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="50px">
					  </a>
                </div>
                
                <div id="recommand-containerMark3" class="caru991 carousel slide col-12  mt-0 container pt-4 border" data-ride="carousel">
            	<h3 style="font-weight: bold">개봉예정</h3>
	                <div class="carousel-inner" id="recommand-inner-conatiner ">
	                  
	                  	<!-- 2 -->	      
	                    <div class="carousel-item active">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        
		                        <c:forEach var="l2" items="${list2 }" begin="0" end="2">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l2.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l2.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l2.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l2.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l2.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                        
		                        
		                    </div>
	                    </div>
	                    
	                    
						<!-- 2 -->	                  
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l2" items="${list2 }" begin="3" end="5">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l2.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l2.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l2.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l2.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l2.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   <!--  3 -->
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l2" items="${list2 }" begin="6" end="8">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l2.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l2.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l2.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l2.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l2.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                    <div class="carousel-item">
		                    <div class="d-flex justify-content-around pl-5 pr-5">
		                        <c:forEach var="l2" items="${list2 }" begin="9" end="11">
		                             <div class="col-6 col-md-3 item active">
		                                <div class="box">
		                                  <div class="movieBox cursor" onclick="moveFn('${l2.movieSeq}');" data-target="#movieModal" data-toggle="modal">
		                                     <figure class="movie_list">
		                                       <div class="thumb">
		                                         <img class="thumb-size"
		                                              src="${applicationScope.path }/resources/upload/movie/${l2.moviePhoto}"
		                                              data-original=""
		                                              data-error=""/>
		                                       </div>
		                                       <figcaption>
		                                         <div class="info">
		                                           <strong class="title"><c:out value="${l2.movieTitleKr }"/></strong><br>
		                                           <span class="search_point "><c:out value="${l2.movieStatus}"/></span>
		                                           <p class="etc"><c:out value="예매율 ${l2.movieReserveRate } %"/></p>
		                                         </div>
		                                       </figcaption>
		                                 </figure>
		                               </div>
		                             </div>
		                            </div>
		                        </c:forEach>
		                    </div>
	                    </div>
	                   
	                </div>
		                <a class="carousel-control-prev carubtn" href="#recommand-containerMark3" data-slide="prev">
					    <!-- <span class="carousel-control-prev-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="50px">
					  </a>
					  <a class="carousel-control-next carubtn" href="#recommand-containerMark3" data-slide="next">
					    <!-- <span class="carousel-control-next-icon"></span> -->
					    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="50px">
					  </a>
                </div>
           </section>
           <section id="movie_video">
            <div class="wrapper mb-5" style="width:100%; height:500px; margin:0 auto;">
                <div><h3>흥행 영화 예고편</h3></div>
                <div>
                    <iframe id="movieVideo" src=""
                    style="width:100%; height:450px;"
                    frameborder="0" allow="accelermeter; clipboard-white; encrypted-media; gyroscope; picture-in-picture" allowfullscreen" >
                        
                    </iframe>
                    
                </div>
             </div>
            </section>
            <section>
                <div class="modal" id="movieModal">
                 <div class="modal-dialog modal-dialog-centered">
                   <div class="modal-content">
             
                     <!-- Modal Header -->
                     <div class="modal-header">
                       <!-- <h4 class="modal-title">Modal Heading</h4> -->
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
             
                     <!-- Modal body -->
                     <div class="modal-body">
                       <div id="modal-content" class="d-flex flex-column justify-content-center align-items-center">
                           <div class="text-center ">  
                             <img id="modalImage" class="" width="200px;" src="">
                             <div class="modal-info">
                               <h3 id="modalTitleKr" style="width: 385px;"></h3>
                               <h5 id="modalTitleEn" style="width: 385px;"></h5>
                               <p id="modalOpenDate" style="width: 385px;" class="small"></p>
                               <p id="modalReserveRate" style="width: 385px;" class="small"></p>
                           </div>
                           <div class="col-12 d-flex flex-row justify-content-around">
                               <button id="btn1" class="btn checkBtn" onclick="move_movieDetail(event);" >상세보기</button>
                               <button id="btn2" class="btn cancelBtn" onclick="moveReserve(event);")>예매하기</button>
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
   
   
   
   
   
   
   
   
   
 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

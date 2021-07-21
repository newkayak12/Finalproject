<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    				console.log(data);
    				let date = data["movieOpenDate"];
    				let result = date.split("-");
    				$("#modalImage").attr("src","${applicationScope.path}/resources/upload/movie/movie_poster/"+data["moviePhoto"])
    				$("#modalTitleKr").html(data["movieTitleKr"])
    				$("#modalTitleEn").html(data["movieTitleEn"])
    				$("#modalOpenDate").html("개봉일 : "+result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일")
    				$("#modalReserveRate").html("예매율 : "+data["movieReserveRate"]+"%")
    				$("#btn1").attr("value",data["movieSeq"])
    			}
    		});
    	}
    	
    	$(function(){
    		$.ajax({
    			url:"<%=request.getContextPath()%>/movie/movieVideo",
    			success:data=>{
    				console.log(data);
    				$("#movieVideo").attr("src",data["movieVideo"])
    			}
    		})
    	})
    	
    	const move_movieDetail=(e)=>{
    		console.log(e.target.value);//MO_3
    		location.assign("<%=request.getContextPath()%>/movie/movieDetail?movieSeq="+e.target.value);
    	}
    	
    	/* const movieSearch=()=>{
    		let search = $("#search").value;
    		if(search.length<2){
    			alert("검색어는 두글자 이상 입력하세요");
    		}else{
    			$("#searchForm").submit();
    		}
    		
    	}  */
    
    	
    </script>
   
   

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
        font-size: 20px;
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
      
    </style>
    
    
    <section class="mt-5 pt-5">
        <div id="root" class="container mt-5">
            <div>
                <form id="searchForm" class="float-right mr-5" action="<%=request.getContextPath() %>/movie/searchMovie">
                    <input type="text" name="search" id="search" style="width:300px; height:24px;" placeholder="보고싶은 영화를 검색하세요">
                    <button class="btn-primary" onclick="movieSearch();">검색</button>
                </form>
            </div>           
            <section class="mt-7 pt-7 pb-5 mb-5">
                <div  data-ride="carousel" data-interval="false">
                    <h3 style="margin-left:20px">박스오피스 순위</h3>
                    
                    <div class="row justify-content-center features">
                        <c:forEach var="l" items="${list }" begin="0" end="3">
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
           <section id="movie_video">
            <div class="wrapper col-8 mb-5" style="border: 1px solid black; height:500px; margin:0 auto;">
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
                               <h4 id="modalTitleKr"></h4>
                               <h5 id="modalTitleEn"></h5>
                               <p id="modalOpenDate"></p>
                               <p id="modalReserveRate"></p>
                           </div>
                           <div class="mt-4 p-4 d-flex justify-content-around">
                               <button id="btn1" class="btn btn-success" onclick="move_movieDetail(event);">상세보기</button><button class="btn btn-primary">예매하기</button>
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

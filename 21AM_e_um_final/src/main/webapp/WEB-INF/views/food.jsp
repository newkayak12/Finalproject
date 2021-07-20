<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    

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
        padding: 50px 0;
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

      .features-boxed .item .info .title {
        font-size: 25px;
        margin-bottom: 8px;
        margin-top: 0;
        color: black;
      }

      .features-boxed .item .info .search_point {
        font-size: 25px;
        margin-bottom: 8px;
        margin-top: 0;
        color: skyblue;
      }

      .thumb-size {
        width: 200px;
        height: 200px; 
      }
      .modal-body .thumb-size {
        float: left;
      }

      div.modal-info {
        padding: 10 10 10 10;
      }
      
     div.search-container{
        margin: 30px;
      }
      .search-container input[type="search"]{
        height: 40px;
      }
      .search-container button{
        height: 40px;
        width: 60px;
        background-color: rgb(165, 205, 230);
      }
      
      /*section css*/
		/* #root{
		    border:1px red solid;
		    min-height: 500px;
		    margin: 30px 10% 10px 10%;
		} */
    </style>
</head>

<body>
  
  <section>
   <div class="search-container">
      <form>
      <!-- col-8 col-md-6 -->
          <input class="col-8 col-md-6 form-control" style="display:inline;" size="20" type="search" name="searchKeyword" placeholder="지역, 식당, 음식으로 검색해보세요" >
          <button type="submit" class="btn" >검색</button>
      </form>
    </div>
    
    <button class="btn btn-primary" onclick="location.href='${applicationScope.path}/food/foodForm/start'">맛집등록</button>
  </section>
  
  <section class="features-boxed">
    <div class="container">
       
        <h3 class="">평점이 높은 맛집</h3>
     
        <div id="" class="row justify-content-center features">

        
		<c:forEach items="${ list }" var="f">
			<div class="col-6 col-md-3 item">
                <div class="box">
                  <a id="open_food_modal" href="#" onclick="fn_foodmodal('${ f.foodSeq }')" data-target="#myModal" data-toggle="modal">
	                 <figure class="">
	                   <div class="thumb">
	                     <img class="thumb-size"
	                          src="${ path }/resources/upload/food/${f.menus[0].menuPhoto}">
	                   </div>
	                   <figcaption>
	                     <div class="info">
	                       <span class="title"><c:out value="${ f.foodName }"/></span>
	                       <strong class="search_point "><c:out value="${ f.foodStar }"/></strong>
	                       <p class="etc"><c:out value="${ f.foodAddr }"/><c:out value="${ f.foodCategoryMain }"/></p>
	                     </div>
                   		</figcaption>
                 	</figure>
	               	</a>
	             </div>
	        	</div>
	     	</c:forEach>
	      
	    </div>
	</section>

	<section>
	  
	  <!-- The Modal -->
	  <div class="modal" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <div class="modal-body">
	          <div id="modal-content">
	            <img class="thumb-size" src="">
	            <div class="modal-info">
	              <p></p> <!-- 대분류 -->
	              <h5></h5> <!-- 맛집이름 -->
	              <p></p> <!-- 주소 -->
	              <p></p> <!-- 전화번호 -->
	              <p></p> <!-- 영업시간 -->
	              <p></p> <!-- 별점 -->
	              <input type="hidden" value="">
	            </div>
	          </div>
	        </div>
	
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" onclick="">예약하기</button>
	          <button type="button" class="btn btn-primary" onclick="fn_foodView();">상세보기</button>
	        </div>
	
	      </div>
	    </div>
	  </div>
	  
	  <script>
	  	// 모달열기 함수 
		const fn_foodmodal=(seq)=>{
		    	 
			$.ajax({
		    	url : "${ path }/food/foodModal",
		    	data : {"foodSeq":seq},
		    	success : data => {
		    		console.log(data);
		    		$("#modal-content").find("img").attr("src", "${ path }/resources/upload/food/" + data.menus[0].menuPhoto);
		    		$("#modal-content").find("p").first().text(data.foodCategoryMain);
		    		$("#modal-content").find("h5").text(data.foodName);
		    		$("#modal-content").find("p").eq(1).text(data.foodAddr);
		    		$("#modal-content").find("p").eq(2).text(data.foodCall);
		    		$("#modal-content").find("p").eq(3).text(data.foodTimeFirst.concat(' ~ ', data.foodTimeLast));
		    		$("#modal-content").find("p").eq(4).text(data.foodStar);
		    		$("#modal-content").find("input").attr("value", data.foodSeq);
		    		
		    	}
		    		 
		     })
		}
		
		// 상세보기페이지로 전환
		const fn_foodView = () => {
			
			// 맛집 시퀀스 가져오기 
			let foodSeq = $("#modal-content").find("input").val();
			
					// console.log(foodSeq);
					
			location.assign("${path}/food/foodView?foodSeq=" + foodSeq);
			
		}
		</script>
	
	
	</section>

	<section>
		<a id="MOVE_TOP_BTN" href="#"><div>TOP</div></a>
		<style>
			a#MOVE_TOP_BTN {
			    position: fixed;
			    right: 5%;
			    bottom: 50px;
			    display: none;
			    z-index: 999;
			}
			a#MOVE_TOP_BTN div {
				border-radius : 50%;
				background-color : #70b3d9;
				width : 50px;
				height : 50px;
				text-align : center;
				line-height : 50px;
				color : black;
			}
		</style>
		<script>
		    $(function() {
		        $(window).scroll(function() {
		            if ($(this).scrollTop() > 500) {
		                $('#MOVE_TOP_BTN').fadeIn();
		            } else {
		                $('#MOVE_TOP_BTN').fadeOut();
		            }
		        });
		        
		        $("#MOVE_TOP_BTN").click(function() {
		            $('html, body').animate({
		                scrollTop : 0
		            }, 400);
		            return false;
		        });
		    });
		</script>
	</section>


   


</body>
</html>
   
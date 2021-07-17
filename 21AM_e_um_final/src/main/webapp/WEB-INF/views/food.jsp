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
    </style>
</head>

<body>
  
  <c:out value="${ list }"/>
  
  <section>
  	<div>
  		<form class="navbar-search">
        	<div class="input-group">
        		<input class="bg-light form-control border-0 small" type="text" placeholder="지역, 식당, 음식으로 검색해보세요">
        		<button class="btn btn-primary py-0" type="button">
        			<i class="fas fa-search"></i>
        		</button>
        	</div>
        </form>
  	</div>
  </section>
  
  <section class="features-boxed">
    <div class="container">
        <!-- <div class="intro">
            <h2 class="">평점이 높은 맛집</h2>
        </div> -->
        <h3 class="">평점이 높은 맛집</h3>
        <!--1-->
        <div id="" class="row justify-content-center features">

          <!--1-->
          <c:forEach begin="1" end="8">
            <div class="col-6 col-md-3 item">
                <div class="box">
                  <a href="/restaurants/DySu_0aeHezN" data-target="#myModal" data-toggle="modal">
                 <figure class="restaurant-item">
                   <div class="thumb">
                     <img class="thumb-size"
                          src="https://canarywharf.com/wp-content/uploads/2020/05/canary-wharf-eating-drinking-shake-shack-ss20-1-710x690-1.jpg"
                          data-original=""
                          data-error=""/>
                   </div>
                   <figcaption>
                     <div class="info">
                       <span class="title">반서울</span>
                       <strong class="search_point ">4.3</strong>
                       <p class="etc"> 신촌/이대 -이탈리안</p>
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

        <!-- Modal Header -->
        <div class="modal-header">
          <!-- <h4 class="modal-title">Modal Heading</h4> -->
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          <div id="modal-content">
            <img class="thumb-size" src="https://canarywharf.com/wp-content/uploads/2020/05/canary-wharf-eating-drinking-shake-shack-ss20-1-710x690-1.jpg">
            <div class="modal-info">
              <p>이탈리안</p>
              <h5>반서울</h5>
              <p>서울특별시 서대문구 이화여대길 87 2F</p>
              <p>02-555-5555</p>
              <p>영업시간</p>
              <p>별점</p>
            </div>
          </div>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
        </div>

      </div>
    </div>
  </div>

</section>

   


</body>
</html>
   
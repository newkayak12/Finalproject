<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/taehui.css">
	
	
	<script>
		const moveFn=(moviePersonName)=>{
			$.ajax({
				url:"${path}/movie/moviePerson",
				data:{"moviePersonName":moviePersonName},
				success:data=>{
					let date = data["moviePersonBirth"];
					let result = date.split("-"); 
					$("#modalImage").attr("src","${applicationScope.path}/resources/upload/moviePerson/"+data["moviePersonPhoto"])
					$("#modalPersonName").html(data["moviePersonName"])
					$("#modalBirth").html("출생 : " +result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일")
					$("#modalPhilmo").html("")
					data["movies"].forEach((v,i)=>{
						$("#modalPhilmo").append($("<li>").html(v).attr("class","list-group-item col-12 small").css("max-height","40px"));
					})

				}
			});
		}
		
		
		const basicInfoShow=()=>{
			$("#movieVideo").attr("src","");
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
			$("#movieVideo").attr("src","");
			$("#basicInfocontainer").css("display","none")
			$("#trailercontainer").css("display","none")
			$("#reviewcontainer").css("display","block")
			$("#graphcontainer").css("display","none")
			$("#reviewBody").html("");
			$.ajax({
				url:"<%=request.getContextPath()%>/movie/movieReview",
				data:{"movieSeq":movieSeq},
				success:data=>{
					data.forEach((v,i)=>{
						console.log(v["movieReviewWriteDate"]);
						let date = (v["movieReviewWriteDate"]);
						let result = date.split("-");
						
						$("#reviewBody").append(
								$("<tr>").append($("<td>").html(v["userId"]["userId"]))
								.append($("<td>").html("★"+v["movieEvaluationAvg"]))
								.append($("<td>").html(v["movieReviewContent"]))
								.append($("<td>").html(result[0]+"년"+result[1]+"월"+result[2].substring(0,2)+"일"))
								.append($('<td>').append($('<button onclick="movieModal(event);" data-target="#movieReport" data-toggle="modal">')
								.attr("value",v["movieReviewSeq"]).css({"border-radius": "10px","border-color":"#e2e6ea","width":"41px","height":"31px"})
								.append($("<img>").attr("src","${path}/resources/images/user/siren.png").css("width","20px")))
										)
						
						)
					})
					
						
				}

			})
			/* $.ajax({
					url:"${path}/movie/pageBar",
					data:{"movieSeq":movieSeq},
					success:data=>{
						console.log(data);
						$("#pageBar").append(data['pageBar']);
					}
				}) */
			
		}
		const graphShow=(movieSeq)=>{
			$("#movieVideo").attr("src","");
			$.ajax({
    			url:"<%=request.getContextPath()%>/movie/movieReviewData",
    			data:{"movieSeq":movieSeq},
    			success:data=>{
    				
    				if(data['total'] !=='NaN'){
    					$("#totalPoint").html("★"+data['total']).css("font-size","40px");
    					$("#totalPoint2").html("★"+data['total']).css("font-size","40px");
    					$("#totalPoint3").html("★"+data['total']).css("font-size","40px");
    				}else{
    					$("#totalPoint").html("★0").css("font-size","30px");
    					$("#totalPoint2").html("★0").css("font-size","30px");
    					$("#totalPoint3").html("★0").css("font-size","30px");
    				}
    				new Chart($("#radar-chart"), {
    				    type: 'radar',
    				    data: {
    				      labels: ["연출", "영상미", "스토리", "연기력", "음악성"],
    				      datasets: [
    				        {
    				          label: '평균 분포',
    				          fill: true,
    				          backgroundColor: "rgba(179,181,198,0.2)",
    				          borderColor: "#6543b1",
    				          pointBorderColor: "#fff",
    				          pointBackgroundColor: "#6543b1",
    				          /* data: [10,12,13,18,20] */
    				          data : [data['directEvg'],data['visualEvg'],data['storyEvg'],data['actingEvg'],data['ostEvg']]
    				        }
    				      ]
    				    },
    				    options: {
    				      title: {
    				        
    				      }
    				    }
    				}); 
    				
    				new Chart($("#radar-chart2"), {
    				    type: 'radar',
    				    data: {
    				      labels: ["연출", "영상미", "스토리", "연기력", "음악성"],
    				      datasets: [
    				        {
    				          label: '평균 분포',
    				          fill: true,
    				          backgroundColor: "rgba(179,181,198,0.2)",
    				          borderColor: "#6543b1",
    				          pointBorderColor: "#fff",
    				          pointBackgroundColor: "#6543b1",
    				          /* data: [10,12,13,18,20] */
    				          data : [data['directEvg'],data['visualEvg'],data['storyEvg'],data['actingEvg'],data['ostEvg']]
    				        }
    				      ]
    				    },
    				    options: {
    				      title: {
    				        
    				      }
    				    }
    				}); 
    				new Chart($("#radar-chart3"), {
    				    type: 'radar',
    				    data: {
    				      labels: ["연출", "영상미", "스토리", "연기력", "음악성"],
    				      datasets: [
    				        {
    				          label: '평균 분포',
    				          fill: true,
    				          backgroundColor: "rgba(179,181,198,0.2)",
    				          borderColor: "#6543b1",
    				          pointBorderColor: "#fff",
    				          pointBackgroundColor: "#6543b1",
    				          /* data: [10,12,13,18,20] */
    				          data : [data['directEvg'],data['visualEvg'],data['storyEvg'],data['actingEvg'],data['ostEvg']]
    				        }
    				      ]
    				    },
    				    options: {
    				      title: {
    				        
    				      }
    				    }
    				}); 
    					
    			}
    		})
    		$.ajax({
    			url:"${path}/movie/genderRate",
    			data: {"movieSeq":movieSeq},
    			success:rate=>{
    				console.log(rate);
    				 console.log(rate['female'])
    				 google.charts.load('current', {'packages':['corechart']});
    			     google.charts.setOnLoadCallback(drawChart);

    			      function drawChart() {

    			        var data = google.visualization.arrayToDataTable([
    			          ['Task', 'Hours per Day'],
    			          ['남',    rate['male']],
    			          ['여',    rate['female']],
    			          
    			        ]);

    			        var options = {
    			          
    			        };

    			        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    			        var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
    			        var chart3 = new google.visualization.PieChart(document.getElementById('piechart3'));
    			        chart.draw(data, options);
    			        chart2.draw(data,options);
    			        chart3.draw(data,options);
    			      }

    			}
    			
    		})
    		
					
			
			$("#basicInfocontainer").css("display","none")
			$("#trailercontainer").css("display","none")
			$("#reviewcontainer").css("display","none")
			$("#graphcontainer").css("display","block")
			
		}
		
		const reviewWrite=(movieSeq)=>{
			location.assign("<%=request.getContextPath()%>/movie/movieWriteStart?movieSeq="+movieSeq);
		}
		
		const movieReserve=(e)=>{
			location.assign("<%=request.getContextPath()%>/movie/movieReserve?movieSeq="+e.target.value);
		}
		
		const movieModal=(e)=>{
			$.ajax({
				url : "${path}/movie/movieReviewOne",
				data : {"movieReviewSeq":e.target.value},
				success:data=>{
					console.log(data);
					$("#counterpartid").html(data['mr']['userId']['userId']);
					$("#myid").html(data['userId']);
					$("#reportSeq").html(data['mr']['movieReviewSeq'])
					$("#reportSeq").attr("value",data['mr']['movieReviewSeq']);
					$(".reportbtn").change((e)=>{
				    	
						$("#reportcategory").val($(e.target).val())
			    		  
			  	        if($(e.target).val()=='etc'){
			  	            $(".etc").show(240)
			  	        } else{
			  	            $(".etc").hide(240)
			  	        }
		  	    	}) 
				}
			})
		}
		
		const reportthis=()=>{
	  		  let content = $("#reportcategory").val()
	  		  
	  		  if(content=='etc'){
	  			content = $("#etcContent").val()  
	  		  }
	  		  console.log($("#myid").html());
	  		  console.log($("#counterpartid").html());
	  		  console.log($("#reportSeq").val());
	  		  console.log(content);
	  		  $.ajax({
	  			  url:"${path}/movie/movieReport",
	  			  data:{
	  				  "userIdShooter" : $("#myid").html() ,
	  				  "userIdTarget" : $("#counterpartid").html(),
	  				  "reportContents" : $("#reportSeq").val(),
	  				  "reportTargetContent" : content
	  				  
	  			  	},
	  			    success:data=>{
		  				$("#counterpartid").html("")
		  		    	$("#myid").html("")
		  		    	$("#etcContent").val("")
		  				$(".reportbtn").prop("checked", false)
		  				
		  				if(data>0){
		  					alert('신고가 완료되었습니다.')
		  				}
	  				}
	  		  });
		}
	
	</script>
	
	
	<section class=" pt-5">
		<div id="root" class="container mt-5">
			<section>
			   <div>
			       <div class="movie-detail">
			        <div class="title"><h3>영화상세</h3></div>
			        <div class="sect-base-movie pt-3 pb-3">
			            <div class="box-image">
			                <span class="thumb-image justify-content-center">
			                    <img class="thumb-size" src="${path }/resources/upload/movie/${movie.moviePhoto }" alt="">
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
			                        <strong>${movie.movieReserveRate }%</strong>
			                    </span><br>
			                    <span>영화평점 &nbsp;
			                        <strong>★${movie.movieTotalEvalution }</strong>
			                    </span>
			                </div>
			                <button class="btn btn-success mt-5" onclick="movieReserve(event);" value="${movie.movieSeq }">예매하기</button>
			            </div>
			        </div>
			        
			        
			         <div class="cols-content mt-3" id="menu">
			            <div class="col-detail mb-3">
			                <ul class="tab-menu pl-0 pb-3 text-center">
			                    <li><button class="btn" id="basicinfobtn" onclick="basicInfoShow()">기본정보</button></li>
			                    <li><button class="btn" id="trailerbtn" onclick="trailerShow('${movie.movieSeq}')">트레일러</button></li>
			                    <li><button class="btn" id="reviewbtn" onclick="reviewShow('${movie.movieSeq}')">관람평</button></li>
			                    <li><button class="btn" id="graphbtn" onclick="graphShow('${movie.movieSeq}')">예매분포</button></li>
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
		                    frameborder="0" allow="accelermeter; clipboard-white; encrypted-media; gyroscope; picture-in-picture" allow-script="true" allowfullscreen="true" >
                        	
                   		 </iframe>
					</div>
					<div id="reviewcontainer" class="">
						<h3 id="gwan">관람평</h3>
						<button class="btn btn-primary float-right" onclick="reviewWrite('${movie.movieSeq}');">작성하기</button>
						<table class="table">
						    <thead>
						      <tr>
						        <th class="col-2">작성자</th>
						        <th class="col-1">평점</th>
						        <th class="col-4 justify-content-center">리뷰</th>
						        <th class="col-3">작성일</th>
						        <th class="col-2">신고</th>
						      </tr >
						    </thead>
						    <tbody id="reviewBody">
							    
						    </tbody>
						  </table>
						  
					</div>
					
					<div id="graphcontainer" class="justify-content-center">
						<h3 class="ml-3">예매분포</h3>
						<div class="col-12" style="height: 300px; display: flex;">
							<div class="col-4 caru992" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>평균 별점</h5>
								<div class="mt-5" style="border: 1px solid black; height: 200px;">

									<div class="circle" style="margin: 0 auto; padding-top:30px; width: 180px; height: 180px; border-radius: 120px;line-height: 120px; background-color: lightgreen; vertical-align:20px; text-align: center;">

										<span id="totalPoint"></span>
									</div>
								</div>
							</div>
							<div class="col-4 caru991" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>평균 별점</h5>
								<div class="mt-5" style="border: 1px solid black; height: 200px;">

									<div class="circle" style="margin: 0 auto; padding-top:30px; width: 180px; height: 180px; border-radius: 120px;line-height: 120px; background-color: lightgreen; vertical-align:20px; text-align: center;">

										<span id="totalPoint2"></span>
									</div>
								</div>
							</div>
							<div class="col-4 caru723" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>평균 별점</h5>
								<div class="mt-5 pt-5" style="border: 1px solid black; height: 200px;">

									<div class="circle" style="margin: 0 auto; width: 100px; height: 100px; border-radius: 100px;line-height: 100px; background-color: lightgreen; vertical-align:20px; text-align: center;">

										<span id="totalPoint3"></span>
									</div>
								</div>
							</div>
							
							<div class="col-4 caru992" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>관람포인트</h5>
								<div class="mt-5" style="border: 1px solid black; height: 200px;">
									<canvas  id="radar-chart" width=250 height=150></canvas>
									<!-- <div class="view_point col-12" style="margin: 0 auto;  height: 200px; text-align: center;">
										<canvas  id="radar-chart" width=250 height=165></canvas>
									</div> -->
								</div>
							</div>
							<div class="col-4 caru991" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>관람포인트</h5>
								<div class="mt-5" style="border: 1px solid black; height: 200px;">
									<canvas  id="radar-chart2" width=250 height=230></canvas>
									<!-- <div class="view_point col-12" style="margin: 0 auto;  height: 200px; text-align: center;">
										<canvas  id="radar-chart" width=250 height=165></canvas>
									</div> -->
								</div>
							</div>
							<div class="col-4 caru723" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>관람포인트</h5>
								<div class="mt-5  pt-5" style="border: 1px solid black; height: 200px;">
									<canvas  id="radar-chart3" width=250 height=230></canvas>
									<!-- <div class="view_point col-12" style="margin: 0 auto;  height: 200px; text-align: center;">
										<canvas  id="radar-chart" width=250 height=165></canvas>
									</div> -->
								</div>
							</div>
							<div class="col-4 caru992" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>예매성비</h5>
								<div class="mt-5 col-12" style="border: 1px solid black; width:100% height: 200px;" id="piechart">
									

								</div>
							</div>
							<div class="col-4 caru991" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>예매성비</h5>
								<div class="mt-5 col-12" style="border: 1px solid black; width:100% height: 200px;" id="piechart2">
									

								</div>
							</div>
							<div class="col-4 caru723" style="border: 1px solid black; height: 300px; display: inline-block;">
								<h5>예매성비</h5>
								<div class="mt-5" style="border: 1px solid black; width:100% height: 200px;" id="piechart3">
									

								</div>
							</div>
						</div>
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
			  
			   <section>
			   		<div class="modal" id="movieReport">
				    <div class="modal-dialog ">
				      <div class="modal-content">
				
				    <div class="modal-header">
				          <h4 class="modal-title bgColorMainColor">신고하기</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				
				        <div class="modal-body">
				          
				          <table class="table-striped table table-bordered table-sm col-12">
				          	  <input type="hidden" id= "reportSeq">
				          	  <input type="hidden" id= "reportcategory">
				              <tr >
				                  <th style="width:30%" class="text-center p-0" >신고할 아이디</th>
				                  <td colspan="3" class="p-0 text-center"id="counterpartid"></td>
				              </tr>
				              <tr>
				                  <th style="width:30%" class="text-center p-0" >신고하는 아이디</th>
				                  <td colspan="3" class="p-0 text-center" id="myid"></td>
				              </tr>
				              
				              <!-- <tr > -->
				                <th style="width:30%; vertical-align:middle;" rowspan="6" class="text-center p-0">
				                    신고 항목
				                </th>
				                  <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
				                      <label class="small">
				                          <input type="radio" name="report" value="language"  class="reportbtn" > 부적절한 언어 사용
				                      </label>
				                  </td>
				                </tr>
				                <tr>
				                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
				                        <label class="small">
				                            <input type="radio" name="report" value="advertisement" class="reportbtn"> 광고성 게시글
				                        </label>
				                    </td>
				                </tr>
				                <tr>
				                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
				                        <label class="small">
				                            <input type="radio" name="report" value="imposter" class="reportbtn"> 타인을 사칭합니다.
				                        </label>
				                    </td>
				                </tr>
				                <tr>
				                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
				                        <label class="small">
				                            <input type="radio" name="report" value="profilePhoto" class="reportbtn"> 부적절한 프로필 사진 
				                        </label>
				                    </td>
				                </tr>
				                <tr>
				                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
				                        <label class="small">
				                            <input type="radio" name="report" value="feed" class="reportbtn"> 부적절한 게시글 사진 및 내용
				                        </label>
				                    </td>
				                </tr>
				                <tr>
				                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
				                        <label class="small">
				                            <input type="radio" name="report" value="etc" class="reportbtn"> 기타
				                        </label>
				                    </td>
				                </tr>
				                   
				
				              <tr class="etc" style="display: none;">
				                  <th colspan="4" class="pl-4">기타 내용</th>
				              </tr>
				              <tr class="etc" style="display: none;">
				                <td colspan="4" class="text-center p-0">
								<textarea cols="45" rows="3" id="etcContent"></textarea>
				                </td>
				              </tr>
				          
				          
				          </table>
				        </div>
				
				        <div class="modal-footer">
				          <button type="button" class="cancelBtn" data-dismiss="modal">닫기</button>
				          <button type="button" class="checkBtn" data-dismiss="modal" onclick="reportthis();">신고하기</button>
				        </div>
				  
				      </div>
				    </div>
				  </div>
			   </section>
		</div>
	</section>	


<style>
     #root{
	    /* min-height:500px; */
	    font-family:'Noto Sans KR';
	}
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
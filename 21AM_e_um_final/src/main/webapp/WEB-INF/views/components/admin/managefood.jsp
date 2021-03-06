<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      
			$(function(){
				
				 chart() 
			})      
      
      
	     function chart(){
    	  let dat = '${price_star}';
    	  let content = JSON.parse(dat)
    	  console.log("table")
    	  console.log(content)
    	  let string = [];
    	  string.push(['price','star'])
    	  
	         content.forEach((v,i)=>{
	        	 console.log(v)
	 	 				string.push(v)
	         })
	         
	         
         let ldat = '${like_star}'
         let lcontent = JSON.parse(ldat)
         let string2 = [];
         string2.push(['like','star']);
         
         lcontent.forEach((v,i)=>{
        	 string2.push(v)
         })
	     
	       console.log(string2)
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart1);
	      google.charts.setOnLoadCallback(drawChart2);
		
		      function drawChart1() {
		        var data = google.visualization.arrayToDataTable(string
		         );
		        
		        
				
		         console.log(data)
		        var options = {
		          title: 'price-star graph',
		          hAxis: {title: 'price', minValue: 0, maxValue: 60000},
		          vAxis: {title: 'star', minValue: 0, maxValue: 5.0},
		          legend: 'none',
		          pointShape: 'star',
		          pointSize: 10,
		          animation: {
		            duration: 300,
		            easing: 'inAndOut',
		          }
		        };
	
	        var chart = new google.visualization.ScatterChart(document.getElementById('price_star'));
	
	        chart.draw(data, options);
	      }
		      function drawChart2() {
			        var data = google.visualization.arrayToDataTable(string2
			         );
			        
			        
					
			         console.log(data)
			        var options = {
			          title: 'like-star graph',
			          hAxis: {title: 'like', minValue: 0, maxValue: ${likeMaximum}},
			          vAxis: {title: 'star', minValue: 0, maxValue: 5.0},
			          legend: 'none',
			          pointShape: 'star',
			          pointSize: 10,
			          animation: {
			            duration: 300,
			            easing: 'inAndOut',
			          }
			        };
		
		        var chart = new google.visualization.ScatterChart(document.getElementById('like_star'));
		
		        chart.draw(data, options);
		      }
		     
      } 
</script>

<div class="d-flex flex-column justify-content-between align-itmes-center" id="manageFoodDiv">
	<div style="height: 650px" class="d-flex flex-column  align-items-center">
	
		<div class="d-flex justify-content-around">
			<span id="price_star"></span>
			<span id="like_star"></span>
		</div>
	
		<table class="table table-striped table-hover">
		
			<tr>
				<th class="bgColorMainColorSub whiteText">
					?????????
				</th>
				<th class="bgColorMainColorSub whiteText">
					?????????
				</th>
				<th class="bgColorMainColorSub whiteText">
					??????
				</th>
				<th class="bgColorMainColorSub whiteText">
					??????
				</th>
				<th class="bgColorMainColorSub whiteText">
					??????
				</th>
				<th class="bgColorMainColorSub whiteText">
					????????? ???
				</th>
				<th class="bgColorMainColorSub whiteText">
					??????
				</th>
				<th class="bgColorMainColorSub whiteText">
					??????
				</th>
				<th class="bgColorMainColorSub whiteText">
					????????????
				</th>
			</tr>
			
			<c:if test="${list.size()>0}">
				<c:forEach items="${list }" var="i">
					<tr>
						<td>${i.foodCategoryMain }</td>
						<td>${i.foodCategorySub }</td>
						<td>${i.foodName }</td>
						<td>${i.foodAddr }</td>
						<td>${i.foodStar }</td>
						<td>${i.foodLikeCount }</td>
						
						<td id="block${i.foodSeq }">
							<input type="hidden" id="B${i.foodSeq}" value="${i.foodStatus }">
								<c:choose>
									<c:when test="${i.foodStatus=='unblock' }">
										??????
									</c:when>
									<c:otherwise>
										??????
									</c:otherwise>
								</c:choose>
						</td>
						
						<td class="text-center">
							<c:choose>
								<c:when test="${i.foodStatus=='unblock' }">
									<input type="button" class="btn cancelBtn" onclick="blockThisId('${i.foodSeq}')" id="btn${i.foodSeq}" value="??????">
								</c:when>
								<c:otherwise>
									<input type="button" class="btn checkBtn" onclick="blockThisId('${i.foodSeq}')" id="btn${i.foodSeq}" value="?????????">
								</c:otherwise>
							</c:choose>
						</td>
						
						<td class="text-center">
							<input type="button" class="btn checkBtn" onclick="updateFood('${i.foodSeq}');" value="??????">
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="8" class="text-center">????????? ????????????.</td>
				</tr>
			</c:if>
			
		</table>
		
	</div>
	
	<c:if test="${list.size()>0}">
		<div id="mf_pageBar" class="mt-5">${pageBar }</div>
	</c:if>
	
</div>

<script>

	const updateFood = (foodSeq)=> {
		$.ajax({
			url : "${ pageContext.request.contextPath }/admin/updatefood/start",
			data : {
				"foodSeq" : foodSeq	
			},
			success: data => {
				$("#mf_pageBar").css("display", "none");
				
				$("#manageFoodDiv").html("");
				$("#manageFoodDiv").attr("class", "");
				
				$("#title").html("????????? ?????? ??????")
				$("#manageFoodDiv").html(data)
			}
		})
	}


	function blockThisId(seq){
		
		if($("#B"+seq).val()=='unblock'){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/blockfood",
				data:{"foodSeq":seq},
				success:data=>{
					if(data>0){
						$("#block"+seq).html("??????")
						$("#btn"+seq).val("??????")
					}	
				}
			})
			
			
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/unblockfood",
				data:{"foodSeq":seq},
				success:data=>{
					if(data>0){
						$("#block"+seq).html("??????")
						$("#btn"+seq).val("??????")
					}
				}
				
			})
			
			
		}
		
		
	}
</script>
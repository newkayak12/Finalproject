<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="d-flex flex-column justify-content-between align-itmes-center">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function(){
		chart()
		
	})
	
     function chart(){
    	 google.charts.load('current', {'packages':['corechart']});
         google.charts.setOnLoadCallback(drawChart1);
         google.charts.setOnLoadCallback(drawChart2);

         function drawChart1() {

           var data = google.visualization.arrayToDataTable([
             ['성별', '사이트 내 성별 분포'],
             ['남',     ${men}],
             ['여',      ${women}]
           ]);

           var options = {
             title: '사이트 내 성별 분포',
	          is3D: true,
           };

           var chart = new google.visualization.PieChart(document.getElementById('genderRatio'));

           chart.draw(data, options);
         }
         
         
         function drawChart2() {
 	        var data = google.visualization.arrayToDataTable([
 	          ['지역', '지역별 분포도'],
 	          ['서울',    parseInt(${seoul})],
 	          ['부산',	 parseInt(${pusan})],
 	          ['대구',   parseInt( ${daegu})],
 	          ['인천', 	 parseInt(${incheon})],
 	          ['광주',    parseInt(${gwangju})],
 	          ['대전',    parseInt(${daejeon})],
 	          ['울산',   parseInt( ${ulsan})],
 	          ['경기',    parseInt(${gyeongi})],
 	          ['강원',   parseInt( ${gangwon})],
 	          ['충북',   parseInt( ${chungbuk})],
 	          ['충남',   parseInt( ${chungnam})],
 	          ['전북',   parseInt( ${jeonbuk})],
 	          ['전남',   parseInt( ${jeonnam})],
 	          ['경북',   parseInt( ${gyeongbuk})],
 	          ['경남',    parseInt(${gyeongnam})],
 	          ['제주',   parseInt( ${jeju})]
 	        ]);

 	        var options = {
 	          title: '지역별 분포도',
 	          is3D: true,
 	        };

 	        var chart = new google.visualization.PieChart(document.getElementById('locationRatio'));
 	        chart.draw(data, options);
 	      }
     }
	
	
	
	
	
    </script>



	<div style="height: 650px" class="mt-3 d-flex flex-column justify-content-around align-items-center">
	
		<div class="m-3 d-flex justify-content-around mt-5">
			<span id="genderRatio">
			
			</span>
			<span id="locationRatio">
			
			</span>
		</div> 
	
		<table class="table table-striped table-hover tway">
			<tr>
				<th class="bgColorMainColorSub whiteText">
					아이디
				</th>
				<th class="bgColorMainColorSub whiteText">
					이름
				</th>
				<th class="bgColorMainColorSub whiteText">
					별명
				</th>
				<th class="bgColorMainColorSub whiteText">
					이메일
				</th>
				<th class="bgColorMainColorSub whiteText">
					성별
				</th>
				<th class="bgColorMainColorSub whiteText">
					가입일
				</th>
				<th class="bgColorMainColorSub whiteText">
					신고당한 횟수 
				</th>
				<th class="bgColorMainColorSub whiteText">
					계정 상태
				</th>
				<th class="bgColorMainColorSub whiteText">
					정지
				</th>
			</tr>
			
			<c:if test="${list.size()>0}">
			<c:forEach items="${list }" var="i">
				<tr>
					<td>${i.userId }</td>
					<td>${i.userName }</td>
					<td>${i.userNick }</td>
					<td>${i.userEmail }</td>
					<td>${i.userGender }</td>
					<td><fmt:formatDate value="${i.userDate }" pattern="yy-MM-dd" /></td>
					<td>${i.userReportCount }</td>
					<input type="hidden" id="B${i.userId }" value="${i.userBlock }">
					<td id="block${i.userId }">
						<c:choose>
							<c:when test="${i.userBlock=='unblock' }">
								계정 활성화
							</c:when>
							<c:otherwise>
								계정 정지
							</c:otherwise>
						</c:choose>
					</td>
					<td class="text-center" >
					<c:choose>
							<c:when test="${i.userBlock=='unblock' }">
								<input type="button" onclick="blockThisId('${i.userId}')" id="btn${i.userId}" value="계정 정지">
							</c:when>
							<c:otherwise>
								<input type="button" onclick="blockThisId('${i.userId}')" id="btn${i.userId}" value="활성화">
							</c:otherwise>
						</c:choose>
						
					</td>
					
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${list.size()==0}">
				<tr>
					<td colspan="9" class="text-center">
						내용이 없습니다.
					</td>
				</tr>
			</c:if>
		</table>
		
		<c:if test="${list.size()>0}">
		<div>${pageBar }</div>
		</c:if>
	</div>



<script>

	function blockThisId(userId){
		
		if($("#B"+userId).val()=='unblock'){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/blockuser",
				data:{"userId":userId},
				success:data=>{
					if(data>0){
						$("#block"+userId).html("계정 정지")
						$("#B"+userId).val("blind")
						$("#btn"+userId).val("활성화")
					}	
				}
			})
			
			
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/unblockuser",
				data:{"userId":userId},
				success:data=>{
					if(data>0){
						$("#block"+userId).html("계정 활성화")
						$("#B"+userId).val("unblock")
						$("#btn"+userId).val("계정 정지")
					}
				}
				
			})
			
			
		}
		
		
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="d-flex flex-column justify-content-between align-itmes-center">

<%-- ${list } --%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
$(function(){
	chart()
})
      function chart(){
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart1);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
      
      function drawChart1() {

	          var data = google.visualization.arrayToDataTable([
	            ['연령', '소모임 연령 제한 분포'],
	            ['전연령',     ${ageList[0]}],
	            ['20대',      ${ageList[1]}],
	            ['30대',      ${ageList[2]}],
	            ['40대',      ${ageList[3]}]
	          ]);
	
	          var options = {
	            title: '소모임 연령 제한 분포',
		          is3D: true,
		          
	          };
	
	          var chart = new google.visualization.PieChart(document.getElementById('ageList'));
	
	          chart.draw(data, options);
	        }
	      function drawChart2() {
	
	          var data = google.visualization.arrayToDataTable([
	            ['성별', '소모임 성별 제한 분포'],
	            ['제한 없음',     ${genderList[0]}],
	            ['남성만',      ${genderList[1]}],
	            ['여성만',      ${genderList[2]}]
	          ]);
	
	          var options = {
	            title: '소모임 성별 제한 분포',
		          is3D: true,
	          };
	
	          var chart = new google.visualization.PieChart(document.getElementById('genderList'));
	
	          chart.draw(data, options);
	        }
	      function drawChart3() {
	
	          var data = google.visualization.arrayToDataTable([
	            ['주제', '소모임 주제 분포'],
	            ['게임',     ${themeList[0]}],
	            ['운동',      ${themeList[1]}],
	            ['요리',      ${themeList[2]}],
	            ['영화',      ${themeList[3]}],
	            ['맛집',      ${themeList[4]}],
	            ['독서',      ${themeList[5]}],
	            ['쇼핑',      ${themeList[6]}],
	            ['코딩',      ${themeList[7]}]
	          ]);
	
	          var options = {
	            title: '소모임 주제 분포',
		          is3D: true,
	          };
	
	          var chart = new google.visualization.PieChart(document.getElementById('themeList'));
	
	          chart.draw(data, options);
	        }
	      }
</script>
	<div style="height: 550px">
		<div class="d-flex justify-content-around">
			<span id="ageList">
			</span>
			<span id="genderList">
			</span>
			<span id="themeList">
			</span>
		
		</div>
		<table class="table table-striped table-hover" >
			<tr>
				<th class="bgColorMainColorSub whiteText">
					이름
				</th>
				<th class="bgColorMainColorSub whiteText">
					주제
				</th>
				<th class="bgColorMainColorSub whiteText">
					소모임장
				</th>
				<th class="bgColorMainColorSub whiteText">
					최대인원
				</th>
				<th class="bgColorMainColorSub whiteText">
					성별
				</th>
				<th class="bgColorMainColorSub whiteText">
					연령제한
				</th>
				<th class="bgColorMainColorSub whiteText">
					내용
				</th>
				<th class="bgColorMainColorSub whiteText">
					오늘의 방문자 수
				</th>
				<th class="bgColorMainColorSub whiteText">
					누적 방문자 수
				</th>
				<th class="bgColorMainColorSub whiteText">
					개설일
				
				</th>
				<th class="bgColorMainColorSub whiteText">
					상태
				</th>
				<th class="bgColorMainColorSub whiteText">
					폐쇄
				</th>
			</tr>
			
			<c:if test="${list.size()>0}">
			<c:forEach items="${list }" var="i">
				<tr>
					<td>${i.groupTitle }</td>
					<td>${i.groupTheme }</td>
					<td>${i.groupMaster }</td>
					<td>${i.groupLimit }</td>
					<td>${i.groupGender }</td>
					<td>${i.groupAge }</td>
					<td style="overflow: hidden">${i.groupComment }</td>
					<td>${i.groupCountToday }</td>
					<td>${i.groupCountTotal }</td>
					<td><fmt:formatDate value="${i.groupDate }" pattern="yy-MM-dd" /></td>
					
					
					
					<input type="hidden" id="B${i.groupSeq}" value="${i.groupDestroyFlag }">
					<td id="block${i.groupSeq }" class="small">
						<c:choose>
							<c:when test="${i.groupDestroyFlag=='exist' }">
								활성화
							</c:when>
							<c:otherwise>
								폐쇄
							</c:otherwise>
						</c:choose>
					</td>
					<td class="text-center" >
					<c:choose>
							<c:when test="${i.groupDestroyFlag=='exist' }">
								<input type="button" class="small" onclick="blockThisId('${i.groupSeq}')" id="btn${i.groupSeq}" value="폐쇄">
							</c:when>
							<c:otherwise>
								<input type="button" class="small" onclick="blockThisId('${i.groupSeq}')" id="btn${i.groupSeq}" value="활성화">
							</c:otherwise>
						</c:choose>
						
					</td>
					
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${list.size()==0}">
				<tr>
					<td class="text-center" colspan="8">
						내용이 없습니다.
					</td>
				</tr>
			</c:if>
		</table>
	</div>

	<c:if test="${list.size()>0}">
	<div>${pageBar }</div>
	</c:if>
</div>

<script>

	function blockThisId(seq){
		if($("#B"+seq).val()=='exist'){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/blindgroup",
				data:{"groupSeq":seq},
				success:data=>{
					if(data>0){
						$("#block"+seq).html("폐쇄")
						$("#B"+seq).val("blind")
						$("#btn"+seq).val("활성화")
					}	
				}
			})
			
			
		} else if($("#B"+seq).val()=='blind'){
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/unblindgroup",
				data:{"groupSeq":seq},
				success:data=>{
					if(data>0){
						$("#block"+seq).html("활성화")
						$("#B"+seq).val("exist")
						$("#btn"+seq).val("폐쇄")
					}
				}
				
			})
			
			
		}
		/* manageGroup('1') */
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/woosik.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
    
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
   <h1 class="mainColor tway w_tit" style="font-size:35px; left;">소모임 만들기</h1>
      <form name="gorupCreateFrm" action="${path }/group/Gomain.do"
      method="post" enctype="multipart/form-data">
      	<div class="form-group">
	      	<label class="w_input_tit">제목</label>
	      	<input type="text" class="form-control w_input_txt" id="gorup-title" placeholder="제목입력" name="title">
      	</div>
      	
      	<div class="form-group">
	      	<label class="w_input_tit">카테고리</label>
	      	<select class="form-control w_input_txt" id="group-category" name="category">
	      		<option>게임</option>
	      		<option>요리</option>
	      		<option>운동</option>
	      		<option>코딩</option>
	      		<option>맛집</option>
	      		<option>영화</option>
	      		<option>쇼핑</option>
	      		<option>독서</option>
	      		
	      	</select>
      	</div>
      	
      	<div class="form-group">
	      	<label class="w_input_tit">인원수</label>
	      	<select class="form-control w_input_txt" id="group-personnel" name="personnel">
	      		<option>2</option>
	      		<option>3</option>
	      		<option>5</option>
	      		<option>6</option>
	      		<option>7</option>
	      		<option>8</option>
	      		<option>9</option>
	      		<option>10</option>
	      		<option>11</option>
	      		<option>12</option>
	      		<option>13</option>
	      		<option>14</option>
	      		<option>15</option>
	      		<option>16</option>
	      		<option>17</option>
	      		<option>18</option>
	      		<option>19</option>
	      		<option>20</option>
	      		
	      		
	      	</select>
      	</div>
      	
      	<label class="w_input_tit">연령제한</label>
      	<div class="form-check">
      		<label class="form-check-label">
      			<!-- input의 class="form-check-input" 지움 -->
      			<input type="radio" id="group-age-all" name="age" value="ageall" checked>무관
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" id="group-age-20" name="age" value="age20" >20대
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" id="group-age-30" name="age" value="age30" >30대
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" id="group-age-40" name="age" value="age40" >40대
      		</label>
      	</div>
      	
      	<label class="w_input_tit">성별</label>
      	<div class="form-check">
      		<label class="form-check-label">
      			<input type="radio" id="group-gender-all" name="gender" value="all" checked>무관
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" id="group-gender-men" name="gender" value="M">남자
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" id="group-gender-women" name="gender" value="F">여자
      		</label>
      	</div>
      	
      	<div class="form-group">
      		<label class="w_input_tit">내용</label>
      		<textarea class="w_input_txt form-control" rows="10" id="group-comments" name="comments" placeholder="내용 입력"></textarea>
      	</div>
      	
      	<div class="form">
      		<label class="w_input_tit">대표사진</label>
      		<input type="file" class="form-control-file border w_input_txt" name="file">
      	</div>
      	
      	<div class="w_submit_btn">
	      	<button type="submit" class="btn checkBtn mb-1">생성</button>
	      	<button type="button" class="btn cancelBtn"onclick="history.go(-1)">취소</button>
      	</div>
      </form>
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
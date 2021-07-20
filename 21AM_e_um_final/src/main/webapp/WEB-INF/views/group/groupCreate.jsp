<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    
    
<section class="mt-5 pt-5">
   <div id="root" class="container mt-5">
   <h1 style="text-align:left;">소모임 만들기</h1>
      <form name="gorupCreateFrm" action="${path }/group/Gomain.do"
      method="post" enctype="multipart/form-data">
      	<div class="form-group">
	      	<label>제목</label>
	      	<input type="text" class="form-control" id="gorup-title" placeholder="제목입력" name="title">
      	</div>
      	
      	<div class="form-group">
	      	<label>카테고리</label>
	      	<select class="form-control" id="group-category" name="category">
	      		<option>게임</option>
	      		<option>요리</option>
	      		<option>운동</option>
	      	</select>
      	</div>
      	
      	<div class="form-group">
	      	<label>인원수</label>
	      	<select class="form-control" id="group-personnel" name="personnel">
	      		<option>2</option>
	      		<option>3</option>
	      		<option>5</option>
	      		<option>6</option>
	      		<option>7</option>
	      		<option>8</option>
	      		<option>9</option>
	      		<option>10</option>
	      	</select>
      	</div>
      	
      	<label>연령제한</label>
      	<div class="form-check">
      		<label class="form-check-label">
      			<input type="radio" class="form-check-input" id="group-age-all" name="age" value="ageall" checked>무관
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" class="form-check-input" id="group-age-20" name="age" value="age20" >20대
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" class="form-check-input" id="group-age-30" name="age" value="age30" >30대
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" class="form-check-input" id="group-age-40" name="age" value="age40" >40대
      		</label>
      	</div>
      	
      	<label>성별</label>
      	<div class="form-check">
      		<label class="form-check-label">
      			<input type="radio" class="form-check-input" id="group-gender-all" name="gender" value="genderall" checked>무관
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" class="form-check-input" id="group-gender-men" name="gender" value="gendermen">남자
      		</label>
      		
      		<label class="form-check-label">
      			<input type="radio" class="form-check-input" id="group-gender-women" name="gender" value="genderwomen">여자
      		</label>
      	</div>
      	
      	<div class="form-group">
      		<label>내용</label>
      		<textarea class="form-control" rows="10" id="group-comments" name="comments" placeholder="내용 입력"></textarea>
      	</div>
      	
      	<div class="form">
      		<label>대표사진</label>
      		<input type="file" class="form-control-file border" name="file">
      	</div>
      	<br><br><br>
      	
      	<button type="submit" class="btn btn-primary">
      	생성
      	</button>
      	<button type="button" class="btn btn-secondary"
      		onclick="history.go(-1)">취소</button>
      </form>
   </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
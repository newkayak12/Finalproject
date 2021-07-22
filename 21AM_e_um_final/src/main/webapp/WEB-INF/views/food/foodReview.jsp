<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	
</style>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<div class="foodReviewForm-container">
	
			<div><span class="foodReviewForm-foodName"><c:out value="${ food.foodName }"/></span> 에 대한 솔직한 리뷰를 작성해주세요</div>
			<form action="${ path }/food/foodReview/end?foodSeq=${ food.foodSeq }" method="post">
				<p>별점이미지들어갈부분</p>
				<textarea id="DOC_TEXT" name="foodContents" class="foodReviewForm-textarea" rows="13"></textarea>
				<div style="color:#aaa;" id="counter">(0 / 300)</div>
				<br>
				<ul style="list-style:none;">
					<li>
						<label class="input-file-button" for="input-file">
						+
						</label>
						<input type="file" id="input-file" multiple="multiple" style="display:none;"/> 
					</li>
					<li>rf</li>
					<li>f</li>
					<li>f</li>
					<li>f</li>
				</ul>
				
				<button class="btn btn-eum border-eum textcolor-eum" onclick="">취소</button>
				<input type="submit" value="리뷰 등록" class="btn btn-eum bgcolor-eum">
			</form>
			
		</div>
		
	</div>
</section>

<script>

	$(document).ready(function() {
		$("#DOC_TEXT").on("keyup", function() {
			$("#counter").html("("+$(this).val().length+" / 300)");
	 			if($(this).val().length > 300) {	
	 				alert("최대 300자까지 입력 가능합니다.");
					$(this).val($(this).val().substring(0, 300));
					$("#counter").html("(300 / 300)");
			}
		});
	});

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
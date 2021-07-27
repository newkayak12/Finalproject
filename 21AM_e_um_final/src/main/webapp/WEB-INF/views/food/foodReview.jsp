<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
.foodReviewForm-container {
		text-align: center;
	}
	
	.foodReviewForm-input {
		border : 1px solid #70b3d9;
		width: 70%;
    	margin-left: 15%;
    	margin-right: 15%;
	}
	
	.foodReviewForm-input textarea, .foodReviewForm-input textarea:focus {
		outline : none;
		border : 0;
	}
	
	.foodReviewForm-foodName {
		font-weight: 900;
		font-size: 40px;
		color: #70b3d9;
	}
	
	.btn-eum {
		height: 40px;
        width: 6100x;
	}
	
	.bgcolor-eum {
        background-color: #70b3d9;
	}
	
	.border-eum {
		border : 1px solid #70b3d9;	
	}
	
	.textcolor-eum {
		color: #70b3d9;
	}
	
	.input-file-button{
		padding: 50px 50px 50px 50px;
		background-color: white;
		border-radius: 5px;
		color: #70b3d9;
		cursor: pointer;
		border : 1px dashed #70b3d9;
	}
	
	.foodReviewForm-container ul li {
		display: inline-block;
        margin-left: 10px;
        margin-right: 10px;
	}
	/* 별점 */	
	.star-rating {
            display: flex;
            flex-direction: row-reverse;
            font-size: 40px;
            justify-content: space-around;
            padding: 0 0 0 0;
            text-align: center;
            width: 5em;
        }
        
        .star-rating input {
            display: none;
        }
        
        .star-rating label {
            opacity: 95%;
            color: gray;
            cursor: pointer;
        }
        
        .star-rating :checked ~ label {
            color : rgb(255, 217, 0);
        }
        
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color : #ffea00;
        }	
</style>


<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<div class="foodReviewForm-container">
	
			<div><span class="foodReviewForm-foodName"><c:out value="${ food.foodName }"/></span> 에 대한 솔직한 리뷰를 작성해주세요</div>
			<form action="${ path }/food/foodReview/end?foodSeq=${ food.foodSeq }" method="post">
				
				
				<div class="foodReviewForm-input" >
					<div id="star" class="star-rating space-x-4 mx-auto">
				        <input type="radio" id="5-stars" name="rating" value="5"/> 
				        <label for="5-stars" class="star pr-4">★</label>
				
				        <input type="radio" id="4-stars" name="rating" value="4"/>
				        <label for="4-stars" class="star">★</label>
				
				        <input type="radio" id="3-stars" name="rating" value="3" />
				        <label for="3-stars" class="star">★</label>
				
				        <input type="radio" id="2-stars" name="rating" value="2"/>
				        <label for="2-stars" class="star">★</label>
				
				        <input type="radio" id="1-star" name="rating" value="1" checked/>
				        <label for="1-star" class="star">★</label>
				    </div>
					<textarea id="DOC_TEXT" name="foodContents" cols="85" rows="13"></textarea>
				</div>
				
				<div style="color:#aaa;" id="counter">(0 / 300)</div>
				<br>
				<ul class="p-0" style="list-style:none;">
					<li>
						<label class="input-file-button" for="input-file">+</label>
						<input class="foodReviewFileUpload" type="file" id="input-file" multiple="multiple" style="display:none;"/> 
					</li>
					<!-- 
					<li></li>
					<li></li>
					<li></li>
					<li></li> 
					-->
				</ul>
				
				<button class="btn btn-eum border-eum textcolor-eum" onclick="">취소</button>
				<input type="submit" value="리뷰 등록" class="btn btn-eum bgcolor-eum">
			</form>
			
		</div>
		
	</div>
</section>

<script>

	// 파일 업로드 미리보기 
	$(".foodReviewFileUpload").change( (e) => {
		
				console.log($(e.target).get(0).val());
		
		let fileName = $(e.target).val().split("\\").pop();
				console.log(fileName);
				
		let filesLength = $(e.target).files.length;
				console.log(filesLength);
		
			
		// let fileArr = new Array();
		
		/* for(let i=0; i < $(e.target).files.length; i++) {
			
		} */
		
		
	} );

	// 리뷰 입력창 글자수 카운트 
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
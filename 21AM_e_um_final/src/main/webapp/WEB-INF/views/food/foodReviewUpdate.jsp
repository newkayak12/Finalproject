<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
.foodReviewForm-container { text-align: center; }
.foodReviewForm-input { border : 2px solid black; width: 70%; margin-left: 15%; margin-right: 15%; border-radius : 10px; }
.foodReviewForm-input textarea, .foodReviewForm-input textarea:focus { outline : none; border : 0; border-radius : 10px; }
.btn-eum { height: 40px; width: 6100x; }
.bgcolor-eum { background-color: #70b3d9; }
.border-eum { border : 1px solid #70b3d9; }
.textcolor-eum { color: #70b3d9; }
.input-file-button{ padding: 34px 37px; background-color: white; border-radius: 10px; color: lightgray; cursor: pointer; border : 2px dashed lightgray; }
.foodReviewForm-container ul li { display: inline-block; margin-left: 10px; margin-right: 10px; }
/* 별점 */	
.star-rating { display: flex; flex-direction: row-reverse; font-size: 40px; justify-content: space-around; padding: 0 0 0 0; text-align: center; width: 5em; }
.star-rating input { display: none; }
.star-rating label { opacity: 95%; color: lightgray; cursor: pointer; }
.star-rating :checked ~ label { color : #2AC1BC; }
.star-rating label:hover, .star-rating label:hover ~ label { color : #7ee3e0; }

</style>


<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
	
		<div class="foodReviewForm-container">
	
			<div><span class="mainColor tway" style="font-size:40px;"><c:out value="${ fc.food.foodName }"/></span><span class="blackText" style="font-weight:900;"> 에 대한 솔직한 리뷰를 작성해주세요</span></div>
			
			<form action="${ pageContext.request.contextPath }/food/updateFoodComment/end?foodCommentSeq=${ fc.foodCommentSeq }" method="post" enctype="multipart/form-data">
				
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
				
				        <input type="radio" id="1-stars" name="rating" value="1"/>
				        <label for="1-star" class="star">★</label>
				    </div>
					<textarea id="DOC_TEXT" name="foodCommentContents" style="width:90%;"  rows="13" required>
${fc.foodCommentContents}	
					</textarea>
					<input type="hidden" name="foodSeq" value="${ fc.food.foodSeq }">
				</div>
				
				<div style="color:#aaa;" id="counter">(0 / 300)</div>
				<br>
				<p>* 수정 이전의 파일은 저장되지 않으므로 파일을 다시 선택해주세요 *</p>
				<ul id="foodReviewFilePreview" class="p-0 d-flex justify-content-center" style="list-style:none;">
					<li class="">
						<label class="input-file-button" for="input-file" id="input-file-label"><i class="fas fa-plus" style="font-size:30px;"></i></label>
						<input class="foodReviewFileUpload" type="file" accept="image/jpeg, image/jpg, image/png" name="file" id="input-file" multiple="multiple" style="display:none;"/> 
					</li>
				</ul>
				
				<button type="button" class="btn cancelBtn" onclick="location.assign('${pageContext.request.contextPath}/food/foodView?foodSeq=${ food.foodSeq }')" style="width : 90px !important;">돌아가기</button>
				<input type="submit" value="리뷰 등록" class="btn checkBtn ml-3" style="width : 90px !important;">
			</form>
			
		</div>
		
	</div>
</section>

<script>

	// 리뷰 수정
	$(function() {
		// 별점대로 체크되어있게 
 		getStar();
		
		// 리뷰 파일 불러와져있어서 미리보기되어있게 ( 일단 제거한 기능 )
		// getFiles();
	});


	function getStar(){
		let i = Math.floor(${fc.foodCommentStar});
			console.log(i);
		$('#'+i+'-stars').attr("checked", true);
		// i는 자바스크립트 변수이기 때문에 이렇게 쓰는게 맞는 것 같다. 
	}

	/* function getFiles() {
		let files = new Array();
		// 사용자가 리뷰등록할때 업로드한 파일 개수만큼 
		if("${fc.foodPhoto1}" != "") { files.push("${fc.foodPhoto1}"); } 
		if("${fc.foodPhoto2}" != "") { files.push("${fc.foodPhoto2}"); } 
		if("${fc.foodPhoto3}" != "") { files.push("${fc.foodPhoto3}"); } 
		if("${fc.foodPhoto4}" != "") { files.push("${fc.foodPhoto4}"); } 
		if("${fc.foodPhoto5}" != "") { files.push("${fc.foodPhoto5}"); } 
		
		console.log(files);
		
		$("#input-file").files(files);
		
		console.log( $("#input-file").files() );
		
		for(let i=0; i < files.length; i++) {
			let li = $("<li class='prevLi' onmouseenter='fn_showDelBtn(event);' onmouseleave='fn_hideDelBtn(event);'>");
			
			let outterDiv = $("<div>").attr({
				"class" : "outterDiv"
			}).css({
				"background-image" : "url( ${path}/resources/upload/foodComment/" + files[i] + ")",
				"width" : "100px",
				"height" : "100px", 
				"background-size" : "contain", 
				"border-radius" : "10px"
			}); 
			
			let innerDiv = $("<div>").attr({
				"class" : "innerDiv"
			}).css({
				"display" : "none", 
				"width" : "100%", 
				"height" : "100%", 
				"background-color" : "rgba(0, 0, 0, 0.5)",
				"border-radius" : "10px"
			}).append( $("<button>").attr({"onclick":"fn_delImg(event);", "type":"button"}).css({"border": "0px","background-color": "transparent", "color":"white", "padding":"35px", "outline":"0"}).html("<i class='fas fa-times' style='font-size:30px;'></i>")  );
			
			outterDiv.append(innerDiv);
			li.append(outterDiv);
			
			$("#foodReviewFilePreview").append(li);
		}
		
	} */




// ---------------------------------------------------------

	// 파일 업로드 미리보기 
	$(".foodReviewFileUpload").change( (e) => {
		
		// 업로드한 파일들 확인
		// console.log($(e.target).get(0).files);
				
		// 한번에 업로드한 파일 개수 		
		let fileCount = $(e.target).get(0).files.length;
				// console.log(fileCount);
		
		let file = $(e.target).get(0).files;
		
		// 다중파일을 한꺼번에 드래그해서 선택하는 개수가 5개 이하이면 
		if(fileCount <= 5) {
			
			for(let i=0; i < fileCount; i++) {
				
				// 지금까지 업로드한 파일의 개수가 5개 이하이면
				if(document.getElementById("foodReviewFilePreview").childElementCount <= 5) {
				
					let li = $("<li class='prevLi' onmouseenter='fn_showDelBtn(event);' onmouseleave='fn_hideDelBtn(event);'>");
					
					let file = $(e.target).get(0).files[i];
					
					var reader = new FileReader();
				
					//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					reader.onload = function(e) {
						
						let outterDiv = $("<div>").attr({
							"class" : "outterDiv"
						}).css({
							"background-image" : "url(" + e.target.result + ")",
							"background-repeat" : "no-repeat",
							"width" : "100px",
							"height" : "100px", 
							"background-size" : "contain", 
							"border-radius" : "10px"
						});
						
						let innerDiv = $("<div>").attr({
							"class" : "innerDiv"
						}).css({
							"display" : "none", 
							"width" : "100%", 
							"height" : "100%", 
							"background-color" : "rgba(0, 0, 0, 0.5)",
							"border-radius" : "10px"
						}).append( $("<button>").attr({"onclick":"fn_delImg(event);", "type":"button"}).css({"border": "0px","background-color": "transparent", "color":"white", "padding":"35px", "outline":"0"}).html("<i class='fas fa-times' style='font-size:30px;'></i>")  );
						
						outterDiv.append(innerDiv);
						li.append(outterDiv);
						
					}
					reader.readAsDataURL(file);
					$("#foodReviewFilePreview").append(li);
					
					
				// 지금까지 업로드한 파일의 개수가 5개 초과이면
				} else {
					alert("파일은 최대 5개까지 첨부할 수 있습니다.");
				}
					
			} <!-- for문 -->
			
		// 다중파일을 한꺼번에 드래그해서 선택하는 개수가 5개 초과이면
		} else {
			alert("파일은 최대 5개까지 첨부할 수 있습니다.");
		}
		
		
		
		
	} );
	
	// 업로드한 파일에 마우스 커서가 올라가면 삭제버튼 보이게 하기 
	const fn_showDelBtn = (e) => {
		
		$(e.target).children().children().css({
			"display" : ""
		}); 
		
	}
	
	
	
	// 업로드한 파일에서 마우스 커서가 벗어나면 삭제버튼 가리기
	const fn_hideDelBtn = (e) => {
		
		$(e.target).children().children().css({
			"display" : "none"
		});
		
	}
	
	
	
	
	// 업로드한 파일 삭제버튼 눌렀을 때 실행되는 함수 
	const fn_delImg = (e) => {
		
		/* console.log( $(e.target) ); // i 태그 
		console.log( $(e.target).parent() ); // button 태그 
		console.log( $(e.target).parent().parent() ); // innerDiv 
		console.log( $(e.target).parent().parent().parent() ); // outterDiv */
		console.log( $(e.target).parent().parent().parent().parent() ); // li 태그 
		
		$(e.target).parent().parent().parent().parent().remove(".prevLi");
	}
	

	// 리뷰 입력창 글자수 카운트 
 	$(document).ready(function() {
		$("#DOC_TEXT").on("keyup", function() {
			$("#counter").html("("+$(this).val().length+" / 1000)");
	 			if($(this).val().length > 1000) {	
	 				alert("최대 1000자까지 입력 가능합니다.");
					$(this).val($(this).val().substring(0, 1000));
					$("#counter").html("(1000 / 1000)");
			}
		});
	}); 

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
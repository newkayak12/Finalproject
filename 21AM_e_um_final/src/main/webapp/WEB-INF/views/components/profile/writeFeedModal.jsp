<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form action="${path }/profile/writeFeed/end" method="post" enctype="multipart/form-data">
	<ul id="feedImagesPreview" class="p-0 d-flex justify-content-center" style="list-style:none;">
		<li class="">
			<label class="input-file-button" for="input-file" id="input-file-label"><i class="fas fa-plus" style="font-size:30px;"></i></label>
			<input class="feedImageUpload" type="file" accept="image/jpeg, image/jpg, image/png" name="file" id="input-file" multiple="multiple" style="display:none;"/> 
		</li>
	</ul>
	<textarea class="form-control" rows="10" id="feedContents" name="feedContents" onkeyup="fn_checkByte(this);"></textarea>
	<button type="submit" class="btn btn-info btn-block">등록</button>
</form>

<script>
	//파일 업로드 미리보기 
	$(".feedImageUpload").change( (e) => {
/* 		// 추가된 부분 
		// 새로 업로드를 시작했다면 방금 업로드한 파일들은 사라지므로 미리보기에서 삭제해야함 
		$(".prevLi").css("display", "none"); */
		
		// 업로드한 파일들 확인
		// console.log($(e.target).get(0).files);
				
		// 한번에 업로드한 파일 개수 		
		let fileCount = $(e.target).get(0).files.length;
				// console.log(fileCount);
		
		let file = $(e.target).get(0).files;
		
		// 다중파일을 한꺼번에 드래그해서 선택하는 개수가 3개 이하이면 
		if(fileCount <= 3) {
			
			for(let i=0; i < fileCount; i++) {
				
				// 지금까지 업로드한 파일의 개수가 3개 이하이면
				if(document.getElementById("feedImagesPreview").childElementCount <= 3) {
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
							"background-size" : "cover", 
							"border-radius" : "10px",
							"margin-left" : "20px"
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
					$("#feedImagesPreview").append(li);
					
				// 지금까지 업로드한 파일의 개수가 3개 초과이면
				} else {
					alert("파일은 최대 3개까지 첨부할 수 있습니다.");
				}
			} <!-- for문 -->
			
		// 다중파일을 한꺼번에 드래그해서 선택하는 개수가 3개 초과이면
		} else {
			alert("파일은 최대 3개까지 첨부할 수 있습니다.");
		}
	} );
	
	function fn_checkByte(obj){
	    const maxByte = 2000; //최대 2000바이트
	    const text_val = obj.value; //입력한 문자
	    const text_len = text_val.length; //입력한 문자수
	    
	    let totalByte=0;
	    for(let i=0; i<text_len; i++){
	    	const each_char = text_val.charAt(i);
	        const uni_char = escape(each_char) //유니코드 형식으로 변환
	        if(uni_char.length>4){
	        	// 한글 : 2Byte
	            totalByte += 2;
	        }else{
	        	// 영문,숫자,특수문자 : 1Byte
	            totalByte += 1;
	        }
	    }
	    
	    if(totalByte>maxByte){
	    	alert('최대 2000Byte까지만 입력가능합니다.');
	    }
	}
</script>
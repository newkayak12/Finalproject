<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="feedPhotos" class="row">
	<div class="col-4">
		<img src="${path }/resources/images/feed/default.jpg" id="fpPreview1">
		<div class="d-flex justify-content-around">
			<button type="button" class="btn btn-sm" onclick="fn_photo(1)"><i class="fas fa-camera"></i></button>
			<button type="button" class="btn btn-sm" onclick="fn_photoDel(1)"><i class="fas fa-times"></i></button>
		</div>
	</div>
	<div class="col-4">
		<img src="${path }/resources/images/feed/default.jpg" id="fpPreview2">
		<div class="d-flex justify-content-around">
			<button type="button" class="btn btn-sm" onclick="fn_photo(2)"><i class="fas fa-camera"></i></button>
			<button type="button" class="btn btn-sm" onclick="fn_photoDel(2)"><i class="fas fa-times"></i></button>
		</div>
	</div>
	<div class="col-4">
		<img src="${path }/resources/images/feed/default.jpg" id="fpPreview3">
		<div class="d-flex justify-content-around">
			<button type="button" class="btn btn-sm" onclick="fn_photo(3)"><i class="fas fa-camera"></i></button>
			<button type="button" class="btn btn-sm" onclick="fn_photoDel(3)"><i class="fas fa-times"></i></button>
		</div>
	</div>
</div><br>
<form action="${path }/profile/writeFeed/end" method="post" enctype="multipart/form-data">
	<input type="file" id="feedImage1" name="feedImage" accept='image/png,image/jpeg,image/jpg' style="display: none;">
	<input type="file" id="feedImage2" name="feedImage" accept='image/png,image/jpeg,image/jpg' style="display: none;">
	<input type="file" id="feedImage3" name="feedImage" accept='image/png,image/jpeg,image/jpg' style="display: none;">
	<textarea class="form-control" rows="10" id="feedContents" name="feedContents" onkeyup="fn_checkByte(this);"></textarea>
	<button type="submit" class="btn btn-info btn-block">등록</button>
</form>

<script>
	const deImg='${path }/resources/images/feed/default.jpg';
	
	const reader = new FileReader();
	
 	function fn_photo(su){
	    $("#feedImage"+su).trigger("click");
	    
	    reader.onload=(readerEvent)=>{
		    $("#fpPreview"+su).attr("src",readerEvent.target.result);
		}
		
	 	$("#feedImage"+su).change((changeEvent)=>{
		    const imgFile = changeEvent.target.files[0];
		    reader.readAsDataURL(imgFile);
		})
	}
	
	function fn_photoDel(su){
	    $("#feedImage"+su).val("");
	    $("#fpPreview"+su).attr("src",deImg);
	    
	    reader.onload=(readerEvent)=>{
		    $("#fpPreview"+su).attr("src",readerEvent.target.result);
		}
		
	 	$("#feedImage"+su).change((changeEvent)=>{
		    const imgFile = changeEvent.target.files[0];
		    reader.readAsDataURL(imgFile);
		})
	}
	
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form action="${pageContext.request.contextPath}/friend/writeGuestbook/end" method="post">
	<input type="hidden" id="profileId" name="userIdReceiver" value="${profileId }">
	<table class="table table-borderless">
	    <tr>
	        <th style="vertical-align: middle; text-align:center;">
	            <sup>(<span id="nowByte">0</span>/100bytes)</sup>
	        </th>
	        <td>
	            <textarea class="form-control" rows="5" id="guestbookComment" name="guestbookComment" onkeyup="fn_checkByte(this);"></textarea>
	        </td>
	    </tr>
	</table>
	<button type="submit" class="btn btn-info btn-block">등록</button>
</form>

<script>
	function fn_checkByte(obj){
	    const maxByte = 100; //최대 100바이트
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
	    	alert('최대 100Byte까지만 입력가능합니다.');
	    	document.getElementById("nowByte").innerText = totalByte;
	        document.getElementById("nowByte").style.color = "red";
	    }else{
	    	document.getElementById("nowByte").innerText = totalByte;
	        document.getElementById("nowByte").style.color = "green";
	    }
	}
</script>
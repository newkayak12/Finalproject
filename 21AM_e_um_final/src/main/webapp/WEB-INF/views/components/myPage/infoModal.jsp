<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Nav tabs -->
<ul id="infoTab" class="nav nav-tabs nav-fill tway"  role="tablist">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#nickname">닉네임</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#password">비밀번호</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#address">주소</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#email">이메일</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#interest">관심사</a>
    </li>
</ul>

<!-- Tab panes -->
<div class="tab-content my-5">
    <div class="tab-pane container active" id="nickname">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
            	<colgroup>
            		<col class="col-5">
            		<col class="col-7">
            	</colgroup>
                <tbody>
                    <tr>
                        <td class="colend"><b>현재 닉네임</b></td>
                        <td>${userSession.userNick }</td>
                    </tr>
                    <tr>
                        <td class="colend"><b>변경할 닉네임</b></td>
                        <td><input type="text" id="newNick" name="newNick" onkeyup="fn_checkNick()" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="NickSign"><small></small></td>
                    </tr>
                </tbody>
            </table>
            <button id="NickChangeBtn" class="btn changeBtn mt-4" onclick="fn_changeNick()">변경하기</button>
        </div>
    </div>

    <div class="tab-pane container fade" id="password">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
            	<colgroup>
            		<col class="col-5">
            		<col class="col-7">
            	</colgroup>
                <tbody>
                    <tr>
                        <td class="colend"><b>기존 비밀번호</b></td>
                        <td><input type="password" id="oldpw" name="oldpw" onkeyup="fn_sameOldPw()" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="oldpwSign"><small></small></td>
                    </tr>
                    <tr>
                        <td class="colend"><b>신규 비밀번호</b></td>
                        <td><input type="password" id="newpw" name="newpw" required onkeyup="fn_pw_normaliztion()"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="newpwSign"><small></small></td>
                    </tr>
                    <tr>
                        <td class="colend"><b>비밀번호 확인</b></td>
                        <td><input type="password" id="pwck" name="pwck" required onkeyup="fn_pwCheck()"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="pwckSign"><small></small></td>
                    </tr>
                </tbody>
            </table>
            <button id="pwChangeBtn" class="btn changeBtn mt-4" onclick="fn_changePw()">변경하기</button>
        </div>
    </div>

    <div class="tab-pane container fade" id="address">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
            	<colgroup>
            		<col class="col-4">
            		<col class="col-8">
            	</colgroup>
                <tbody>
                    <tr>
                        <td colspan="2" class="colcenter">
                            <b>기존 주소</b><br>
                            <small>${userSession.userAddrZip } ${userSession.userAddrBasic } ${userSession.userAddrDetails }</small><br>
                        </td>
                    </tr>
                    <tr>
                        <td class="colend"><b>우편번호</b></td>
                        <td>
                            <input type="text" name="zonecode" id="sample6_postcode" readonly>
                         <input type="button" id="btnPostcode" class="btn_post_search pointer" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
                        </td>
                    </tr>
                    <tr>
                        <td class="colend"><b>주소</b></td>
                        <td>
                            <input type="text" name="address" id="sample6_address" placeholder="주소" readonly style="width:300px;"><br>
                            <input type="text" name="addressSub" id="sample6_detailAddress" placeholder="상세주소" required style="width:300px">
                        </td>
                    </tr>
                </tbody>
            </table>
            <button id="addrChangeBtn" class="btn changeBtn mt-4" onclick="fn_changeAddr()">변경하기</button>
        </div>
    </div>

    <div class="tab-pane container fade" id="email">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
            	<colgroup>
            		<col class="col-5">
            		<col class="col-7">
            	</colgroup>
                <tbody>
                    <tr>
                        <td class="colend"><b>기존 이메일</b></td>
                        <td>${userSession.userEmail }</td>
                    </tr>
                    <tr>
                        <td class="colend"><b>변경할 이메일</b></td>
                        <td><input type="text" id="newEmail" name="newEmail"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="emailSign"><small></small></td>
                    </tr>
                </tbody>
            </table>
            <button class="btn changeBtn mt-4">변경하기</button>
        </div>
    </div>

    <div class="tab-pane container fade" id="interest">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col">
                <tbody>
                    <tr><td class="mark colcenter"><h6><b>운동</b></h6></td></tr>
                    <tr>
                        <td>
                            <div class="d-flex flex-wrap">
                                <div class="fribtn choice-5 m-2"><span class="interBtn">축구</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">농구</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">야구</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">eSports</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">골프</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">등산</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">헬스</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">요가</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">자전거</span></div>
                            </div><br>
                        </td>
                    </tr>
                    <tr><td class="mark colcenter"><h6><b>MBTI</b></h6></td></tr>
                    <tr>
                        <td>
                            <div class="d-flex flex-wrap">
                                <div class="fribtn choice-5 m-2"><span class="interBtn">INTJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">INTP</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ENTJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ENTP</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">INFJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">INFP</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ENFJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ENFP</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ISTJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ISFJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ESTJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ESFJ</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ISTP</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ISFP</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ESTP</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">ESFP</span></div>
                            </div><br>
                        </td>
                    </tr>
                    <tr><td class="mark colcenter"><h6><b>취미</b></h6></td></tr>
                    <tr>
                        <td>
                            <div class="d-flex flex-wrap">
                                <div class="fribtn choice-5 m-2"><span class="interBtn">노래방</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">전시회</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">영화감상</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">콘서트</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">근교드라이브</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">애니메이션</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">달다구리</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">정치</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">보드게임</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">강아지</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">고양이</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">타로</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">넷플릭스</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">박물관</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">음악</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">봉사활동</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">와인</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">종이접기</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">솔직한 대화</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">동네 산책</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">낚시</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">캠핑</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">작가</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">비건</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">피씨방</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">맛집</span></div>
                                <div class="fribtn choice-5 m-2"><span class="interBtn">사진</span></div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <button id="changeInterBtn" class="btn changeBtn mt-4" onclick="fn_changeInter()">변경하기</button>
        </div>
    </div>
</div>

<script>
	$(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/mypage/selectInterest",
			success:data=>{
/* 				console.log(data);
				console.log(data['profileInterestName1']);
				console.log($(".interBtn")[0]);
				console.log($(".interBtn").length); */
				//console.log($(".interBtn")[0].innerHTML);
 				for(let i=1;i<=5;i++){
					for(let j=0;j<$(".interBtn").length;j++){
//						console.log(data['profileInterestName'+i]);
//						console.log(data['profileInterestName'+i]==$(".interBtn")[j].innerHTML);
						if(data['profileInterestName'+i]==$(".interBtn")[j].innerHTML){
//							console.log($(".interBtn")[j]);
							$($(".interBtn")[j]).addClass("choCon"); 
							//console.log($(".interBtn")[j].hasClass("choCon"));
						}
					}
				}
			}
		})
	})

	function fn_validateNick(str) {
	    var id = str;
	    
	    //특수문자가 있는지 확인
	    var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    // 한글이 있는지 확인
	    
	    if ((id.length < 4) || (id.length > 10)) {
		    $("#NickSign>small").html("닉네임을 4자리 ~ 10자리 이내로 입력해주세요.").css("color","red");
		    $("#NickChangeBtn").attr("disabled", true);
		    return false;
	    }
	    if (id.search(/\s/) != -1) {
	        $("#NickSign>small").html("닉네임을 공백없이 입력해주세요.").css("color","red");
	        $("#NickChangeBtn").attr("disabled", true);
	    	return false;
	    }
	    if (spe > 0) {
		    $("#NickSign>small").html("닉네임은 한글, 영문, 숫자만 입력해주세요.").css("color","red");
		    $("#NickChangeBtn").attr("disabled", true);
		    return false;
	    }
	    return true;
	}
	
	function fn_changeNick(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/mypage/changeNick",
			data:{"newNick":$("#newNick").val()},
			success:data=>{
				if(data>0){
					alert("닉네임이 변경되었습니다.");
					$("#myPageModal").modal("hide");
					fn_openMPModal("info");
				}else{
					alert("닉네임 변경에 실패했습니다.");
				}
			}
		})
	}
	
	function fn_sameOldPw(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/mypage/sameOldPw",
			data:{"oldpw":$("#oldpw").val()},
			success:data=>{
				if(data>0){
					$("#oldpwSign>small").html("기존 비밀번호와 일치하지 않습니다.").css("color","red");
	                $("#pwChangeBtn").attr("disabled", true);
				}else{
					$("#oldpwSign>small").html("");
					$("#pwChangeBtn").attr("disabled", false);
				}
			}
		})
	}
	
	function fn_passwordValidate(password){
        if(!/^[a-zA-Z0-9]{8,16}$/.test(password)){
            $("#newpwSign>small").html('숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.').css("color","red");
            $("#pwChangeBtn").attr("disabled", true);
            return false;
        }

        var checkNum = password.search(/[0-9]/g); // 숫자사용
        var checkEng = password.search(/[a-z]/ig); // 영문사용

        if(checkNum <0 || checkEng <0){
            $("#newpwSign>small").html('숫자와 영문자를 조합해야 합니다.').css("color","red");
            $("#pwChangeBtn").attr("disabled", true);
            return false;
        }

        return true;
    }
	
	function fn_changePw(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/mypage/changePw",
			data:{"newpw":$("#newpw").val()},
			success:data=>{
				if(data>0){
					alert("비밀번호가 변경되었습니다.");
					$("#myPageModal").modal("hide");
					fn_openMPModal("info","비밀번호");
				}else{
					alert("비밀번호 변경에 실패했습니다.");
				}
			}
		})
	}
	
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	   
	                // 조합된 참고항목을 해당 필드에 넣는다.
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}
	
	function fn_changeAddr(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/mypage/changeAddr",
			data:{
				"userAddrBasic":$("#sample6_address").val(),
				"userAddrDetails":$("#sample6_detailAddress").val(),
				"userAddrZip":$("#sample6_postcode").val()
				},
			success:data=>{
				if(data>0){
					alert("주소가 변경되었습니다.");
					$("#myPageModal").modal("hide");
					fn_openMPModal("info","주소");
				}else{
					alert("주소 변경에 실패했습니다.");
				}
			}
		})
	}
	
	$(".choice-5").click(e=>{
  		/* console.log($(".choCon").filter(".interBtn").html()); */
    	let inter_su=$(".choice-5").find(".choCon").length;
		if($(e.target).hasClass("choCon")){
    		$(e.target).removeClass("choCon");    			
		} else{
			if(inter_su>4){
				alert("관심사는 5개까지 선택 가능합니다.");
			}else{
				$(e.target).addClass("choCon");  
			}
		}
	})
	
 	function fn_changeInter(){
		//console.log($(".choCon"));
		let interArr = [];
        
		$(".choCon").each(function(i){//체크된 리스트 저장
       		interArr.push($(this).html());
    	});
		
		$.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/user/mypage/changeInter",
			datatype:'json',
			data:{"interArr": interArr},
			success: data=>{
				if(data>0){
					alert("관심사가 변경되었습니다.");
					$("#myPageModal").modal("hide");
					fn_openMPModal("info","관심사");
				}else{
					alert("관심사 변경에 실패했습니다.");
				}
			}
		});
    }
</script>
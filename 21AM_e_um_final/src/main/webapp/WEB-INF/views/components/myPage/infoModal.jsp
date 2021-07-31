<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Nav tabs -->
<ul class="nav nav-tabs nav-fill tway"  role="tablist">
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
                        <td>닉네임</td>
                    </tr>
                    <tr>
                        <td class="colend"><b>변경할 닉네임</b></td>
                        <td><input type="text" id="newNick" name="newNick"></div></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>존재하는 닉네임입니다.</td>
                    </tr>
                </tbody>
            </table>
            <button class="btn changeBtn mt-4">변경하기</button>
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
                        <td><input type="text" id="oldpw" name="oldpw"></td>
                    </tr>
                    <tr>
                        <td class="colend"><b>신규 비밀번호</b></td>
                        <td><input type="text" id="newpw" name="newpw"></div></td>
                    </tr>
                    <tr>
                        <td class="colend"><b>비밀번호 확인</b></td>
                        <td><input type="text" id="pwck" name="pwck"></div></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>비밀번호가 일치하지 않습니다.</td>
                    </tr>
                </tbody>
            </table>
            <button class="btn changeBtn mt-4">변경하기</button>
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
                            주소 샬라샬라<br>
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
                            <input type="text" name="address" id="sample6_address" placeholder="주소" readonly style="width:300px"><br>
                            <input type="text" name="addressSub" id="sample6_detailAddress" placeholder="상세주소" required style="width:300px"></div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <button class="btn changeBtn mt-4">변경하기</button>
        </div>
    </div>

    <div class="tab-pane container fade" id="email">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
                <tbody>
                    <tr>
                        <td class="colend"><b>현재 이메일</b></td>
                        <td>이메일</td>
                    </tr>
                    <tr>
                        <td class="colend"><b>변경할 이메일</b></td>
                        <td><input type="text" id="newNick" name="newNick"></div></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>중복 이메일입니다.</td>
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
            <button class="btn changeBtn mt-4">변경하기</button>
        </div>
    </div>
</div>

<script>
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
</script>
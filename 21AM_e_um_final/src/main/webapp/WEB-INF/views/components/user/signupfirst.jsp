
    <%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
    	<form class="col-12 d-flex flex-column justify-content-center align-items-center">
	        <div class="m-2 d-flex flex-column justify-content-center align-items-center p-3 col-8 border">
	        	
	            <p class="col-10 text-left small">계정 정보 입력</p>
	                <div class="col-10 text-center">
	                    
	                        <p class="mb-0 mt-3 small col-6 text-center">아이디</p>
	                         <input type="text" class="mb-2 mt-0  col-7" id="userId" onkeyup="fn_idCheck" onblur="fn_id_normaliztion" placeholder="아이디" required>
	                    
	                    
	                    <br>
	                    <span id="checkSign" class="m-2 h-fitcontent" ></span>
	                </div>
	                <div class="col-10 text-center">
	                    <p class="mb-0 mt-3 small col-6 text-center">비밀번호</p>
	                    <input type="password" class="mb-2 mt-0 col-7" id="userPassword" placeholder="비밀번호" onblur="fn_pw_normaliztion" required>
	                    <br>
	                    <p class="mb-0 mt-3 pl-1 small col-7 text-center">비밀번호 체크</p>
	                    <input type="password" class="mb-2 mt-0 col-7" id="userPasswordCheck" onkeyup="fn_pwCheck" placeholder="비밀번호 확인" required>
	                    <br>
	                    <span id="passwordSign" class="m-2 h-fitcontent" ></span>
	                </div>
	        </div>
	
	        <div class="m-2 d-flex flex-column justify-content-center align-items-center p-3 col-8 border">
	            <p class="col-10 text-left small">개인 정보 입력</p>
	
	            <div class="col-10 text-center">
	                
	                    <p class="mb-0 mt-3 pl-0 small col-6 text-center">이름</p>
	                    <input type="text" class="mb-2 mt-0 col-7" id="userName" placeholder="이름" required>
	                    <br>
	                    
	                    <p class="mb-0 mt-3 pl-0 small col-6 text-center">생년월일</p>
	                    <input type="date" class="mb-2 mt-0 col-7" id="userBirth" placeholder="생년월일 입력" required>
	                    <br>
	                    
	                    <p class="mb-0 mt-3 pl-0 small col-6 text-center">이메일</p>
	                    <input type="email" class="mb-2 mt-0 col-7" id="userEmail" onkeyup="fn_emailCheck" placeholder="이메일 확인" required>
	                    <br>
	                    <span id="emailSign" class="m-2 h-fitcontent"></span>
	                    <br>
	                    
	                    <p class="mb-0 mt-3 pl-0 small col-6 text-center">주소</p>
	                    <div>
	                        <input type="email" class="mb-2 mt-1 ml -0 col-4" id="userAddrZip" placeholder="우편번호" readonly required>
	                        <input type="button" value="주소 찾기" class="mb-2 mt-1 col-3 eumbtn">
	                        <br>
	                        <input type="email" class="mb-2 mt-0 col-7" id="userAddrBasic"  placeholder="상세 주소" readonly required>
	                        <br>
	                        <input type="email" class="mb-2 mt-0 col-7" id="userAddrDetail"  placeholder="우편번호" readonly required>
	                        <br>
	                    </div>
	
	                    <p class="mb-0 mt-3 pl-0 small col-6 text-center">성별</p>
	                    <div>
	                        <span class="m-4 pl-4 pr-4">
	                            <label>
	                                <input type="radio" name="userGender" required>여성
	                            </label>
	                        </span>
	                        <span class="m-4 pl-4 pr-4">
	                            <label>
	                                <input type="radio" name="userGender">남성
	                            </label>
	                        </span>
	                    </div>  
	            </div>
	        </div>
	
	        <div class="d-flex justify-content-center col-8 pr-4 pl-4">
	            <input type="button" value="이전으로" class="col-3 m-2 mr-4" onclick="signupzero()" >
	            <input type="submit" value="다음으로" class="col-3 m-2 ml-4" onclick="signupsecond()">
	        </div>
        </form>
    </div>
    <script>
   	 $('#xlmodalbody').animate({scrollTop:0},250)
    </script>
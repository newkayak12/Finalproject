
    <%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
    	<form class="col-12 d-flex flex-column justify-content-center align-items-center" action="javascript:signupsecond()">
	        <div class="m-2 d-flex flex-column justify-content-center align-items-center p-3 col-8 border">
	        	
	            <p class="col-10 text-left small">계정 정보 입력</p>
	                <div class="col-10 text-center">
	                    
	                        <p class="mb-0 mt-3 small col-6 text-center">아이디</p>
	                         <input type="text" class="mb-2 mt-0  col-7" id="userId"  onkeyup="fn_id_normaliztion()" placeholder="아이디" required>
                            <br>
                            <span id="checkSign" class="m-2 h-fitcontent" ></span>
                            <br>
                              <p class="mb-0 mt-3 small col-6 text-center">닉네임</p>
	                         <input type="text" class="mb-2 mt-0  col-7" id="userNick"  onkeyup="fn_checkNick()" placeholder="닉네임" required>
                             <br>
                            <span id="NickSign" class="m-2 h-fitcontent" ></span>
	                </div>
	                <div class="col-10 text-center">
	                    <p class="mb-0 mt-3 small col-6 text-center">비밀번호</p>
	                    <input type="password" class="mb-2 mt-0 col-7" id="userPassword" placeholder="비밀번호" onkeyup="fn_pw_normaliztion()" required>
                        <br>
                        <span id="passwordSignfirst" class="m-2 h-fitcontent" ></span>
	                    <br>
	                    <p class="mb-0 mt-3 pl-1 small col-7 text-center">비밀번호 체크</p>
	                    <input type="password" class="mb-2 mt-0 col-7" id="userPasswordCheck" onkeyup="fn_pwCheck()" placeholder="비밀번호 확인" required>
	                    <br>
	                    <span id="passwordSignsecond" class="m-2 h-fitcontent" ></span>
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
	                    <input type="email" class="mb-2 mt-0 col-7" id="userEmail" onkeyup="fn_emailCheck()" placeholder="이메일 확인" required>
	                    <br>
	                    <span id="emailSign" class="m-2 h-fitcontent"></span>
	                    <br>
                        <p class="mb-0 mt-3 pl-0 small col-6 text-center">전화번호</p>
	                    <input type="tel" class="mb-2 mt-0 col-7" id="userPhone"  placeholder="전화번호" required>
	                    <br>
	                    
	                    <p class="mb-0 mt-3 pl-0 small col-6 text-center">주소</p>
	                    <div>
	                        <input type="text" class="mb-2 mt-1 ml -0 col-4" id="userAddrZip" placeholder="우편번호" readonly required>
	                        <input type="button" value="주소 찾기" class="mb-2 mt-1 col-3 eumbtn-2" onclick="addrSearch()">
	                        <br>
	                        <input type="text" class="mb-2 mt-0 col-7" id="userAddrBasic"  placeholder="주소1" readonly required>
	                        <br>
	                        <input type="text" class="mb-2 mt-0 col-7" id="userAddrDetail"  placeholder="주소2"  required>
	                        <br>
	                    </div>
	
	                    <p class="mb-0 mt-3 pl-0 small col-6 text-center">성별</p>
	                    <div>
	                        <span class="m-4 pl-4 pr-4">
	                            <label>
	                                <input type="radio" name="userGender" value="F" required>여성
	                            </label>
	                        </span>
	                        <span class="m-4 pl-4 pr-4">
	                            <label>
	                                <input type="radio" name="userGender" value="M">남성
	                            </label>
	                        </span>
	                    </div>  
	            </div>
	        </div>
	
	        <div class="d-flex justify-content-center col-8 pr-4 pl-4">
	            <input type="button" value="이전으로" class="col-3 m-2 mr-4 eumbtn-1 btn" onclick="signupzero()" >
	            <input type="submit" id="nextStep" value="다음으로" class="col-3 m-2 ml-4 eumbtn-2 btn" >
	        </div>
        </form>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
   	 $('#xlmodalbody').animate({scrollTop:0},250)

        function fn_validateId(str) {
            var id = str;
            
            //특수문자가 있는지 확인
            var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
            // 한글이 있는지 확인
            var korean = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi); 

            if ((id.length < 6) || (id.length > 20)) {
            $("#checkSign").html("아이디를 6자리 ~ 20자리 이내로 입력해주세요.").css("color","red");
            $("#nextStep").attr("disabled", true);
            return false;
            }
            if (id.search(/\s/) != -1) {
                $("#checkSign").html("아이디는 공백없이 입력해주세요.").css("color","red");
                $("#nextStep").attr("disabled", true);
            return false;
            }
            if (spe > 0 || korean > 0) {
            $("#checkSign").html("아이디는 영문,숫자만 입력해주세요.").css("color","red");
            $("#nextStep").attr("disabled", true);
            return false;
            }

            return true;
        }

        function fn_validateNickname(str) {
            var id = str;
            
            //특수문자가 있는지 확인
            var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
            // 한글이 있는지 확인

            if ((id.length < 4) || (id.length > 10)) {
            $("#NickSign").html("닉네임을 4자리 ~ 10자리 이내로 입력해주세요.").css("color","red");
            $("#nextStep").attr("disabled", true);
            return false;
            }
            if (id.search(/\s/) != -1) {
                $("#NickSign").html("닉네임을 공백없이 입력해주세요.").css("color","red");
                $("#nextStep").attr("disabled", true);
            return false;
            }
            if (spe > 0) {
            $("#NickSign").html("닉네임은 한글,영문,숫자만 입력해주세요.").css("color","red");
            $("#nextStep").attr("disabled", true);
            return false;
            }
            return true;
        }




        function fn_passwordValidate(password){
                if(!/^[a-zA-Z0-9]{8,16}$/.test(password)){
                    $("#passwordSignfirst").html('숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.').css("color","red");
                    $("#nextStep").attr("disabled", true);
                    return false;
                }

                var checkNum = password.search(/[0-9]/g); // 숫자사용
                var checkEng = password.search(/[a-z]/ig); // 영문사용

                if(checkNum <0 || checkEng <0){
                    $("#passwordSignfirst").html('숫자와 영문자를 조합하여야 합니다.').css("color","red");
                    $("#nextStep").attr("disabled", true);
                    return false;
                }

                return true;
            }
        const fn_id_normaliztion=()=>{

            if(fn_validateId($("#userId").val())){

                $.ajax({
                    url:"${pageContext.request.contextPath}/user/idchecker",
                    data:{userId:$("#userId").val()},
                    success:data=>{
                        if(data!=0){
                            $("#checkSign").html("이미 존재하는 아이디 입니다.").css("color","red");
                            $("#nextStep").attr("disabled", true);
                        } else {
                            $("#checkSign").html("사용할 수 있는 아이디 입니다.").css("color","darkgreen");
                            $("#nextStep").attr("disabled", false);
                        }
                    }
                })
                
            }
            
        }

        const fn_checkNick=()=>{

            if(fn_validateNickname($("#userNick").val())){

                        $.ajax({
                            url:"${pageContext.request.contextPath}/user/nickCheker",
                            data:{userNick:$("#userNick").val()},
                            success:data=>{
                                if(data!=0){
                                        $("#NickSign").html("이미 존재하는 닉네임 입니다.").css("color","red");
                                        $("#nextStep").attr("disabled", true);
                                    } else {
                                        $("#NickSign").html("사용할 수 있는 닉네임 입니다.").css("color","darkgreen");
                                        $("#nextStep").attr("disabled", false);
                                    }
                            }
                        })

                    }

            }

        const fn_pw_normaliztion=()=>{

            if(fn_passwordValidate($("#userPassword").val())){
                $("#passwordSignfirst").html("사용할 수 있는 비밀번호입니다.").css("color","darkgreen")
                $("#nextStep").attr("disabled", true);
            }

        }

        const fn_pwCheck=()=>{

            if($("#userPassword").val()==$("#userPasswordCheck").val()){
                 $("#passwordSignsecond").html("비밀번호가 일치합니다.").css("color","darkgreen")
                 $("#nextStep").attr("disabled", true);
            } else {
                $("#passwordSignsecond").html("비밀번호가 불일치합니다.").css("color","red")
                 $("#nextStep").attr("disabled", false);
            }

        }
        const fn_emailCheck = ()=>{
            
            $.ajax({
                url:"${pageContex.request.contextPath}/user/emailchecker",
                data:{userEmail: $("#userEmail").val()},
                success:data=>{
                    if(data!=0){
                            $("#emailSign").html("이미 존재하는 이메일 입니다.").css("color","red");
                            $("#nextStep").attr("disabled", true);
                        } else {
                            $("#emailSign").html("사용할 수 있는 이메일 입니다.").css("color","darkgreen");
                            $("#nextStep").attr("disabled", false);
                        }
                }

            })

        }
        const addrSearch=()=>{
                    new daum.Postcode({
                        oncomplete: function(data) {
                          $("#userAddrZip").val(data["zonecode"])
                          $("#userAddrBasic").val(data["address"])
                        }
                    }).open();
        }

    </script>
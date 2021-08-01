<%@ page language="java" contentType="text/html; charset=UTF-8"%>
            
                <div class="col-12 text-center">
	                    <p class="mb-0 mt-3 small col-6 text-center pointFont">비밀번호</p>
	                    <input type="password" class="mb-2 mt-0 col-7" id="userPassword" placeholder="비밀번호" onkeyup="fn_pw_normaliztion()" required>
                        <br>
                        <span id="passwordSignfirst" class="m-2 h-fitcontent" ></span>
	                    <br>
	                    <p class="mb-0 mt-3 pl-1 small col-7 text-center pointFont">비밀번호 체크</p>
	                    <input type="password" class="mb-2 mt-0 col-7" id="userPasswordCheck" onkeyup="fn_pwCheck()" placeholder="비밀번호 확인" required>
	                    <br>
	                    <span id="passwordSignsecond" class="m-2 h-fitcontent" ></span>
                        <input type="hidden" id="userId" value="${userId}">
	                </div>

                    <div class="d-flex justify-content-center col-12 pr-4 pl-4">
                                <input type="submit" id="changePw" value="비밀번호 변경" class="col-6 m-2 ml-4 checkBtn" onclick="fn_changepw()">
                    </div>
                </form>

                    <script>
                         function fn_passwordValidate(password){
                            if(!/^[a-zA-Z0-9]{8,16}$/.test(password)){
                                $("#passwordSignfirst").html('숫자와 영문자 조합으로 8~16자리를 사용해야 합니다.').css("color","red");
                                $("#changePw").attr("disabled", true);
                                return false;
                            }

                            var checkNum = password.search(/[0-9]/g); // 숫자사용
                            var checkEng = password.search(/[a-z]/ig); // 영문사용

                            if(checkNum <0 || checkEng <0){
                                $("#passwordSignfirst").html('숫자와 영문자를 조합하여야 합니다.').css("color","red");
                                $("#changePw").attr("disabled", true);
                                return false;
                            }

                            return true;
                        }   
                             const fn_pw_normaliztion=()=>{

                                if(fn_passwordValidate($("#userPassword").val())){
                                    $("#passwordSignfirst").html("사용할 수 있는 비밀번호입니다.").css("color","darkgreen")
                                    $("#changePw").attr("disabled", false);
                                }

                            }


                        const fn_pwCheck=()=>{

                            if($("#userPassword").val()==$("#userPasswordCheck").val()){
                                $("#passwordSignsecond").html("비밀번호가 일치합니다.").css("color","darkgreen")
                                $("#changePw").attr("disabled", false);
                            } else {
                                $("#passwordSignsecond").html("비밀번호가 불일치합니다.").css("color","red")
                                $("#changePw").attr("disabled", true);
                            }

                        }
                    </script>
             
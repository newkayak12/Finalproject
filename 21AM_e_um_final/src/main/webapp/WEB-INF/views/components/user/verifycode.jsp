  <%@ page language="java" contentType="text/html; charset=UTF-8"%>
                

                <div style="min-height:300px">
                     
                     <div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
                         <span class="m-2 d-flex flex-column justify-content-center align-items-center p-3 w-fitcontent">
                             <span class="w-100 m-3"><h1 class="text-center">인증번호 입력</h1></span>
                                <h2 id="countdown" style="color: darkgreen;"> 10:00 </h2>
                             &nbsp;&nbsp;
                                 <input type="text" id="verifyCode" class="w-20" placeholder ="인증번호를 입력하세요">
                             &nbsp;&nbsp;
                             </span>	
                         
                             <input type="button" id="findid" class="w-20 " value="인증번호 입력" onclick="verifyCodes()">
                             &nbsp;&nbsp; 
                         </span>
                         <input type="hidden" id="findmyflag" value="${flag}">
                         <input type="hidden" id="userId" value="${user}">
                     </div>
                 </div>
                 <script>
                        let code = '${code}';
                        let minutes = 9;
                        let second = 60;


                            function verifyCodes(){
                                let flag = $("#findmyflag").val()
    
                                if($("#verifyCode").val()==code){
                                        if(flag=='id'){
                                                   $.ajax({
                                                       url:"${pageContext.request.contexPath}/user/idfound",
                                                       data:{userId:$("userId").val()}
                                                       success:data=>{

                                                       }
                                                   })
                                        } else if(flag=='pw') {
                                            $.ajax({
                                                       url:"${pageContext.request.contexPath}/user/pwfound",
                                                       data:{userId:$("userId").val()}
                                                       success:data=>{
                                                           
                                                       }
                                                   })
                                        }
                                } else {
                                        alert('인증번호가 잘못됐습니다.')
                                }
                            }
                        setInterval(()=>{
                            // console.log(code)
                            if(minutes==0&&second==0){
                                clearInterval();
                                code = '';
                                alert('요청 시간이 만료되었습니다.')
                                lostAndFoundajax();
                            }
                            second -=1;

                            if(second<0){
                                second =59
                                minutes-=1;
                            }
                            if(second <10){
                                second = "0"+second
                            }
                            if(minutes>7){
                                $("#countdown").css("color","darkgreen") 
                            }else if(minutes<7&&minutes>4){
                                $("#countdown").css("color","orange")    
                            } else if(minutes<4){
                                $("#countdown").css("color","red")  
                            }
                            $("#countdown").html(minutes+":"+second);


                        }, 1000)



                </script>
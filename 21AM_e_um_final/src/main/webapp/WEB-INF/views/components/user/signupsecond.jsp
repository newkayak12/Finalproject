<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer" >
                <form id="formdatas">
                    <input type="hidden" id="userId" name="userId" value="${user.userId}">
                    <input type="hidden" id="userNick" name="userNick" value="${user.userNick}">
                    <input type="hidden" id="userPassword" name="userPassword" value="${user.userPassword}">
                    <input type="hidden" id="userName" name="userName" value="${user.userName}">
                    <input type="hidden" id="userYear"  name="userYear" value="${user.userYear}">
                    <input type="hidden" id="userEmail" name="userEmail" value="${user.userEmail}">
                    <input type="hidden" id="userAddrZip" name="userAddrZip" value="${user.userAddrZip}">
                    <input type="hidden" id="userAddrBasic" name="userAddrBasic" value="${user.userAddrBasic}">
                    <input type="hidden" id="userAddrDetails" name="userAddrDetails" value="${user.userAddrDetails}">
                    <input type="hidden" id="userGender" name="userGender" value="${user.userGender}">
                    <input type="hidden" id="userPhone" name="userPhone" value="${user.userPhone}">
                    <input type="hidden" id="profileInterestName1" name="profileInterestName1">
                    <input type="hidden" id="profileInterestName2" name="profileInterestName2">
                    <input type="hidden" id="profileInterestName3" name="profileInterestName3">
                    <input type="hidden" id="profileInterestName4" name="profileInterestName4">
                    <input type="hidden" id="profileInterestName5" name="profileInterestName5">
                    <input type="file" id="profilePhoto" name="profilePhoto" class="col-4 small ml-2" accept='image/png,image/jpeg,image/jpg' style="display: none;"  >
                </form>


                    <div class="p-0 m-2 col-12  d-lg-flex d-flex flex-column flex-lg-row justify-content-around align-content-around" style="min-height: 300px;">
                        
                        <div class="col-lg-5 col-10 m-lg-1 m-2 ml-5 d-flex flex-column p-1 justify-content-between align-items-center" >
                            <div>
                                <img alt="??????" src="<%=request.getContextPath()%>/resources/images/user/default.png"  style="height: 300px;  width: 100%;" id="profilepreview">
                                
                                <div style="width: fit-content;" class="p-1 mt-2">
                                    <input type="button" value="????????? ?????? ??????" class="col-md-5 cursor  m-2 btn btn-danger " style="font-size: 12px;" onclick="fn_photoDel()">
                                    <input type="button" value="????????? ?????? ??????" class="col-md-5 cursor  m-2 btn btn-primary" style="font-size: 12px;" onclick="fn_photo()" >
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-10 m-lg-1  m-2 ml-5 d-flex flex-column p-1 justify-content-around align-items-center">
                            <div class="col-12 p-3 overflow-auto">
                                
                                <div>
                                    <p class="pointFont">?????????</p>
                                    <div id="interestboard" class="col-12 p-2 d-flex flex-wrap">

                                    </div>

                                    <p onclick="fn_athletic()" class="pl-2 pointFont">??????</p>
                                    <div id="athletic" class="p-1 " style="display: none;">
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">eSports</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                    </div>
                                    <p onclick="fn_mbti()" class="pl-2 pointFont">MBTI</p>
                                    <div id="mbti" class="p-1" style="display: none;">
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ISTJ</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ISFJ</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">INFJ</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">INTJ</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ISTP</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ISFP</span>
                                        </div>    
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">INFP</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">INTP</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ESTP</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ESFP</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ENFP</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ENTP</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ESTJ</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ESFJ</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ENFJ</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">ENTJ</span>
                                        </div>
                                    </div>
                                    <p onclick="fn_hobby1()" class="pl-2 pointFont">hobby1</p>
                                    <div id="hobby1" class="p-1" style="display: none;">
                                        <div class="d-flex justify-content-around">
                                            <span class="col-4 m-2 text-center cursor" onclick="addInterest(event)">??????????????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">????????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                            <span class="col-4 m-2 text-center cursor" onclick="addInterest(event)">???????????????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">????????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">????????????</span>
                                        </div>

                                        
                                    </div>
                                    <p onclick="fn_hobby2()" class="pl-2 pointFont">hobby2</p>
                                    <div id="hobby2" class="p-1" style="display: none;">
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">????????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">????????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">????????????</span>
                                        </div>
                                        
                                    </div>
                                    <p onclick="fn_hobby3()" class="pl-2 pointFont">hobby3</p>
                                    <div id="hobby3" class="p-1" style="display: none;">
                                        <div class="d-flex justify-content-around">
                                            <span class="col-4 m-2 text-center cursor" onclick="addInterest(event)">????????? ??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????? ??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                        <div class="d-flex justify-content-around">
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">?????????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                            <span class="col-3 m-2 text-center cursor" onclick="addInterest(event)">??????</span>
                                        </div>
                                        
                                    </div>

                                    
                                </div>
                                

                            </div>
                        </div>
            
            
                               
                    </div>
            
                    <div class="d-flex justify-content-center col-8 pr-4 pl-4">
                        <input type="button" value="????????????" style="background-color: white!important;" class="col-3 m-2 mr-4  cursor cancelBtn" onclick="signupfirst()" >
                        <input type="button" value="????????????" class="col-3 m-2 ml-4 checkBtn cursor" onclick="signupthird()">
                    </div>
            
                    
                </div>
                <script>
                    
                    const fn_photo=()=>{
                        $("#profilePhoto").trigger("click")
                    }

                    const fn_photoDel=()=>{
                        $("#profilePhoto").val("");
                        $("#profilepreview").attr("src","${pageContext.request.contextPath}/resources/images/user/default.png")
                        
                    }
                   
                    const reader = new FileReader();
                    reader.onload=(readerEvent)=>{
                        $("#profilepreview").attr("src",readerEvent.target.result);
                    }
                    
                    $("#profilePhoto").change((changeEvent)=>{
                        const imgFile = changeEvent.target.files[0]
                        reader.readAsDataURL(imgFile)
                    })
                    

                    function fn_athletic(){
                        $("#athletic").toggle(240)
                        $("#mbti").hide(240)
                        $("#hobby1").hide(240)
                        $("#hobby2").hide(240)
                        $("#hobby3").hide(240)
                    }

                    function fn_mbti(){
                        $("#mbti").toggle(240)
                        $("#athletic").hide(240)
                        $("#hobby1").hide(240)
                        $("#hobby2").hide(240)
                        $("#hobby3").hide(240)
                        
                    }
                    function fn_hobby1(){
                        $("#hobby1").toggle(240)
                        $("#mbti").hide(240)
                        $("#athletic").hide(240)
                        $("#hobby2").hide(240)
                        $("#hobby3").hide(240)
                        
                    }
                    function fn_hobby2(){
                        $("#hobby2").toggle(240)
                        $("#mbti").hide(240)
                        $("#athletic").hide(240)
                        $("#hobby1").hide(240)
                        $("#hobby3").hide(240)
                        
                    }
                    function fn_hobby3(){
                        $("#hobby3").toggle(240)
                        $("#mbti").hide(240)
                        $("#athletic").hide(240)
                        $("#hobby2").hide(240)
                        $("#hobby1").hide(240)
                        
                    }
                   

                   
                    
                    let Interestarray =[];
                    let count = 0;
                    function filter(element){
                        if(Interestarray.length == 0)    {
                                 return true;
                        } else{
                                    if(Interestarray.includes(element)){
                                    
                                        return false;
                                    }  else {
                                        return true;
                                    }
                        }
                    }
                    const addInterest=(e)=>{
                        count+=1;
                        
                        if(count<6){
                            if(filter($(e.target).html())){
                                Interestarray.push($(e.target).html());
                                
                                console.log(Interestarray)
                            
                                $("#interestboard").append(  
                                            $("<span>").attr({"id":"interest"+count, "class":"m-2 text-center", "onclick":"fn_delInterst(event,"+ count+")"}).html($(e.target).html()+"&nbsp;&nbsp;X")
                                    )
                                $("#interestSearch").val("")
                                
                            } else{
                                alert('?????? ????????? ???????????? ????????? ??? ????????????.');   
                                count-=1;    
                            }


                        } else {
                            alert('??? ?????? ???????????? ????????? ??? ????????????.');
                        }
                    }
                    const fn_delInterst=(event, coun)=>{

                        $("#interest"+coun).remove()
                        count-=1;
                        Interestarray[0] = "";
                        let temp = [];
                        Interestarray.forEach((v,i)=>{
                            
                            if(v!=""){
                                temp.push(v);
                            }

                        })
                        Interestarray = temp;
                    }

                    function valueInjection(){
                        Interestarray.forEach((v,i)=>{
                                console.log(v+"_:_"+i)
                            $("#profileInterestName"+(i+1)).val(v);
                                console.log($("#profileInterestName"+i).val())
                        })
                    }

                </script>
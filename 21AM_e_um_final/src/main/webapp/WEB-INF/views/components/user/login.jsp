<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
<div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
    <span class="m-2 d-flex justify-content-center align-items-center p-3 w-fitcontent">
        <span class="w-10">ID</span>
        &nbsp;&nbsp;
        <input type="text" id="userId" class="w-50" style="height:30px" placeholder="아이디">
        &nbsp;&nbsp;
        <input type="checkbox" class="w-10" id="persistlogin" >
        &nbsp;&nbsp; 
        <span class="w-10">아이디 저장</span>
    </span>	
    <span class="m-2 d-flex justify-content-center align-content-center p-3 w-fitcontent">
        <span class="w-10">PW</span>
        &nbsp;&nbsp; 
        <input type="password" id="userPassword" class="w-75 " style="height:30px" onkeyup="enterkey()" placeholder="비밀번호">
         
        &nbsp;&nbsp; 
        <input type="button" onclick ="loginVerifyAjax()" class=" eumbtn-2 btn " value="로그인">
    </span>
    <span class="m-2 d-flex justify-content-center align-content-center p-3 w-fitcontent">
        &nbsp;&nbsp; 
        <img src ="${pageContext.request.contextPath }/resources/images/user/kakaoLogin.png" class="w-25" onclick="kakaoLogin()">
        &nbsp;&nbsp; 
        &nbsp;&nbsp; 
        <input type="button" id="naver" class="w-25 " value="네이버 로그인">
        &nbsp;&nbsp; 
       
        
    </span>
    <span class="d-flex flex-row w-50 justify-content-around align-content-center">
        <span onclick="fn_lostAndFound()">
               아이디/비밀번호
        </span>
        
    </span>
</div>



<script>

function  kakaoLogin(){
	Kakao.init('55ed969ca9bcce24d1c9c11d44e0c525');
	console.log(Kakao.isInitialized());
	
	Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',data: {
	              property_keys: ["kakao_account.email","kakao_account.gender","properties.nickname","properties.profile_image","kakao_account.birthday"]
	          },
	          success: function (response) {
	        	  
	        	  console.log(response)
	        	  console.log(response["id"])
	        	  console.log(response["kakao_account"]["birthday"])
	        	  console.log(response["kakao_account"]["email"])
	        	  console.log(response["kakao_account"]["gender"])
	        	  console.log(response["properties"]["nickname"])
	        	  
	        	  kakaoverify(response["id"], response["kakao_account"]["birthday"], response["kakao_account"]["email"], response["kakao_account"]["gender"], response["properties"]["nickname"]);
	        	  
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	
}

function kakaoverify(id, birth, email, gender, nickname){
	let postCode="";
	let address="";
	 $.ajax({
		  url:"${pageContext.request.contextPath}/user/kakaologin",
		  data:{userId:id},
		  success:data=>{
			  console.log(data)
			  if(data>0){
				  /* 로그인 시키고 */
				  location.assign('${pageContext.request.contextPath}/user/gotomain');
				  
			  } else {
				  $.ajax({
						 url:"${pageContext.request.contextPath}/user/kakaoInsert",
						 data:{userId:id, userYear:"00"+birth, userEmail:email, userGender:gender, userName:nickname, userNick:nickname},
						 success:data=>{
							 
							 if(data>0){
								 kakaoverify(id);
							 }
						 }
					 })
			  }
		  }
	  })
}

$(function(){
    let cookie = '${persistLogin}'
    if(cookie!='none'&&cookie!=''){
        $("#persistlogin").attr("checked",true)
        $("#userId").val(cookie);
    }

})


function enterkey() {
        if (window.event.keyCode == 13) {
 
             loginVerifyAjax()
        }
}









</script>
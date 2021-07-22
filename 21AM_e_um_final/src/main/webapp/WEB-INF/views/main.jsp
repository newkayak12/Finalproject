<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <style>
    	*{
    		 border: 1px black solid 
    	}
    </style>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sanghyun.css">
    <script>
    	 $('.carousel').carousel({ interval: 5000 }); 
    	 
    	 const profileRoot=(profile, nick,addr, status, gender, interest1, interest2, interest3, interest4, interest5 )=>{
    		 console.log(profile)
    		 console.log(nick)
    		 console.log(status)
    		 console.log(gender)
    		 /* console.log(interest) */
    		 
    		 $("#modalProfilePhoto").attr("src","${pageContext.request.contextPath }/resources/upload/profile/"+profile)
    		 $("#modaluserNick").html(nick)
    		 $("#modaluserstatus").html(status)
    		 let genderKr = "";
	    		 if(gender == "F"||gender=="f"){
	    			 genderKr = "여성";
	    		 } else{
	    			 genderKr = "남성";
	    		 }
    		 $("#modaluserGender").html(genderKr)
    		 $("#modaluserAddr").html(addr.substring(0,2));
    		 $("#modaluserInterest")
    		 
    		 
    	 }
    </script>
    
 <section class="mt-5 pt-5">   
   	<div id="root" class="container md-mt-5 mt-0 ">
   		
        <div class="container d-flex justify-content-around align-items-center col-12 col-md-8  mt-4 border">
             <h5 class='mt-2  ml-2 mr-2 p-0 col-3 text-center col-xl-2 '>친구 찾기</h5>
            <input type="text" id="friendSearch" class=" ml-2 mr-2 col-6">
            <button type="button" class="small ml-2 mr-2">검색</button>
        </div>
        
        
		     <div >
		     <h5 class="mt-4 mb-0 text-left">&nbsp;&nbsp;추천 친구</h5>
	        <div id="recommand-container" class="carousel slide col-12 col-lg-10 mt-0 container p-2 pt-4 border" data-ride="carousel">
		       
		        <div class="carousel-inner" id="recommand-inner-conatiner">
		            	 <div class="carousel-item active">
		            	 
		            	 	<div class="d-flex justify-content-around pl-5 pr-5">
		            	 	<c:forEach begin="0" end="3" items="${list }" var="i" varStatus="var" >
		            	 
			            	 		<c:if test="${fn:length(list)>4}">
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot('${i.profileImageFile}','${i.userNick }', '${i.userAddrBasic }', '${i.profileStatus }','${i.userGender }', '${i.interest.profileInterestName1 }', '${i.interest.profileInterestName2 }', '${i.interest.profileInterestName3 }', '${i.interest.profileInterestName4 }', '${i.interest.profileInterestName5 }')">
						                    <img alt="사진" src="${pageContext.request.contextPath }/resources/upload/profile/${i.profileImageFile}" width="75px" height="75px"style="border-radius:100%">
						                    <p class="text-center">${i.userNick }</p>
						                </span>
					                </c:if>
						      	</c:forEach>
					      	</div>
					    </div>
					    
					    <div class="carousel-item">
					    	<div class="d-flex justify-content-around pl-5 pr-5">
					    	<c:forEach begin="4" end="7" items="${list }" var="i">
		            	 	
			            	 		<c:if test="${fn:length(list)>8}">
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot('${i.profileImageFile}','${i.userNick }', '${i.userAddrBasic }', '${i.profileStatus }','${i.userGender }', '${i.interest.profileInterestName1 }', '${i.interest.profileInterestName2 }', '${i.interest.profileInterestName3 }', '${i.interest.profileInterestName4 }', '${i.interest.profileInterestName5 }')">
						                    <img alt="사진" src="${pageContext.request.contextPath }/resources/upload/profile/${i.profileImageFile}" width="75px" height="75px"style="border-radius:100%">
						                    <p class="text-center">${i.userNick }</p>
						                </span>
					                </c:if>
						      	</c:forEach>
					      	</div>
					    </div>
					    
					    <div class="carousel-item">
					    	<div class="d-flex justify-content-around pl-5 pr-5">
						      	<c:forEach begin="8" end="${fn:length(list)}" items="${list }" var="i">
		            	 	
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot('${i.profileImageFile}','${i.userNick }', '${i.userAddrBasic }', '${i.profileStatus }','${i.userGender }', '${i.interest.profileInterestName1 }', '${i.interest.profileInterestName2 }', '${i.interest.profileInterestName3 }', '${i.interest.profileInterestName4 }', '${i.interest.profileInterestName5 }')">
						                    <img alt="사진" src="${pageContext.request.contextPath }/resources/upload/profile/${i.profileImageFile}" width="75px" height="75px"style="border-radius:100%">
						                    <p class="text-center">${i.userNick }</p>
						                </span>
						      	</c:forEach>
					      	</div>
					    </div>
		        </div>
		        
	        
	        <!-- carubtn -->
		  
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev carubtn" href="#recommand-container" data-slide="prev">
				    <!-- <span class="carousel-control-prev-icon"></span> -->
				    <img src="${pageContext.request.contextPath }/resources/images/user/previous.png" width="50px">
				  </a>
				  <a class="carousel-control-next carubtn" href="#recommand-container" data-slide="next">
				    <!-- <span class="carousel-control-next-icon"></span> -->
				    <img src="${pageContext.request.contextPath }/resources/images/user/next.png" width="50px">
				  </a>
		   		</div>
   		
   		</div>
   		
   		<div id="feed-container" class="container border mt-4">
   			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   		</div>
   		
   	</div>

</section>



	<div class="modal" id="profile">
			<div class="modal-dialog  modal-dialog-centered">
			  <div class="modal-content">
		  
				<!-- Modal Header -->
				<div class="modal-header eumbtn-2">
				  <h4 class="modal-title" id="modalPrifileHeader">프로필 정보</h4>
				  <button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
				</div>
		  
				<!-- Modal body -->
				<div class="modal-body" id="xlmodalbody">
					 <div id="profileRoot" class= "p-0 d-flex justify-content-center align-content-center flex-row"style="min-height: 300px">
                    <div class="col-6 d-flex flex-column p-1 pl-0 pr-0 justify-content-around align-items-center">
                        <img src="" id="modalProfilePhoto" alt="프로필 사진" style=" border: 1px black solid; " class="col-8 mb-1 mt-2 p-0" >
                        <p id="modaluserNick" class=" text-center  mb-1">닉네임</p>
                        <p id="modaluserstatus" class=" text-center  mt-1">상메</p>
                    </div>
                    <div class="col-6 p-4 pt-2">
                        <div class="col-12 pt-2 pb-2 pl-2 pr-2" >
                            <div class="mt-2 mb-2">
                                <span class="ml-3 mr-4">성별 : </span>
                                <span id="modaluserGender"></span>
                            </div>
                            <div class="mt-2 mb-2">
                                <span class="ml-3 mr-4">지역 : </span>
                                <span id="modaluserAddr"></span>
                            </div>
                            
                        </div>
                        <div class="col-12 p-1 mt-2" id="modaluserInterest">
                            <p>관심사</p>
                        </div>

                    </div>
                </div>
				</div>
		  
				<!-- Modal footer -->
				<div class="modal-footer">
				  <button type="button" class="btn btn-danger eumbtn-3" data-dismiss="modal">Close</button>
				</div>
		  
			  </div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   
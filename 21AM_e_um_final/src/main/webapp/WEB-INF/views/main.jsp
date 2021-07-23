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
    	 
    	 const profileRoot=(profile, nick,addr, status, gender, interest1, interest2, interest3, interest4, interest5, userId )=>{
    		
    		 console.log(userId)
    		 $("#reportId").val(userId)
    		 
    		  $("#modaluserstatus").html("")
    		  $("#interest1").html("")
    		  $("#interest2").html("")
    		  $("#interest3").html("")
    		  $("#interest4").html("")
    		  $("#interest5").html("")
    		
    		 
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

    		 if(interest1==""){
	    		 $("#interest1").html('선택안함')
    		 }
    		 
    		 if(interest1!=""){
	    		 $("#interest1").html('#'+interest1)
    		 }
    		 if(interest2!=""){
	    		 $("#interest2").html('#'+interest2)
    		 }
    		 if(interest3!=""){
	    		 $("#interest3").html('#'+interest3)
    		 }
    		 if(interest4!=""){
	    		 $("#interest4").html('#'+interest4)
    		 }
    		 if(interest5!=""){
	    		 $("#interest5").html('#'+interest5)
    		 }
    		 
    		 
    	 }
    	 
    	 
	   	 $(function(){
    		 $(window).scroll(function(){
    			 let windowObj = $(this)
    			 let scrollTop = windowObj.scrollTop();
    			 let windowHeight = windowObj.height();
    			 let documentHeight = $(document).height();
    			 
    			 
    			 if(scrollTop+windowHeight+30 >documentHeight){
    				
    				 setTimeout(() => {
    					 feedAjaxContainer();
    					 
					}, 400);
    			 }
    		 })
    		 
    		 feedAjaxContainer();
    	 })
    	 
    	
    	function feedAjax(e){
    		 let userId = '${session.userId}'
		        $.ajax({
		            url:"${pageContext.request.contextPath}/feed/feedList",
		            data:{"cPage":e, "userId": userId},
		            success:data=>{
		                $("#feed-container").append(data)
		                $(".repl").css("display","block")
		            }
		        })
    	}
    	 let cPage =1;
	    const feedAjaxContainer=()=>{
	        
	        feedAjax(cPage)
	        cPage+=1;
	        
	        
	    }
	    
	    function commeterReader(event, seq){
	    	console.log($(event.target).next())
	    }
	    
	    function fn_like(index, seq, flag){
	    	
	    	
	    	
	    	if(flag=='like') {
	    		/* 안좋아요 하기 */
	    		$("#likebtn"+index).css("display","none")
	    		$("#unlikebtn"+index).css("display","inline-block")
	    		
	    		
	    	} else if(flag=='unlike') {
	    		/* 좋아요만들기 */
	    		$("#likebtn"+index).css("display","inline-block")
	    		$("#unlikebtn"+index).css("display","none")
	    		
	    		
	    	}
	    	
	    	$.ajax({
	    		url:"${pageContext.request.contextPath}/feed/likeunlike",
	    		data:{"seq":seq, "flag":flag, "userId":'${session.userId}'},
	    		success:data=>{
	    			
	    		}
	    	})
	    	
	    	
	    }

	    
	    
	    
	    
	    
	    function fn_report(seq,feedId, myId){
	    	let feedSeqRep = seq;
	    	let feedIdRep  = feedId;
	    	let myIdRep = myId;
	    	$("#counterpartid").html(feedIdRep)
	    	$("#myid").html(myIdRep)
	    	$("#reportSeq").val(feedSeqRep);
	    	
	    	
	    	
	    	  $(".reportbtn").change((e)=>{
			    	$("#reportcategory").val($(e.target).val())
	    		  
	  	        if($(e.target).val()=='etc'){
	  	            $(".etc").show(240)
	  	        } else{
	  	            $(".etc").hide(240)
	  	        }
	  	    })
	    	
	    	
	    	
	    }
	    
	    function reportthis(){
  		  let content = $("#reportcategory").val()
  		  
  		  if(content=='etc'){
  			content = $("#etcContent").val()  
  		  }
  			  
  			
  		  let shooter = $("#myid").html()
  		  let target = $("#counterpartid").html()
  		  let seq = $("#reportSeq").val()
  		  
  		  $.ajax({
  			  url:"${pageContext.request.contextPath}/report/reportfeed",
  			  data:{userIdShooter:shooter , userIdTarget:target , reportContents:content, reportTargetContent: seq},
  			  success:data=>{
  				$("#counterpartid").html("")
  		    	$("#myid").html("")
  		    	$("#etcContent").val("")
  				$(".reportbtn").prop("checked", false)
  				
  				if(data>0){
  					alert('신고가 완료되었습니다.')
  				}
  				
  				
  			  }
  		  })
  		
  	}
	    
	    
	    function userReport(){
	    	let userReportId = $("#reportId").val();
	    	let userReportMyId = '${userSession.userId}';
	    	let userReportContent = "사용자 신고"
	    	let userReportTargetContent = 'profile';
	    	
	    	$.ajax({
	    		url:"${pageContext.request.contextPath}/report/reportprifile",
	    		data:{userIdShooter:userReportMyId , userIdTarget:userReportId , reportContents:userReportContent, reportTargetContent: userReportId}, 
	    		success:data=>{
	    			if(data>0){
	  					alert('신고가 완료되었습니다.')
	  				}
	    		}
	    	})
	    	
	    }
    </script>
    
 <section class="mt-5 pt-5">   
   	<div id="root" class="container md-mt-5 mt-0 ">
   		
        <div class="container d-flex justify-content-around align-items-center col-12 col-md-8  mt-4 border">
             <h5 class='mt-2  ml-2 mr-2 p-0 col-3 text-center col-xl-2 '>친구 찾기</h5>
            <input type="text" id="friendSearch" class=" ml-2 mr-2 col-6">
            <button type="button" class="small ml-2 mr-2">검색</button>
        </div>
        
        
		     <div class="mt-4 mb-5" >
		     <h5 class="mt-4 mb-0 text-left pl-lg-5">&nbsp;&nbsp;&nbsp;추천 친구</h5>
	        <div id="recommand-container" class="carousel slide col-12 col-lg-10 mt-0 container p-2 pt-4 border" data-ride="carousel">
		       
		        <div class="carousel-inner" id="recommand-inner-conatiner">
		            	 <div class="carousel-item active">
		            	 
		            	 	<div class="d-flex justify-content-around pl-5 pr-5">
		            	 	<c:forEach begin="0" end="3" items="${list }" var="i" varStatus="var" >
		            	 
			            	 		<c:if test="${fn:length(list)>4}">
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot('${i.profileImageFile}','${i.userNick }', '${i.userAddrBasic }', '${i.profileStatus }','${i.userGender }', '${i.interest.profileInterestName1 }', '${i.interest.profileInterestName2 }', '${i.interest.profileInterestName3 }', '${i.interest.profileInterestName4 }', '${i.interest.profileInterestName5 }','${i.userId }')">
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
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot('${i.profileImageFile}','${i.userNick }', '${i.userAddrBasic }', '${i.profileStatus }','${i.userGender }', '${i.interest.profileInterestName1 }', '${i.interest.profileInterestName2 }', '${i.interest.profileInterestName3 }', '${i.interest.profileInterestName4 }', '${i.interest.profileInterestName5 }','${i.userId }')">
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
		            	 	
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot('${i.profileImageFile}','${i.userNick }', '${i.userAddrBasic }', '${i.profileStatus }','${i.userGender }', '${i.interest.profileInterestName1 }', '${i.interest.profileInterestName2 }', '${i.interest.profileInterestName3 }', '${i.interest.profileInterestName4 }', '${i.interest.profileInterestName5 }','${i.userId }')">
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
   		
   		<div id="feed-container" class="container mt-4 col-12 d-flex flex-column justify-content-center align-items-center">
   			
  			
  			
  			
  			
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
                        <div class="col-12 p-1 mt-2 " id="modaluserInterest">
                            <p>관심사</p>
                            <div class="d-flex flex-wrap">
	                            <span class="m-1" id="interest1"></span>
	                            <span class="m-1" id="interest2"></span>
	                            <span class="m-1" id="interest3"></span>
	                            <span class="m-1" id="interest4"></span>
	                            <span class="m-1" id="interest5"></span>
                            </div>
                        </div>

                    </div>
                </div>
				</div>
		  
				<!-- Modal footer -->
				<div class="modal-footer">
				<!-- 추가적으로 채워야하는 부 -->
				
				
	<!-- ---------------------------------------------------------------------------------------------- -->
	
					<input type="hidden" id = "reportId">
				  <button type="button" class="btn btn-warning eumbtn-2" onclick="userReport()">신고</button>
				  <button type="button" class="btn btn-primary eumbtn-2" >친구 요청</button>
				  <button type="button" class="btn btn-primary eumbtn-1" >프로필로 이동</button>
	<!-- ---------------------------------------------------------------------------------------------- -->
				</div>
		  
			  </div>
		</div>
		
	</div>
		
		<div class="modal" id="ReportModal">
    <div class="modal-dialog ">
      <div class="modal-content">

    <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <div class="modal-body">
          <table class="table-striped table table-bordered table-sm col-12">
          	  <input type="hidden" id= "reportSeq">
          	  <input type="hidden" id= "reportcategory">
              <tr >
                  <th style="width:30%" class="text-center p-0" >신고할 아이디</th>
                  <td colspan="3" class="p-0 text-center"id="counterpartid"></td>
              </tr>
              <tr>
                  <th style="width:30%" class="text-center p-0" >신고하는 아이디</th>
                  <td colspan="3" class="p-0 text-center" id="myid"></td>
              </tr>
              
              <!-- <tr > -->
                <th style="width:30%; vertical-align:middle;" rowspan="6" class="text-center p-0">
                    신고 항목
                </th>
                  <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
                      <label class="small">
                          <input type="radio" name="report" value="language"  class="reportbtn" > 부적절한 언어 사용
                      </label>
                  </td>
                </tr>
                <tr>
                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
                        <label class="small">
                            <input type="radio" name="report" value="advertisement" class="reportbtn"> 광고성 게시글
                        </label>
                    </td>
                </tr>
                <tr>
                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
                        <label class="small">
                            <input type="radio" name="report" value="imposter" class="reportbtn"> 타인을 사칭합니다.
                        </label>
                    </td>
                </tr>
                <tr>
                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
                        <label class="small">
                            <input type="radio" name="report" value="profilePhoto" class="reportbtn"> 부적절한 프로필 사진 
                        </label>
                    </td>
                </tr>
                <tr>
                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
                        <label class="small">
                            <input type="radio" name="report" value="feed" class="reportbtn"> 부적절한 게시글 사진 및 내용
                        </label>
                    </td>
                </tr>
                <tr>
                    <td style=" vertical-align: middle;" class="text-left p-0 pl-5">
                        <label class="small">
                            <input type="radio" name="report" value="etc" class="reportbtn"> 기타
                        </label>
                    </td>
                </tr>
                   

              <tr class="etc" style="display: none;">
                  <th colspan="4" class="pl-4">기타 내용</th>
              </tr>
              <tr class="etc" style="display: none;">
                <td colspan="4" class="text-center p-0">
<textarea cols="45" rows="3" id="etcContent"></textarea>
                </td>
              </tr>
          
          
          </table>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="reportthis()">신고하기</button>
        </div>
  
      </div>
    </div>
  </div>
		
		
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
   
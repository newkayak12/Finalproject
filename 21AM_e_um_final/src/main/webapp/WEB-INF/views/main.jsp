<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <style>
    	*{
    		 border: 1px black solid 
    	}
    </style>
    
    <script>
    	 $('.carousel').carousel({ interval: 5000 }); 
    	 
    	 const profileRoot=(index)=>{
    		 console.log(index)
    		 
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
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot(${list.indexOf(i) })">
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
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot(${i.userName })">
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
		            	 	
								      	<span class="m-0 md-m-2 d-flex flex-column justify-content-around" data-toggle="modal" data-target="#profile" onclick="profileRoot(${i.userName })">
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
				<div class="modal-header">
				  <h4 class="modal-title" id="xlmodalLoginTitle">회원가입</h4>
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		  
				<!-- Modal body -->
				<div class="modal-body" id="xlmodalbody">
					<div id="profileRoot" class= "p-0 d-flex justify-content-center align-content-center flex-column"style="min-height: 300px">
					
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
   
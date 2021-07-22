<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<link href="<c:url value="${path }/resources/css/hyelin.css" />" rel="stylesheet">
    
<section class="mt-5 pt-5">
<div id="root" class="container mt-5">
    <form action="" method="post" class="mt-3 mx-md-5">
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="search_friend" name="searchFri" placeholder="닉네임, 지역, 관심사로 나와 꼭 맞는 친구를 찾아보세요!">
            <div class="input-group-append">
                <button id="searchFriBtn" class="btn btn-success" type="submit">검색</button>
            </div>
        </div>

        <div id="searchFriDetail" data-toggle="collapse" data-target="#demo" style="font-weight:bold">> 상세 검색</div>
        <div id="demo" class="container p-3 my-3 border collapse searchFri_size">
            <div>
                <div style="font-family: 'twayair';">성별</div>
                <div class="row">
                    <div class="fribtn choice-1 m-2"><span class="genBtn">남</span></div>
                    <div class="fribtn choice-1 m-2"><span class="genBtn">여</span></div>
                    <div class="fribtn choice-1 m-2"><span class="genBtn">무관</span></div>
                </div>
            </div><br>
            <div>
                <div style="font-family: 'twayair';">지역</div>
                <div class="row">
                    <div class="fribtn choice-1 m-2"><span class="addBtn">서울</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">인천</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">부산</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">대전</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">광주</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">대구</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">울산</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">경기</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">강원</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">충북</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">충남</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">전북</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">전남</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">경북</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">경남</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">세종</span></div>
                    <div class="fribtn choice-1 m-2"><span class="addBtn">제주</span></div>
                </div>
            </div><br>
            <div>
                <div style="font-family: 'twayair';">연령</div>
                <div class="row">
                    <div class="fribtn choice-1 m-2"><span class="ageBtn">무관</span></div>
                    <div class="fribtn choice-1 m-2"><span class="ageBtn">20대</span></div>
                    <div class="fribtn choice-1 m-2"><span class="ageBtn">30대</span></div>
                    <div class="fribtn choice-1 m-2"><span class="ageBtn">40대</span></div>
                </div>
            </div><br>
            <div>
                <div style="font-family: 'twayair';">관심사</div>
                <div class="d-flex mt-1" style="display:inline-block">
                	<div class="mark col-1"><b>운동</b></div>
                	<div class="d-flex flex-wrap col-11">
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">축구</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">농구</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">야구</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">eSports</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">골프</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">등산</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">헬스</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">요가</span></div>
	                    <div class="fribtn choice-5 m-2"><span class="interBtn">자전거</span></div>
                	</div>
                </div>
                <div class="d-flex mt-1" style="display:inline-block">
                	<div class="mark col-1"><b>MBIT</b></div>
                	<div class="d-flex flex-wrap col-11">
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
                	</div>
                </div>
                <div class="d-flex mt-1" style="display:inline-block">
                	<div class="mark col-1"><b>취미</b></div>
                	<div class="d-flex flex-wrap col-11">
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
                </div>
            </div><br>
        </div>
    </form>

    <div id="friList" class="row mt-5">
        <!--9~12개만 뽑고 나머지는 무한 스크롤-->
        <c:forEach var="u" items="${list }" varStatus="status">
        	<c:if test="${status.index < 12}">
		        <div class="friUser col-sm-6 col-lg-4 mb-5">
		            <button class="container btn btn-outline-light align-items-center text-dark d-flex p-2 mh-100" data-toggle="modal" title="${u.userId }">
		                <img src="${path }/resources/upload/profile/${u.profileImageFile}" class="frismImg col mw-75 mh-100" title="${u.userId }">
		                <div class="col" title="${u.userId }">
		                	<div><h5 title="${u.userId }"><b><c:out value="${u.userNick }"/></b></h5></div><br>
		                	<small><b>
		                		<div class="d-flex flex-wrap" title="${u.userId }">
				                	<span title="${u.userId }" class="mx-1">
					                	<c:if test="${u.interest.profileInterestName1 !=null}">
					                		<c:out value="${u.interest.profileInterestName1 }"/>
					                	</c:if>
				                	</span>
				                	
				                	<span title="${u.userId }" class="mx-1">
					                	<c:if test="${u.interest.profileInterestName2 !=null}">
					                		<c:out value="${u.interest.profileInterestName2 }"/>
					                	</c:if>
				                	</span>
				                	<span title="${u.userId }" class="mx-1">
					                	<c:if test="${u.interest.profileInterestName3 !=null}">
					                		<c:out value="${u.interest.profileInterestName3 }"/>
					                	</c:if>
				                	</span>
				                	<span title="${u.userId }" class="mx-1">
					                	<c:if test="${u.interest.profileInterestName4 !=null}">
					                		<c:out value="${u.interest.profileInterestName4 }"/>
					                	</c:if>
				                	</span>
				                	<span title="${u.userId }" class="mx-1">
					                	<c:if test="${u.interest.profileInterestName5 !=null}">
					                		<c:out value="${u.interest.profileInterestName5 }"/>
					                	</c:if>
				                	</span>
		                		</div>
		                	</b></small>
		                </div>
		            </button>
		        </div>
			</c:if>
        </c:forEach>
    </div>

    <!-- 친구 누르면 나오는 모달창 -->
    <div class="modal fade" id="friSmModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        		
				<div id="userInfoModal">
               	</div>
            </div>
        </div>
    </div>

    <script>
    	$(".choice-1").click(e=>{
    		$(e.target).toggleClass("choCon");
    		if($(e.target).hasClass("choCon")){
    			$(e.target).parent().siblings().find("span").removeClass("choCon");
    		}
    		console.log($(e.target));
    		console.log($(e.target).html());
    	})
    	
    	$(".choice-5").click(e=>{
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
    	
    	$(".friUser").click(e=>{
    		/* console.log(e.target);
    		console.log(e.target.title); */
    		$.ajax({
    			type:"post",
    			url:"${pageContext.request.contextPath}/friend/openmodal/start",
    			data:{"userId":e.target.title},
    			success:data=>{
    				$("#userInfoModal").html(data);
    				$('#friSmModal').modal("show");
    			}
    		})
    	})
    
        /* $(function(){
             let index=0;
             $(window).scroll(function(){
                 let $window=$(this);
                 let scrollTop=$window.scrollTop();
                 let windowHeight=$window.height();
                 let documentHeight=$(document).height();
                 // console.log(windowHeight);
                 // console.log("documentHeight: "+documentHeight+" | scrollTop: "+scrollTop+" | windowHeight: "+windowHeight);
                 if(scrollTop+windowHeight+1>=documentHeight){
                     index++;
                     setTimeout(fetchlist,200);
                 }
             })
         })

         function fetchlist(){
             $.ajax({
                 type: "get",
                 url: "${pageContext.request.contextPath}/friend/infiniteScroll",
                 success: function(friends){
                     for(var i=0; i<friends.lists.length; i++){
                         let friend=friends.lists[i];
                         $("#friList").append(
                            
                         )
                     }
                 }
             })
         } */
    </script>
</div>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
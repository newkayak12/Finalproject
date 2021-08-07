<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="d-flex flex-wrap" style="font-family:'Noto Sans Kr';">
	<div id="demo" class="carousel slide col-xl-6 p-3" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<c:if test="${feed.feedImage2!=null}">
				<li data-target="#demo" data-slide-to="1"></li>
			</c:if>
			<c:if test="${feed.feedImage3!=null}">
				<li data-target="#demo" data-slide-to="2"></li>
			</c:if>
		</ul>
		
		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active" style="background-color:black;">
				<div class="carouselImgDiv m-auto">
					<img src="${path }/resources/upload/feed/${feed.feedImage1}" alt="피드 이미지 1" class="feedImg2">
				</div>
			</div>
			<c:if test="${feed.feedImage2!=null}">
				<div class="carousel-item" style="background-color:black;">
					<div class="carouselImgDiv m-auto">
						<img src="${path }/resources/upload/feed/${feed.feedImage2}" alt="피드 이미지 2" class="feedImg2">
					</div>
				</div>
			</c:if>
			<c:if test="${feed.feedImage3!=null}">
				<div class="carousel-item" style="background-color:black;">
					<div class="carouselImgDiv m-auto">
						<img src="${path }/resources/upload/feed/${feed.feedImage3}" alt="피드 이미지 3" class="feedImg2">
					</div>
				</div>
			</c:if>
		</div>
		
		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

    <div id="feedCC" class="col-xl-6 my-3">
        <div id="feedBtn" class="d-flex align-content-center">
            <!-- 버튼 -->
            <div class="mr-auto d-flex align-content-center">
            	<c:set var="likeFlag" value="far"/>
            	<c:set var="likeLoop" value="false"/>
            	<c:forEach var="k" items="${like }">
            		<c:if test="${not likeLoop }">
            			<c:choose>
            				<c:when test="${k.likeFeedId==userSession.userId }">
            					<c:set var="likeFlag" value="fas"/>
            					<c:set var="likeLoop" value="true" />
			            	</c:when>
		            	</c:choose>
		            </c:if>
	            </c:forEach>
	            <c:choose>
	            	<c:when test="${likeFlag=='fas' }">
			            <i class="fas fa-heart pointer" onclick="fn_unlike('${feed.feedSeq}');"></i><!-- 색칠 하트 -->
	            	</c:when>
	            	<c:otherwise>
			            <i class="far fa-heart pointer" onclick="fn_like('${feed.feedSeq}');"></i><!-- 빈 하트 -->
	            	</c:otherwise>
	            </c:choose>
	            <span class="ml-2 mr-4">${fn:length(like) }</span>
	            <i class="far fa-comment-alt"></i>
	            <span class="ml-2">${fn:length(comment) }</span>
            </div>
            <div style="font-size:14px;">
            	<c:if test="${feed.feederId==userSession.userId}">
		            <span class="likeLink pointer" onclick="fn_modifyFeedOpen('${feed.feedSeq}')" data-dismiss="modal">수정</span>
		            <span> | </span>
		            <span class="likeLink pointer" onclick="fn_deleteFeed('${feed.feedSeq}')">삭제</span>
	            </c:if>
	            <c:if test="${feed.feederId!=userSession.userId}">
		            <a href="#" id="reportPop" data-toggle="hover" data-placement="bottom" data-content="신고">
                        <img alt="신고"  class="m-2"  src="${pageContext.request.contextPath }/resources/images/user/siren.png" onclick="fn_report('${feed.feedSeq }', '${feed.feederId }','${userSession.userId }')" width="20px" data-toggle="modal" data-target="#ReportModal">
                    </a>
	            </c:if>
            </div>
        </div>
        <div class="my-4 p-3" style="border:1px dotted #b8d8d7">
            <!-- 피드 내용 -->
            <div style="color:gray;">
            	<small><fmt:formatDate value="${feed.feedDate }" pattern="yy.MM.dd"/></small>
            </div><br>
            ${feed.feedContents }
        </div>
        <div>
            <!-- 덧글창 -->
            <div id="feedCommentShow">
                <!--덧글-->
				
				<c:if test="${fn:length(comment)!=0 }">
					<c:forEach var="c" items="${comment }">
						<c:choose>
							<c:when test="${c.feedCommentLevel>1 }">
				                <!--답글 폼-->
				                <div class="d-flex ml-5 mt-3 mb-1 align-items-center">
				                    <img alt="프로필사진" class="commImg mr-2" src="${path }/resources/upload/profile/${c.commenterProfile}">
				                    <div class="mr-auto">
				                        <div>
				                            <span><b class="mr-2">${c.commenterNick }</b> ${c.feedCommentContents }</span>
				                        </div>
				                        <div>
				                            <small>
				                                <span><fmt:formatDate value="${c.feedCommentDate }" pattern="yy.MM.dd"/></span>
				                            </small>
				                        </div>
				                    </div>
				                    <c:if test="${userSession.userNick==c.commenterNick }">
				                    	<div class="my-auto pointer" onclick="fn_delComm('${c.feedCommentSeq}')">&times;</div>
				                    </c:if>
				                </div>
							</c:when>
			                <c:otherwise>
				                <!--일반 덧글 폼-->
				                <div class="commentHead d-flex mt-3 mb-1 align-items-center">
				                    <img alt="프로필사진" class="commImg mr-2" src="${path }/resources/upload/profile/${c.commenterProfile}">
				                    <div class="mr-auto">
				                        <div>
				                            <span><b class="mr-2">${c.commenterNick }</b> ${c.feedCommentContents }</span>
				                        </div>
				                        <div>
				                            <small>
				                                <span><fmt:formatDate value="${c.feedCommentDate }" pattern="yy.MM.dd"/></span>
				                                <span class="ml-1 mt-1 pointer likeLink writeFccBtn"><b>답글 달기</b></span>
				                            </small>
				                        </div>
				                    </div>
				                    <c:if test="${userSession.userNick==c.commenterNick }">
				                    	<div class="my-auto pointer" onclick="fn_delComm('${c.feedCommentSeq}')">&times;</div>
				                    </c:if>
				                    <c:if test="${userSession.userNick!=c.commenterNick }">
				                    	<a href="#" id="reportPop" data-toggle="hover" data-placement="bottom" data-content="신고">
				                    		<img alt="신고"  class="m-2"  src="${pageContext.request.contextPath }/resources/images/user/siren.png" onclick="fn_report('${c.feedCommentSeq }', '${c.commenter }','${userSession.userId }')" width="20px" data-toggle="modal" data-target="#ReportModal">
				                    	</a>
				                    </c:if>
				                </div>
				                <div class="fccbox d-flex d-none align-items-center">
				                	<i class="fas fa-arrow-right d-none mr-2" style="font-size:20px;"></i>
				                	<input name="fcccContents" type="text" class="form-control form-control-sm d-none">
				                	<div class="input-group-append d-none">
					                    <button class="btn cancelBtn btn-sm" type="submit" onclick="fn_writefeedCC('${feed.feedSeq}','${c.feedCommentSeq}','${c.commenter }');" style="width:50px;"><small>작성</small></small></button>  
					                </div>
				                </div>
			                </c:otherwise>
			        	</c:choose>
					</c:forEach>
				</c:if>
            </div>
            
            <div class="d-flex mt-3">
            <!--덧글 입력-->
                <input id="fcc" name="feedCommentContents" type="text" class="form-control">
                <div class="input-group-append">
                    <button class="btn writeBtn" type="submit" onclick="fn_writefeedComm('${feed.feedSeq}');">작성</button>  
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 신고 모달 -->
<div class="modal" id="ReportModal">
    <div class="modal-dialog ">
      <div class="modal-content">

    <div class="modal-header">
          <h4 class="modal-title mainColor">신고하기</h4>
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
          <button type="button" class="cancelBtn" data-dismiss="modal">닫기</button>
          <button type="button" class="checkBtn" data-dismiss="modal" onclick="reportthis()">신고하기</button>
        </div>
  
      </div>
    </div>
  </div>

<script>
	function fn_delComm(fcSeq){
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/profile/deleteFeedComment",
				data:{"fcSeq":fcSeq},
				success:data=>{
					if(data>0){
						alert("댓글이 삭제되었습니다.");
					}else{
						alert("댓글이 삭제되지 않았습니다.");
					}
					fn_openFeedModal('${feed.feedSeq}');
				}
			})
		}
	}
	
	function fn_modifyFeedOpen(feedSeq){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/profile/modifyFeed/start",
			data:{"feedSeq":feedSeq},
			success:data=>{
				$("#writeModal .modal-title").html("피드 수정");
				$("#writeModal .modal-body").html(data);
				$("#writeModal").modal("show");
			}
		})
	}
	
	function fn_deleteFeed(feedSeq){
		if(confirm("피드를 삭제하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/profile/deleteFeed",
				data:{"feedSeq":feedSeq},
				success:data=>{
					if(data>0){
						alert("피드가 삭제되었습니다.");
						$("#feedDetailModal").modal("hide");
						location.replace("${pageContext.request.contextPath}/profile/open/${feed.feederId}");
					}else{
						alert("피드가 삭제되지 않았습니다.");
						fn_openFeedModal(feedSeq);
					}
				}
			})
		}
	}
	
	function  fn_unlike(feedSeq){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/profile/unlike",
			data:{"feedSeq":feedSeq},
			success:data=>{
				fn_openFeedModal(feedSeq);
			}
		})
	}
	
	function  fn_like(feedSeq){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/profile/like",
			data:{
				"feedSeq":feedSeq,
				"profileId":'${feed.feederId}'
				},
			success:data=>{
				fn_openFeedModal(feedSeq);
			}
		})
	}
	
	function fn_writefeedComm(feedSeq){
		//답글인지 그냥 덧글인지 플래그를 같이 받아서 구분하고 입력받으면 될 듯
		
		const maxByte = 200;
	    const text_val = $("input#fcc").val();
	    const text_len = text_val.length;
	    
	    let totalByte=0;
	    for(let i=0; i<text_len; i++){
	    	const each_char = text_val.charAt(i);
	        const uni_char = escape(each_char);
	        if(uni_char.length>4){
	            totalByte += 2;
	        }else{
	            totalByte += 1;
	        }
	    }
	    
	    if(totalByte>maxByte){
	    	alert('최대 200Byte까지만 입력가능합니다.');
	    	
	    } else{
	    	$.ajax({
	    		type:"post",
	    		url:"${pageContext.request.contextPath}/profile/writeFeedComment",
	    		data:{
	    			"feedSeq":feedSeq,
	    			"fcc":text_val,
	    			"profileId":'${feed.feederId}'
	    		},
	    		success:data=>{
	    			fn_openFeedModal(feedSeq);
	    		}
	    	})
	    }
	}
	
	$("#reportPop").popover({ trigger: "hover" });
	
	$("span.writeFccBtn").click(e=>{
		//console.log($(e.target).parentsUntil("div.commentHead").parent().eq(0).next());
		let fccBox=$(e.target).parentsUntil("div.commentHead").parent().eq(0).next();
		fccBox.toggleClass("d-none");
		fccBox.children().toggleClass("d-none");
	})
	
	function fn_writefeedCC(feedSeq, feedCommentSeq, commenter){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/profile/writeFeed2ndComment",
			data:{
				"feedSeq":feedSeq,
				"feedCommentSeq":feedCommentSeq,
				"commenter":commenter,
				"content":$("input[name=fcccContents]").val()
			},
			success:data=>{
				if(data>0){
					fn_openFeedModal('${feed.feedSeq}');
					$("div.fccbox").addClass("d-none");
					$("div.fccbox").children().addClass("d-none");
				}
			}
		})
	}
</script>
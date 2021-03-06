<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!--본인 css 파일 포함시켜주세요-->

<link href="${pageContext.request.contextPath}/resources/css/woosik.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">

<script>
	$(function(){
		likecheck();
		commentlist();
	})
	function likecheck(){
		$.ajax({
			url : "<%=request.getContextPath()%>/group/checkLikeBoard",
			data : {
				"groupSeq" : "${board.groupSeq}",
				"groupBoardSeq" : "${board.groupBoardSeq}",
				"userId" : "${userSession.userId}"
			},
			success : data=>{
				console.log(data);

				if(data['likeboard']=='okay'){
					$("#like").removeClass("far fa-heart").addClass("fas fa-heart")
				} else if(data['likeboard']=='no') {
					$("#like").removeClass("fas fa-heart").addClass("far fa-heart")

				}
			}
		})
	}
	
	function commentlist(){
		$.ajax({
			url : "${path}/board/boardcommentlist",
			data : {
				"groupBoardSeq" : "${board.groupBoardSeq}"
			},
			success : data=>{
				console.log(data);
				$("#test1").html(data);
			}
		})
	}
	
	
	function fn_boardcomment(){
		
		let board = $("#boardcontext").val();
		if(board.length<=0){
			alert("내용을 입력하세요");
		}
		else{
		$.ajax({
			url : "<%=request.getContextPath()%>/group/addcomment",
			data : {
				"groupBoardSeq" : "${board.groupBoardSeq}",
				"userId" : "${userSession.userId}",
				"groupCommentContents" : $("#boardcontext").val()
			},
			success : data=>{
				console.log(data);
				if(data>0){
					commentlist();
				}
				else{
					alert("정상적으로 입력되지 않았습니다.");
					}
				}
			})
		}
	}
	function fn_del(del){
		console.log(del);
		$.ajax({
			url : "${path}/group/delcomment",
			data : {
				"groupCommentSeq" : del
			},
			success : data=>{
				console.log(data);
				if(data>0){
					commentlist();
				}
				else{
					alert("정상적으로 삭제되지 않았습니다.");
				}
			}
		})
	}

	const fn_boardlike = (e) =>{
		
		if($(e.target).attr("class") =='far fa-heart' && `${ session.userId}` !=null){
			
			$.ajax({
				url : "${path}/group/addBoardLike",
				data : {
					"groupSeq" : "${board.groupSeq}",
					"groupBoardSeq" : "${board.groupBoardSeq}",
					"userId" : "${session.userId}"
				},
				success : data => {
					if(data == 'success'){
						console.log("추가되니?");
						
						$("#like").removeClass("far fa-heart")
						$("#like").attr("class", "fas fa-heart").css({ "color" : "#2AC1BC !important" });
						
						
					}
				}
			});
		}
		else if( $(e.target).attr("class") == 'fas fa-heart' && `${session.userId}` !=null){
			
			$.ajax({
				url : "${path}/group/delBoardLike",
				data : {
					"groupSeq" : "${board.groupSeq}",
					"groupBoardSeq" : "${board.groupBoardSeq}",
					"userId" : "${session.userId}"
				},
				success : data => {
					console.log("삭제되니?");
					
					$("#like").removeClass("fas fa-herat")
					$("#like").attr("class", "far fa-heart").css({ "color" : "rgb(201,201,201)" });
				}
			});
		}
	}
</script>

<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
		<form id="boardContentsFrm"
			action="${path }/group/groupBoardContents.do" method="post">
			<input type="hidden" value="${board.groupBoardSeq }"
				name="groupBoardSeq" id="tesss" />
			<input type="hidden" value="${board.groupSeq }"
				name="groupSeq" id="tsdads"/>
			
			<div>
				<!--  <label>제목</label> -->
				<h2 class="tway">
					<c:out value="${board.groupBoardTitle }" />
				</h2>
			</div>
			<div class="w_board">
				<label class="w_boardCont_tit">작성자</label>
				<p>
					<c:out value="${board.groupBoardUser.userId }" />
				</p>
			</div>
			<div class="w_board">
				<label class="w_boardCont_tit">내용</label> ${board.groupBoardContents }
			</div>
			<div>
				<label class="w_boardCont_tit">사진</label>
				<div class="p-1">
					<%-- <p><c:out value="${board.groupBoardPhoto}"/></p> --%>
					<c:if test="${board.groupBoardPhoto ne null}">
						<c:if test="${board.groupBoardPhoto.groupBoardPhoto1 ne null }">
							<img width="150px" height="150px"
								src="${path }/resources/upload/board/${board.groupBoardPhoto.groupBoardPhoto1} ">
						</c:if>
						<c:if test="${board.groupBoardPhoto.groupBoardPhoto2 ne null }">
							<img width="150px" height="150px"
								src="${path }/resources/upload/board/${board.groupBoardPhoto.groupBoardPhoto2} ">
						</c:if>
						<c:if test="${board.groupBoardPhoto.groupBoardPhoto3 ne null }">
							<img width="150px" height="150px"
								src="${path }/resources/upload/board/${board.groupBoardPhoto.groupBoardPhoto3} ">
						</c:if>
					</c:if>
				</div>
			</div>

			<div class="test1">
			
				<c:if test="${likeboard ne null }">
					<div id="likeicon" class="like" onclick="fn_boardlike(event);">
						<div class="board-icon">
							<i class="fas fa-heart" id="like"
								style="color: #2AC1BC !important;"></i>
						</div>
						<span style="font-size: 15px; font-weight: 900;" id="likecontent"
							style="color : #2AC1BC !important;">좋아요</span>
					</div>
				</c:if>
				<c:if test="${likeboard eq null }">
					<div id="likeicon" class="like" onclick="fn_boardlike(event);">
						<div class="board-icon w_board_icon">
							<i class="far fa-heart" id="like"
								style="color: rgb(201, 201, 201);"></i>
						</div>
						<span style="font-size: 15px; font-weight: 900;"
							id="unlikecontent" style="color : lightgray !important;">좋아요</span>
					</div>
				</c:if>
			</div>
			
			<table style="font-size:14px;" id="test1">
				
			</table>

			<div class="w_board_comment">
				<label>댓글</label> <input type="text" class="form-control"
					placeholder="입력해" id="boardcontext">
					
				<button type="button" class="btn btn-primary" id="boardcomment" onclick="fn_boardcomment();">댓글입력</button>
			</div>
		</form>
	</div>
</section>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
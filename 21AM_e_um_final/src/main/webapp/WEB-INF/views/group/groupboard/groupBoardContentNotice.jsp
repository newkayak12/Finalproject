<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!--본인 css 파일 포함시켜주세요-->

<script>
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
</script>


<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
		<form id="boardContentsFrm"
			action="${path }/group/groupBoardContentsNotice.do" method="post">
			<input type="hidden" value="${board.groupBoardSeq }"
				name="groupBoardSeq" id="tesss" />
			<input type="hidden" value="${board.groupSeq }"
				name="groupSeq" id="tsdads"/>
			
			<div>
				
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
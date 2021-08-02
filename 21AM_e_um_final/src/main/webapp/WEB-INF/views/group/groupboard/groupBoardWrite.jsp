<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--본인 css 파일 포함시켜주세요-->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor/js/service/HuskyEZCreator.js">
</script>
    
    
<section class="mt-5 pt-5">
	
   <div id="root" class="container mt-5">
   <form method="post" action="${path }/group/groupBoardInsert.do" enctype="multipart/form-data">
   	  <div>
   	  	<input type="hidden" name="groupSeq" value="${groupSeq }">
   	  
   	  	
   	  </div>
      <div>
      	제목 : 
      		<input name="groupBoardTitle" id="title" size="80" placeholder="제목을입력하세요">
      </div>
      
      	내용 : 
      		<div>
      			<textarea id="ir1" name="groupBoardContents" rows="10" cols="95" placeholder="내용을입력하세요">
      			</textarea>
      		</div>
      <br>
      <label>파일 : </label>
      
      <div>
	      <div>
	      	<input multiple="multiple" type="file" class="form-control-file border" name="file">
	      </div>
	      
      </div>
      
      <div>		
      	<button type="submit" id="writebtn" name="submit">확인</button>
      </div>
		
   
   </form>
   </div>
</section>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ir1",
		sSkinURI : "<%=request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			bUserToolbar : true,
			bUseVerticalResizer : false,
			bUseModeChanger : false
			
		}
		
	});
</script>   
<script type="text/javascript">
window.onload = function(){
	var btn = document.getElementById("writebtn");
	btn.onclick = function(){
		submitContents(btn);
	}
}
function submitContents(elClickeObj){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		elClickedObj.form.submin();
	} catch (e) {
		
	}
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
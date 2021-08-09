<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<link href="${pageContext.request.contextPath}/resources/css/hyelin.css" rel="stylesheet">
    
<section class="mt-5 pt-5">
	<div id="root" class="container mt-5">
		<h2 class="mb-5 tway">고객센터</h2>
        <div>
            <div class="d-flex flex-wrap mb-5">
                <div id="faqMenu" class="col-md-3 col-12">
                    <ul id="faqMenuList" class="tway">
                        <li>
                            <div class="faqMenuDiv pointer">친구 찾기</div>
                        </li>
                        <li>
                            <div class="faqMenuDiv pointer">소모임</div>
                        </li>
                        <li>
                            <div class="faqMenuDiv pointer">플레이스</div>
                        </li>
                        <li>
                            <div class="faqMenuDiv pointer">기타</div>
                        </li>
                    </ul>
                </div>

                <div id="faqConList" class="col-md-9 col-12">
                    <div class="my-2 tway"><h3 id="faqCategoryTitle"></h3></div>
                    <div id="faqConListDiv" class="mt-3">
                        
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-5">
                <button type="button" class="btn checkBtn ml-4 btnWidth" onclick="location.assign('${pageContext.request.contextPath}/faq/open')">메인으로</button>
            </div>
        </div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	let flag='${flag}';
	
	$(function(){
		fn_fatchFAQ(flag);
	})
	
	$(".faqMenuDiv").click(e=>{
		$(".faqMenuDiv").removeClass("selectedFAQMenu");
		$(e.target).addClass("selectedFAQMenu");
		//console.log($(e.target).html());
		fn_fatchFAQ($(e.target).html());
	})
	
	function fn_fatchFAQ(flag){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/faq/getList",
			data:{flag:flag},
			success:list=>{
				$("#faqCategoryTitle").html(flag+" FAQ")
				$("#faqConListDiv").html(list);
			}
		})
	}
</script>
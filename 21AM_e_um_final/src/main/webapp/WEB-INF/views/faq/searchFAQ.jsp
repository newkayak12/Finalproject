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
        <form action="${pageContext.request.contextPath}/faq/searchResult" method="post" class="mt-3 mb-5 mx-md-5">
            <div class="input-group mb-3">
                <input type="text" class="form-control" id="searchFAQ" name="keyword" value="${keyword }">
                <div class="input-group-append">
                    <button id="searchFriBtn" class="btn btn-success searchBtn" type="submit">검색</button>
                </div>
            </div>
        </form>
        <div class="d-flex align-items-center flex-column">
            <div class="col-lg-9 col">
                <div class="mb-1"><small>검색 결과 <b>${fn:length(list)}</b>건</small></div>
                <div id="faqResult">
                	<c:if test="${list.size()>0 }">
						<c:forEach var="l" items="${list }">
		                    <div class="mb-3 resultbox pointer" onclick="location.assign('${pageContext.request.contextPath}/faq/view?flag=${l.questCategory }')">
		                        <div><h5><b>${l.faqTitle }</b></h5></div>
		                        <div>${fn:substring(l.faqContents,0,50) }...</div>
		                    </div>
		                </c:forEach>
		            </c:if>
                </div>
            </div>
        </div>
	</div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
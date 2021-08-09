<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="accordion" class="col">
	<c:if test="${list.size()>0 }">
		<c:forEach var="l" items="${list }">
		    <div class="card">
		        <div class="card-header">
		            <a class="card-link" data-toggle="collapse" href="#${l.faqSeq }">
		                <b>${l.faqTitle }</b>
		            </a>
		        </div>
		        <div id="${l.faqSeq }" class="collapse" data-parent="#accordion">
		            <div class="card-body">
		                ${l.faqContents }
		            </div>
		        </div>
		    </div>
	    </c:forEach>
    </c:if>
</div>
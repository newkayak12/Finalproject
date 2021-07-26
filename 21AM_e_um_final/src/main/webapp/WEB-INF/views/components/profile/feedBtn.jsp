<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:forEach var="f" items="${list }">
	<div class="box col-xs-6 col-lg-4 mb-3 d-flex justify-content-center">
		<img src="${path }/resources/upload/feed/${f['FEED_IMAGE1'] }" alt="피드 사진">
	</div>
</c:forEach>


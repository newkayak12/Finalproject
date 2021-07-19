<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<link href="<c:url value="${path }/resources/css/hyelin.css" />" rel="stylesheet">
    
 <section class="mt-5 pt-5">
    <div id="root" class="container mt-5">
		<form action="" method="post" class="mt-3 mx-md-5">
	        <div class="input-group mb-3 searchFri_size">
	            <input type="text" class="form-control" id="search_friend" name="searchFri" placeholder="나와 꼭 맞는 친구를 찾아보세요!">
	            <div class="input-group-append">
	                <button id="searchFriBtn" class="btn btn-success" type="submit">검색</button>
	            </div>
	        </div>
	
	        <div id="searchFriDetail" data-toggle="collapse" data-target="#demo" style="font-weight:bold">> 상세검색</div>
	        <div id="demo" class="container p-3 my-3 border collapse searchFri_size">
	            <div>
	                <div style="font-family: 'twayair';">성별</div>
	                <div class="row">
	                    <div class="col-3 col-xl-1 fribtn"><span>남</span></div>
	                    <div class="col-3 col-xl-1 fribtn"><span>여</span></div>
	                    <div class="col-4 col-xl-2 fribtn"><span>무관</span></div>
	                </div>
	            </div><br>
	            <div>
	                <div style="font-family: 'twayair';">지역</div>
	                <div class="row">
	                    <div class="col-6 col-lg-2 fribtn"><span>서울특별시</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>인천광역시</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>부산광역시</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>대전광역시</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>광주광역시</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>대구광역시</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>울산광역시</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>경기도</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>강원도</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>충청북도</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>충청남도</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>전라북도</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>전라남도</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>경상북도</span></div>
	                    <div class="col-6 col-lg-2 fribtn"><span>경상남도</span></div>
	                    <div class="col-6 col-lg-3 fribtn"><span>세종특별자치시</span></div>
	                    <div class="col-6 col-lg-3 fribtn"><span>제주특별자치도</span></div>
	                </div>
	            </div><br>
	            <div>
	                <div style="font-family: 'twayair';">연령</div>
	                <div class="row">
	                    <div class="col-3 col-xl-2 fribtn"><span>20대</span></div>
	                    <div class="col-3 col-xl-2 fribtn"><span>30대</span></div>
	                    <div class="col-3 col-xl-2 fribtn"><span>40대</span></div>
	                    <div class="col-3 col-xl-2 fribtn"><span>50대</span></div>
	                    <div class="col-3 col-xl-2 fribtn"><span>60대</span></div>
	                </div>
	            </div><br>
	            <div>
	                <div style="font-family: 'twayair';">관심사</div>
	            </div><br>
	        </div>
	    </form>
    </div>
</section>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<link href="<c:url value="${path }/resources/css/hyelin.css" />" rel="stylesheet">
    
<section class="mt-5 pt-5">
<div id="root" class="container mt-5">
    <form action="" method="post" class="mt-3 mx-md-5">
        <div class="input-group mb-3">
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
                    <div class="col-3 col-xl-2 fribtn"><span>무관</span></div>
                    <div class="col-3 col-xl-2 fribtn"><span>20대</span></div>
                    <div class="col-3 col-xl-2 fribtn"><span>30대</span></div>
                    <div class="col-3 col-xl-2 fribtn"><span>40대</span></div>
                </div>
            </div><br>
            <div>
                <div style="font-family: 'twayair';">관심사</div><!--부트 Filter Anything 사용-->
                <input type="text" class="form-control w-50 mt-2" id="searchInterest">
                <div id="interResult"></div>
            </div><br>
        </div>
    </form>

    <div id="friList" class="row mt-5">
        <!--9~12개만 뽑고 나머지는 무한 스크롤-->
        <div class="col-sm-6 col-lg-4 mb-4">
            <button class="container btn btn-outline-light text-dark border d-flex p-3 align-items-center" data-toggle="modal" data-target="#friSmModal">
                <img src="https://blog.kakaocdn.net/dn/IOYEi/btq1JzPmm2w/Jn7TB4RqutJNkyeAS8K0U1/img.jpg" class="frismImg border col w-50 h-100">
                <div class="col border">이름<br>관심사</div>
            </button>
        </div>
    </div>

    <!-- 친구 누르면 나오는 모달창 -->
    <div class="modal fade" id="friSmModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body d-flex align-items-center">
                    <img src="https://blog.kakaocdn.net/dn/IOYEi/btq1JzPmm2w/Jn7TB4RqutJNkyeAS8K0U1/img.jpg" class="frismImg border col w-50 h-100">
                    <div class="col border">이름<br>관심사<br>상태 메세지</div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-info mx-2" data-dismiss="modal">프로필로 이동</button>
                    <button type="button" class="btn btn-info mx-2" data-dismiss="modal">친구 신청</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // $(function(){
        //     let index=0;
        //     $(window).scroll(function(){
        //         let $window=$(this);
        //         let scrollTop=$window.scrollTop();
        //         let windowHeight=$window.height();
        //         let documentHeight=$(document).height();
        //         // console.log(windowHeight);
        //         // console.log("documentHeight: "+documentHeight+" | scrollTop: "+scrollTop+" | windowHeight: "+windowHeight);
        //         if(scrollTop+windowHeight+1>=documentHeight){
        //             index++;
        //             setTimeout(fetchlist,200);
        //         }
        //     })
        // })

        // function fetchlist(){
        //     $.ajax({
        //         type: "get",
        //         url: "",
        //         success: function(friends){
        //             for(var i=0; i<friends.lists.length; i++){
        //                 let friend=friends.lists[i];
        //                 $("#friList").append(
                            
        //                 )
        //             }
        //         }
        //     })
        // }
        
        $('#modal').modal("show"); //열기
    </script>
</div>
   

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
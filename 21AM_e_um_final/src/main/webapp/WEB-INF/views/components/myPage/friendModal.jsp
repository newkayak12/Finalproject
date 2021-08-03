<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Nav tabs -->
<ul id="infoTab" class="nav nav-tabs nav-fill tway"  role="tablist">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#nickname">내 친구 목록</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#password">친구 신청 목록</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#address">차단 친구 목록</a>
    </li>
</ul>

<!-- Tab panes -->
<div class="tab-content my-5">
    <div class="tab-pane container active" id="nickname">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
            	<colgroup>
            		<col class="col-5">
            		<col class="col-7">
            	</colgroup>
                <tbody>
                    <tr>
                        <td class="colend"><b>현재 닉네임</b></td>
                        <td>${userSession.userNick }</td>
                    </tr>
                    <tr>
                        <td class="colend"><b>변경할 닉네임</b></td>
                        <td><input type="text" id="newNick" name="newNick" onkeyup="fn_checkNick()" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="NickSign"><small></small></td>
                    </tr>
                </tbody>
            </table>
            <button id="NickChangeBtn" class="btn changeBtn mt-4" onclick="fn_changeNick()">변경하기</button>
        </div>
    </div>

    <div class="tab-pane container fade" id="password">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
            	<colgroup>
            		<col class="col-5">
            		<col class="col-7">
            	</colgroup>
                <tbody>
                    <tr>
                        <td class="colend"><b>기존 비밀번호</b></td>
                        <td><input type="password" id="oldpw" name="oldpw" onkeyup="fn_sameOldPw()" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="oldpwSign"><small></small></td>
                    </tr>
                    <tr>
                        <td class="colend"><b>신규 비밀번호</b></td>
                        <td><input type="password" id="newpw" name="newpw" required onkeyup="fn_pw_normaliztion()"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="newpwSign"><small></small></td>
                    </tr>
                    <tr>
                        <td class="colend"><b>비밀번호 확인</b></td>
                        <td><input type="password" id="pwck" name="pwck" required onkeyup="fn_pwCheck()"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="pwckSign"><small></small></td>
                    </tr>
                </tbody>
            </table>
            <button id="pwChangeBtn" class="btn changeBtn mt-4" onclick="fn_changePw()">변경하기</button>
        </div>
    </div>

    <div class="tab-pane container fade" id="address">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <table class="table table-borderless col-xl-6 col bgColor fakeborder">
            	<colgroup>
            		<col class="col-4">
            		<col class="col-8">
            	</colgroup>
                <tbody>
                    <tr>
                        <td colspan="2" class="colcenter">
                            <b>기존 주소</b><br>
                            <small>${userSession.userAddrZip } ${userSession.userAddrBasic } ${userSession.userAddrDetails }</small><br>
                        </td>
                    </tr>
                    <tr>
                        <td class="colend"><b>우편번호</b></td>
                        <td>
                            <input type="text" name="zonecode" id="sample6_postcode" readonly>
                         <input type="button" id="btnPostcode" class="btn_post_search pointer" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
                        </td>
                    </tr>
                    <tr>
                        <td class="colend"><b>주소</b></td>
                        <td>
                            <input type="text" name="address" id="sample6_address" placeholder="주소" readonly style="width:300px;"><br>
                            <input type="text" name="addressSub" id="sample6_detailAddress" placeholder="상세주소" required style="width:300px">
                        </td>
                    </tr>
                </tbody>
            </table>
            <button id="addrChangeBtn" class="btn changeBtn mt-4" onclick="fn_changeAddr()">변경하기</button>
        </div>
    </div>
</div>
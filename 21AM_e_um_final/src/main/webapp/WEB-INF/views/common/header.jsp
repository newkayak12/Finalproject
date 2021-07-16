<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:set var="path" value="<%=request.getContextPath() %>" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="${path }/resources/css/main.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<div id="header-content">
		<!--로고 자리-->
		<div style="font-family: 'Arizonia', cursive; font-size:30px; font-weight: bold;">E_UM</div>
		
		<!--메뉴-->
		<div id="head_menu">
		    <ul>
		        <li><a href="">친구 찾기</a></li>
		        <li><a href="">소모임</a></li>
		        <li id="head_menu_place">플레이스
		            <ul class="head_submenu">
		                <li><a href="">맛집</a></li>
		                <li><a href="">영화</a></li>
		            </ul>
		        </li>
		    </ul>
		</div>
		
		<!--아이콘 메뉴-->
		<div id="icon_menu">
		    <img id="head_person" class="headericon" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik00MzcuMDIsMzMwLjk4Yy0yNy44ODMtMjcuODgyLTYxLjA3MS00OC41MjMtOTcuMjgxLTYxLjAxOEMzNzguNTIxLDI0My4yNTEsNDA0LDE5OC41NDgsNDA0LDE0OA0KCQkJQzQwNCw2Ni4zOTMsMzM3LjYwNywwLDI1NiwwUzEwOCw2Ni4zOTMsMTA4LDE0OGMwLDUwLjU0OCwyNS40NzksOTUuMjUxLDY0LjI2MiwxMjEuOTYyDQoJCQljLTM2LjIxLDEyLjQ5NS02OS4zOTgsMzMuMTM2LTk3LjI4MSw2MS4wMThDMjYuNjI5LDM3OS4zMzMsMCw0NDMuNjIsMCw1MTJoNDBjMC0xMTkuMTAzLDk2Ljg5Ny0yMTYsMjE2LTIxNnMyMTYsOTYuODk3LDIxNiwyMTYNCgkJCWg0MEM1MTIsNDQzLjYyLDQ4NS4zNzEsMzc5LjMzMyw0MzcuMDIsMzMwLjk4eiBNMjU2LDI1NmMtNTkuNTUxLDAtMTA4LTQ4LjQ0OC0xMDgtMTA4UzE5Ni40NDksNDAsMjU2LDQwDQoJCQljNTkuNTUxLDAsMTA4LDQ4LjQ0OCwxMDgsMTA4UzMxNS41NTEsMjU2LDI1NiwyNTZ6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=" />
		
		    <img id="head_message" class="headericon" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTExLjk5OSA1MTEuOTk5IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTEuOTk5IDUxMS45OTk7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxnPg0KCTxnPg0KCQk8cGF0aCBkPSJNNTEwLjE1Niw0MDEuODQzTDQ4MC40MTksMzE1LjNjMTQuMzM0LTI5LjMwMiwyMS45MDktNjEuODksMjEuOTYtOTQuNjc5YzAuMDg4LTU3LjAxMy0yMS45Ny0xMTAuOTItNjIuMTEyLTE1MS43OQ0KCQkJQzQwMC4xMTcsMjcuOTUzLDM0Ni42MTUsNC45NDIsMjg5LjYxNSw0LjAzOUMyMzAuNTEsMy4xMDUsMTc0Ljk1NCwyNS41ODcsMTMzLjE4Nyw2Ny4zNTMNCgkJCWMtNDAuMjc0LDQwLjI3My02Mi42MTIsOTMuMzY2LTYzLjMxOSwxNTAuMTAyQzMwLjE3NCwyNDcuMzQxLDYuNzQ1LDI5My45MzYsNi44MjIsMzQzLjcwNQ0KCQkJYzAuMDM3LDIzLjI5LDUuMjc5LDQ2LjQ0MSwxNS4yMTIsNjcuMzc2TDEuNTUxLDQ3MC42ODljLTMuNTIxLDEwLjI0Ny0wLjk0OSwyMS4zNzMsNi43MTMsMjkuMDM1DQoJCQljNS4zOTIsNS4zOTMsMTIuNTAxLDguMjY0LDE5LjgxMiw4LjI2NGMzLjA3NiwwLDYuMTg4LTAuNTA4LDkuMjIzLTEuNTUxbDU5LjYwOS0yMC40ODNjMjAuOTM1LDkuOTMzLDQ0LjA4NiwxNS4xNzUsNjcuMzc2LDE1LjIxMg0KCQkJYzAuMDg0LDAsMC4xNjQsMCwwLjI0OCwwYzUwLjUxLTAuMDAyLDk3LjQ2LTI0LjAzNSwxMjcuMjM3LTY0LjcwMmMzMC45ODctMC44MTYsNjEuNjQ2LTguMzE3LDg5LjM2My0yMS44NzZsODYuNTQ0LDI5LjczOA0KCQkJYzMuNjA2LDEuMjM5LDcuMzA0LDEuODQzLDEwLjk1OSwxLjg0M2M4LjY4OCwwLDE3LjEzNi0zLjQxMiwyMy41NDUtOS44MjJDNTExLjI4NCw0MjcuMjQyLDUxNC4zNCw0MTQuMDIxLDUxMC4xNTYsNDAxLjg0M3oNCgkJCSBNMTY0LjUzLDQ3MC42OWMtMC4wNjUsMC0wLjEzNCwwLTAuMTk5LDBjLTIwLjYxNC0wLjAzMS00MS4wODUtNS4xMTMtNTkuMTk2LTE0LjY5NWMtMy43MjQtMS45NjktOC4wOTYtMi4zMS0xMi4wNzgtMC45NDINCgkJCWwtNjEuMTIzLDIxLjAwM2wyMS4wMDMtNjEuMTIyYzEuMzY4LTMuOTgzLDEuMDI4LTguMzU1LTAuOTQyLTEyLjA3OGMtOS41ODItMTguMTEyLTE0LjY2NC0zOC41ODItMTQuNjk2LTU5LjE5Nw0KCQkJYy0wLjA1MS0zMy4xNTksMTIuODQ4LTY0LjU4OCwzNS40MDUtODguMTIyYzcuMzY4LDQ0LjkxNiwyOC43NzUsODYuMzA2LDYxLjk1NywxMTguODk4DQoJCQljMzIuOTM3LDMyLjM1MSw3NC4zMzksNTIuOTQ5LDExOS4wMTEsNTkuNjgzQzIzMC4wODQsNDU3LjM2NywxOTguMjg4LDQ3MC42OSwxNjQuNTMsNDcwLjY5eiBNNDgwLjYyOCw0MTQuNzk3DQoJCQljLTAuODY3LDAuODY3LTEuODk1LDEuMTAzLTMuMDUxLDAuNzA1bC05Mi42NDgtMzEuODM2Yy0xLjYwOS0wLjU1My0zLjI4My0wLjgyNy00Ljk1MS0wLjgyN2MtMi40NTksMC00LjkwOSwwLjU5NS03LjEyNiwxLjc2OQ0KCQkJYy0yNi40NTMsMTMuOTk0LTU2LjM0NSwyMS40MTYtODYuNDQ3LDIxLjQ2MmMtMC4wOTksMC0wLjE4OSwwLTAuMjg4LDBjLTEwMC44NjMsMC0xODQuMTc2LTgxLjkzNC0xODUuNzc0LTE4Mi43NzMNCgkJCWMtMC44MDUtNTAuNzg1LDE4LjUxMy05OC41MTQsNTQuMzk0LTEzNC4zOTVjMzUuODgxLTM1Ljg4MSw4My42MTgtNTUuMTkyLDEzNC4zOTYtNTQuMzkyDQoJCQljMTAwLjkzNiwxLjYwMSwxODIuOTI2LDg1LjA2OCwxODIuNzcsMTg2LjA2M2MtMC4wNDcsMzAuMTAyLTcuNDY4LDU5Ljk5NS0yMS40NjEsODYuNDQ2Yy0xLjk3LDMuNzIzLTIuMzEsOC4wOTUtMC45NDIsMTIuMDc4DQoJCQlsMzEuODM1LDkyLjY0OEM0ODEuNzMyLDQxMi45MDUsNDgxLjQ5NCw0MTMuOTMyLDQ4MC42MjgsNDE0Ljc5N3oiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCgk8Zz4NCgkJPHBhdGggZD0iTTM3Ni44OTIsMTM5LjUxMmgtMTgxLjU2Yy04LjQxNiwwLTE1LjIzOCw2LjgyMy0xNS4yMzgsMTUuMjM4YzAsOC40MTYsNi44MjMsMTUuMjM4LDE1LjIzOCwxNS4yMzhoMTgxLjU2DQoJCQljOC40MTYsMCwxNS4yMzgtNi44MjMsMTUuMjM4LTE1LjIzOEMzOTIuMTMsMTQ2LjMzNSwzODUuMzA4LDEzOS41MTIsMzc2Ljg5MiwxMzkuNTEyeiIvPg0KCTwvZz4NCjwvZz4NCjxnPg0KCTxnPg0KCQk8cGF0aCBkPSJNMzc2Ljg5MiwyMDIuMTgzaC0xODEuNTZjLTguNDE2LDAtMTUuMjM4LDYuODIzLTE1LjIzOCwxNS4yMzhzNi44MjMsMTUuMjM4LDE1LjIzOCwxNS4yMzhoMTgxLjU2DQoJCQljOC40MTYsMCwxNS4yMzgtNi44MjMsMTUuMjM4LTE1LjIzOFMzODUuMzA4LDIwMi4xODMsMzc2Ljg5MiwyMDIuMTgzeiIvPg0KCTwvZz4NCjwvZz4NCjxnPg0KCTxnPg0KCQk8cGF0aCBkPSJNMzA3LjAwNCwyNjQuODUySDE5NS4zMzFjLTguNDE2LDAtMTUuMjM4LDYuODIzLTE1LjIzOCwxNS4yMzhjMCw4LjQxNiw2LjgyMywxNS4yMzgsMTUuMjM4LDE1LjIzOGgxMTEuNjcyDQoJCQljOC40MTYsMCwxNS4yMzgtNi44MjMsMTUuMjM4LTE1LjIzOEMzMjIuMjQxLDI3MS42NzUsMzE1LjQyLDI2NC44NTIsMzA3LjAwNCwyNjQuODUyeiIvPg0KCTwvZz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjwvc3ZnPg0K" />
		
		    <img id="head_alarm" class="headericon" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik0yNTYsMGMtMzcuNTU0LDAtNjguMTEsMzAuNTU2LTY4LjExLDY4LjExdjIwLjU1aDM1LjIyOVY2OC4xMWMwLTE4LjEzMSwxNC43NTUtMzIuODgxLDMyLjg4MS0zMi44ODENCgkJCWMxOC4xMzEsMCwzMi44ODcsMTQuNzQ5LDMyLjg4NywzMi44ODF2MjAuNTVoMzUuMjI5VjY4LjExQzMyNC4xMTYsMzAuNTU2LDI5My41NTUsMCwyNTYsMHoiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCgk8Zz4NCgkJPHBhdGggZD0iTTMwNC4xNDcsNDI5LjIwNWMwLDI2LjIyOC0yMS4zMzcsNDcuNTY1LTQ3LjU2LDQ3LjU2NWgtMS4xNzRjLTI2LjIyMiwwLTQ3LjU2LTIxLjMzNy00Ny41Ni00Ny41NjVoLTM1LjIyOQ0KCQkJYzAsNDUuNjU3LDM3LjEzOCw4Mi43OTUsODIuNzg5LDgyLjc5NWgxLjE3NGM0NS42NTEsMCw4Mi43ODktMzcuMTM4LDgyLjc4OS04Mi43OTVIMzA0LjE0N3oiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCgk8Zz4NCgkJPHBhdGggZD0iTTQ4My45NTIsNDIyLjYyM2wtNTAuMDQzLTc3Ljg1MXYtOTkuOTI4YzAtOTkuMDcxLTc5LjgxMi0xNzkuNjctMTc3LjkwOC0xNzkuNjdjLTk4LjEwMiwwLTE3Ny45MDgsODAuNTk5LTE3Ny45MDgsMTc5LjY3DQoJCQl2OTkuOTI4bC01MC4wNDMsNzcuODQ1Yy0zLjQ4OCw1LjQxOS0zLjczNCwxMi4zMTMtMC42NDYsMTcuOTY3YzMuMDg4LDUuNjU0LDkuMDEzLDkuMTc3LDE1LjQ2LDkuMTc3aDQyNi4yNzUNCgkJCWM2LjQ0NywwLDEyLjM3MS0zLjUyMywxNS40NTQtOS4xNzFDNDg3LjY4Niw0MzQuOTM2LDQ4Ny40NCw0MjguMDQzLDQ4My45NTIsNDIyLjYyM3ogTTc1LjEyNyw0MTQuNTMybDM1LjM5NC01NS4wNjMNCgkJCWMxLjgyNi0yLjgzNiwyLjgwMS02LjE0OCwyLjgwMS05LjUyNFYyNDQuODQ0YzAtNzkuNjQyLDY0LjAwNi0xNDQuNDQsMTQyLjY3OS0xNDQuNDRjNzguNjc5LDAsMTQyLjY3OSw2NC43OTksMTQyLjY3OSwxNDQuNDQNCgkJCXYxMDUuMTAxYzAsMy4zNzYsMC45NjksNi42ODIsMi43OTUsOS41MjRsMzUuMzk0LDU1LjA2M0g3NS4xMjd6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=" />
		</div>
	</div>
</header>

<!-- <style>
header{
    display:flex;
    justify-content:space-around;
    height:150px;
    align-items: center;
}
#head_menu a{
    text-decoration: none;
    color:black;
}
#head_menu>ul{
    padding:0;
    margin:0;
}
#head_menu ul li{
    list-style-type: none;
    font-family: 'twayair';
}
#head_menu li:hover{
    color:rgb(4, 82, 131);
}
#head_menu a:hover{
    color:rgb(4, 82, 131);
}
#head_menu>ul>li{
    margin:0 50px 0 50px;
    font-size: 20px;
}
#head_menu li{
    display: inline-block;
    width:80px;
    text-align:center;
    position:relative;
    padding:10px 0 10px;
}
ul.head_submenu{
    padding:20px 0 20px 0;
    position:absolute;
    font-size: 15px;
    left:-8px;
    width:100px;
    top:50px;
    background-color:rgb(165, 205, 230);
    opacity: 0;
    transition: all 0.15s ease-in;
    visibility: hidden;
}
ul.head_submenu li{
    padding:5px 10px 5px 10px;
    width:100px;
}
#head_menu_place:hover .head_submenu {
    opacity: 1;
    visibility: visible;
}

.headericon{
    width:25px;
    height:25px;
    margin:10px;
}



/*section css*/
#root{
    border:1px red solid;
    min-height: 500px;
    margin: 30px 10% 10px 10%;
}
</style> -->
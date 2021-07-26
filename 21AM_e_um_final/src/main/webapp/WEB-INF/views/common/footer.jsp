
<style>
	.footer {
	  position: relative;
	  height : 130px;
	  left: 0;
	  bottom: 0;
	  width: 100%;
	  background-color: #70b3d9;
	  color: white;
	  text-align: center;
	  padding : 10px;
	}
	.footer p {
		margin: 1px;
		font-size : 10px;
	}
    .list-inline {
        text-align: center;
    }
    .list-inline-item {
        display: inline-block;
        margin-left: 10px;
        margin-right: 10px;
    }
    .list-inline-item a {
        text-decoration: none;
        color: rgb(47, 50, 57);
        font-family:'Noto Sans KR';
    }
    .footer-basic .copyright {
        margin-top: 15px;
        text-align: center;
        font-size: 13px;
        color: white;
        margin-bottom: 0;
    }
    
   
</style>
<script type="text/javascript">

</script>

<div id="footerContainer" class="" >
	<div class="d-flex justify-content-around mb-4 p-2 border col-12">
		<span id="controlpanelprev"></span>
		<span id="controlpanelfooter"></span>
		<span id="controlpanelnext"></span>
	</div>
	<div id="footerinnerContainer">
	
	</div>
		
</div>


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
<footer class="footer mt-5 pt-0 dockbar">
	<div id="icon_menu" class="iconboxfooter pr-2 pl-2 mt-2 mb-2  col-12 m-0 d-flex justify-content-around" style="height:fit-content;">
            
            
                <i class="fas fa-user fa-lg  p-2 fa-7x ml-4" style="font-size:50px" onclick="fn_showprofilebot()"></i>
                <div class="border"></div>
                <span class="pt-1" id="alarmCountbot" style="position: fixed; bottom: 40px; right:235px; border-radius: 100%; background-color: rgba(255, 0, 0, 0.8); color: white; display:block; width: 30px; height: 30px"></span>
                <i class="fas fa-bell fa-lg  p-2 fa-7x" style="font-size:50px" onclick="fn_showalarmbot()"></i>
                <div class="border"></div>
                <i class="fas fa-comments fa-lg p-2 fa-7x mr-4" style="font-size:50px"></i>
     </div>
     


	<div class="footerInfo">
	    <ul class="list-inline">
	        <li class="list-inline-item"><a href="#">Home</a></li>
	        <li class="list-inline-item"><a href="#">Services</a></li>
	        <li class="list-inline-item"><a href="#">About</a></li>
	        <li class="list-inline-item"><a href="#">Terms</a></li>
	        <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
	    </ul>
	    <p class="copyright">E_um | address : ... | email : eum@eum.com</p>
	    <p class="copyright">team | kimsanghyun kimyejin kimtaehui leewoosik janghyerin</p>
	    <p class="copyright">Copyright Â©2021 E_um Co.Ltd.All rights reserved</p>
    </div>
    
</footer>



</body>
</html>
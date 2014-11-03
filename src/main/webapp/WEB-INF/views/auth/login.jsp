<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>SKT VoLTE Monitoring</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/common.css'/>" />
	<script src="<c:url value='/resources/js/luuf.js'/>"></script> 
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script>
		$(document).ready(function () {
			$("#j_password").keypress(function (event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				
				if (keycode == 13) 
					login();
			});		
		});
		
		function login() {
			var email = document.getElementById("j_username").value;
			var password = document.getElementById("j_password").value;
			
			if (!validateString(email)) {
				$(".login06").html("Please enter a email address");
				return;
			}
			
			if (!validateString(password)) {
				$(".login06").html("Please enter a valid password");
				return;
			}
			
			document.frm.submit();
		}
		
	</script>
</head>
 
<body> 
<!-- 로그인 영역 -->
<div class="wrap_loginBox">	
	<form name="frm" action="<c:url value='/j_spring_security_check'/>" method="post">
	<fieldset>
	<legend>로그인 영역</legend>                                       
	<div class="login_area">
		<p class="login01">Email</p>  
		<p class="login02"><input type="text" name="j_username" class="input_loginCheck" id="j_username" style="width:190px;" value="admin@bitceramics.com"/></p>
		<p class="login03">Password</p>
		<p class="login04"><input type="password" name="j_password" class="input_login" id="j_password" style="width:190px;"value="" /></p>		                       
		<p class="login05">
			<a id="btnLogin" class="btnLogin" href="javascript:login();"><strong>Login</strong></a>
			<a id="btnReset" class="btnLogin" href="javascript:document.frm.reset();"><strong>Reset</strong></a>
		</p>
		<p class="login06">
<c:if test="${not empty _ERROR_CAUSE_}">
			${_ERROR_CAUSE_}
</c:if>		
		</p>
	</div>
	</fieldset>
	</form>
</div>
<!--//  로그인 영역 -->
</body>
</html>
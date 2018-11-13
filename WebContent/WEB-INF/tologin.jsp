<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="css/style_grey.css" />
<style>
input[type=text] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}

input[type=password] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}

#loginform\:codeInput {
	margin-left: 1px;
	margin-top: 1px;
}

#loginform\:vCode {
	margin: 0px 0 0 60px;
	height: 34px;
}
</style>
<script type="text/javascript">
	if(window.self != window.top){
		window.top.location = window.location;
	}
</script>
</head>
<body>
	
	<div class="main-inner" id="mainCnt"
		style="width: 900px; height: 440px; overflow: hidden; position: absolute; left: 50%; top: 50%; margin-left: -450px; margin-top: -220px; ">
		<div class="login" style="margin-top: 80px; height: 255px;">
			<div class="loginFunc">
				<div class="loginFuncMobile">用户注册</div>
			</div>
			<div class="loginForm">
				<form id="loginform"  method="post" class="niceform" action="tologin">
					<div class="loginFormIpt showPlaceholder" style="margin-top: 5px;">
						<input type="text" name="uname"	class="loginFormTdIpt" maxlength="50" />
						<label for="idInput"  class="placeholder" >帐号：</label>
					</div>
					<div class="forgetPwdLine"></div>
					<div class="loginFormIpt showPlaceholder">
						<input  class="loginFormTdIpt" type="password"	name="pwd"  />
						<label for="pwdInput"  class="placeholder" >密码：</label>
					</div>
					<div class="loginFormIpt loginFormIptWiotTh"
						style="margin-top:58px;">
						
						<a onclick="document.getElementById('loginform').submit()" name="loginform:j_id19">
						<span class="btn btn-login"
							style="margin-top:-36px;">注册</span>
						</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>
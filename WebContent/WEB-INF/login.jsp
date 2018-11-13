<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
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
				<div class="loginFuncMobile">登录</div>
			</div>
			<div class="loginForm">
				<form id="loginform"  method="post" class="niceform" action="login">
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
						<div id="codeInputLine" class="loginFormIpt showPlaceholder"
							style="margin-left:0px;margin-top:-40px;width:50px;">
							<input id="loginform:codeInput" class="loginFormTdIpt" type="text"
								name="checkcode" title="请输入验证码" />
							<img id="loginform:vCode" src="validatecode.jsp"
								onclick="javascript:document.getElementById('loginform:vCode').src='validatecode.jsp?'+Math.random();" />
						</div>
						<a onclick="document.getElementById('loginform').submit()" name="loginform:j_id19">
						<span class="btn btn-login"
							style="margin-top:-36px;">登录</span>
						</a>
					</div>
					<%
					String code=(String)session.getAttribute("code");
						
					if("1".equals(code)){
					%>
					<div align="center" >
					
					<br/>
					//想让“验证码错误”这句话只显示几秒钟，不一直显示，该怎么办？
					<font color="red">验证码输入错误</font>
					
					</div>
					<%}else if("2".equals(code)){ %> 
					<div align="center" >
					
					<br/>
					
					<font color="red">用户名输入错误</font>
					
					</div>
					<%}else if("3".equals(code)){ %>
					<div align="center" >
					
					<br/>
					
					<font color="red">密码输入错误</font>
					
					</div>
					<%} %>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>
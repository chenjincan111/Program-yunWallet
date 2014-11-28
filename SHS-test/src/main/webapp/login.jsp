<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>YUN - CloudCoin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
<link href="${path}/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="${path}/style/style-main.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="${path}/bootstrap/js/html5shiv.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="bootstrap/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="bootstrap/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="bootstrap/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="bootstrap/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="bootstrap/ico/favicon.png">
</head>

<body>
	<jsp:include page="header.jsp" />

	<jsp:include page="wallet_header.jsp" />

	<div class="container" style="margin-top: 10px;">
		<div class="span6">
			<div class="page-header">
				<h3>Welcome Back</h3>
				<small>Please enter your login details below:</small>
			</div>
			<div class="form-horizontal">
				<form id="frm" method="post" action="${path}/login"
					onsubmit="return check();">
					<div class="control-group">
						<label class="control-label">E-Mail:</label>
						<div class="controls">
							<input id="email" name="email" type="text" value=""
								placeholder="Enter your email" autocomplete="off">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Password:</label>
						<div class="controls">
							<input id="passWord" name="passWord" type="password" value=""
								placeholder="Enter you password" autocomplete="off">
						</div>
					</div>
					<br />

					<div class="control-group">
						<div class="controls">
							<img title="点击更换" onclick="javascript:refreshCode(this);"
								src="imageServlet"> <br />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label">Captcha:</label>
						<div class="controls">
							<input type="text" id="captcha" name="captcha" value="" size="10"
								style="float: none; width: 200px; min-width: 200px" />
						</div>
					</div>
			</div>
			<div class="form-actions">
				<button id="smt" class="btn btn-primary" id="login-continue">Open
					Wallet</button>
			</div>
			</form>
		</div>
		<div class="span5">
			<div class="page-header">
				<h3>Forgotten Something?</h3>
				<small>Help! I've locked myself out of my account</small>
			</div>
			<h4>Lost Identifier or Alias</h4>
			<p>If you have lost your wallet identifier first check the
				confirmation email you received during sign up. Can't find the
				email? Click the button below and we can send you a new one.</p>
			<p align="right">
				<a class="btn btn-small btn-secondary recover-wallet-btn">Recover
					Wallet</a>&nbsp;<a href="${path }/regist.jsp"
					class="btn btn-small btn-secondary recover-wallet-btn">注册新钱包</a>
			</p>

		</div>
	</div>

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${path}/bootstrap/js/jquery.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-transition.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-alert.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-modal.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-dropdown.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-scrollspy.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-tab.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-tooltip.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-popover.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-button.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-collapse.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-carousel.js"></script>
	<script src="${path}/bootstrap/js/bootstrap-typeahead.js"></script>
	<script type="text/javascript">
	
		function refreshCode(pic) {
			pic.src = 'imageServlet?'+new Date().getTime();
		}
		
		//email格式
		 function isEmail(s)  
		 {  
			 var patrn=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; 
			 if (!patrn.exec(s)) {return false;}  
			 return true;  
		 }
		
		function check() {
			var email = $("#email").val();
			var passWord = $("#passWord").val();
			var captcha = $("#captcha").val();

			if (email == '') {
				alert("请输入你注册时填写的电子邮箱！");
				$("email").focus();
				return false;
			}else{
				if (!isEmail(email)) {
					alert("Email格式不正确");
					$("email").focus();
					return false;
				}
			}
				
			if (passWord == '') {
				alert("请输入你的登陆密码！");
				$("passWord").focus();
				return false;
			}

			if (captcha == '') {
				alert("验证码不能为空");
				$("#captcha").focus();
				return false;
			}
			return true;
		}
	</script>


</body>
</html>

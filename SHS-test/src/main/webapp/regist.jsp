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

	<div class="quickstart">
		<div class="container" id="new-wallet">
			<div style="margin: 0 auto; width: 485px">
				<h3 class="padded">
					Create A New Wallet. <br /> <small>Please choose an alias
						and password for the new wallet.</small>
				</h3>

				<div class="form-horizontal">
					<form id="new-wallet-form" action="${path}/regist" method="post"
						onsubmit="return check();">
						<div class="control-group">
							<label class="control-label">Email:</label>
							<div class="controls">
								<input id="email" plceholder="Email Address" name="email"
									size="30" type="text" />

								<p class="help-block">
									<small>(Optional)</small> - We will email you a link to your
									new wallet.
								</p>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Password:</label>
							<div class="controls">
								<input id="passWord" name="passWord" size="30" type="password" />
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Confirm Password:</label>
							<div class="controls">
								<input id="rpassWord" name="rpassWord" size="30" type="password" />
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
								<input type="text" id="captcha" name="captcha" value=""
									size="10" style="float: none; width: 200px; min-width: 200px" />
							</div>
						</div>

						<div class="form-actions">
							<button class="btn btn-primary" id="new-wallet-continue">Continue</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 10px;">
		<div id="notices"></div>
	</div>

	<div class="container" style="margin-top: 10px;" id="password-strength">
		<div class="alert alert-block alert-info" data-alert="alert">
			<a class="close" href="#">&times;</a>
			<p>
				<strong>Don't Forget Your Password!</strong><br /> WARNING:
				Forgotten passwords are UNRECOVERABLE and will results in <b>LOSS
					of ALL of your CloudCoin!</b>
			</p>
		</div>


		<div class="well">
			<h3>Password Strength</h3>

			<p>We require a password of at least 10 characters in length to
				ensure that even if our database is compromised your wallet will
				remain secure. A password 10 characters in length will take over
				1000 years to decrypt.</p>

			<ul id="password-warnings"></ul>
			<div class="alert alert-block alert-info" style="display: none"
				id="password-result"></div>
		</div>

		<div class="well">
			<h3>Already registered?</h3>

			If you already have a My Wallet account <a href="${path}/login.jsp">Proceed
				To Login</a>
		</div>

		<div class="alert alert-block alert-important">
			Please read our <a href="${path}/termsofservice">Terms of Service</a>.
		</div>
	</div>

	<div id="mnemonic-modal" class="modal hide">
		<div class="modal-header">
			<div style="float: right; display: inline-block; padding-top: 5px">
				<img src="${path}/images/password_24.png">
			</div>
			<h3>Wallet Recovery Mnemonic</h3>
		</div>

		<div class="modal-body">
			<p>Your wallet has been created successfully. If you forget the
				details the phrase below can be used to recover everything.</p>

			<p>
				<b>Please Write Down the Following:</b>
			</p>

			<p class="well" id="mnemonic"></p>

			<p align="center" style="color: red; font-weight: bold;">Do not
				save the mnemonic on your PC or in your email drafts! Write it down
				or print it!</p>

			<p>
				Without the mnemonic we cannot help recover forgotten passwords and
				will result in <b>LOSS of ALL of your bitcoins!</b>.
			</p>
		</div>

		<div class="modal-footer">
			<div class="pull-right">
				<button class="btn btn-success">Print</button>

				<button class="btn btn-primary">Continue</button>
			</div>
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
	
		function check() {
			var email = $("#email").val();
			var passWord = $("#passWord").val();
			var rpassWord = $("#rpassWord").val();
			var captcha = $("#captcha").val();

			if (email == '' ) {
				alert("电子邮箱不能为空！");
				$("#email").focus();
				return false;
			}
			
			if (passWord == '') {
				alert("密码不能为空！");
				$("#passWord").focus();
				return false;
			}
			
			if (rpassWord == '' ) {
				alert("请确认密码！");
				$("#rpassWord").focus();
				return false;
			}
			
			
			if (captcha == '' || captcha == null) {
				alert("验证码不能为空");
				$("#captcha").focus();
				return false;
			}
			return true;
		}
	</script>


</body>
</html>

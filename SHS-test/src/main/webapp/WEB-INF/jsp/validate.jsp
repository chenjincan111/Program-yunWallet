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
<link href="${path}/bootstrap/css/bootstrap.css" rel="stylesheet">
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
	href="${path}/bootstrap/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${path}/bootstrap/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${path}/bootstrap/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${path}/bootstrap/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="bootstrap/ico/favicon.png">
</head>

<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="wallet_header.jsp" />

	<div class="container" style="margin-top: 10px;">
		<div class="span5">
			<div class="page-header">
				<h3>Wallet validate</h3>
				<small>* 设置个性化的用户名可以让汇款方回显到你，以确认你的身份；</small><br /> <small>*
					请将你邮件中收到的验证码输入到‘验证码’文本框中；</small>
			</div>

			<div class="form-horizontal">
				<form id="frm" method="post" action="${path}/validate" onsubmit="return check();">
					<div class="control-group">
						<label class="control-label">用户名:</label>
						<div class="controls">
							<input id="userName" name="userName" type="text"
								value="${user.userName }" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label">验证码:</label>
						<div class="controls">
							<input id="vcode" name="vcode" type="text" value="" />
						</div>
					</div>
					<div class="form-actions">
						<button id="smt" class="btn btn-primary" id="login-continue">账户验证</button>
					</div>
				</form>
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
		function check() {
			var userName = $("#userName").val();
			var vcode = $("#vcode").val();

			if (userName == '' ) {
				alert("用户不能为空！");
				$("#userName").focus();
				return false;
			}
			if (vcode == '' ) {
				alert("验证码不能为空！");
				$("#vcode").focus();
				return false;
			}
		}	
	</script>
</body>
</html>

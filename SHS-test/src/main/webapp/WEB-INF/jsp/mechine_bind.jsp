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

	<div class="container" style="margin-top: 10px;">
		<div class="span5">
			<div class="page-header">
				<h3>矿机绑定</h3>
				<small>* 暂时只提供由Btcwto出售的矿机绑定到钱包；</small><br /> 
			</div>

			<div class="form-horizontal">
				<form id="frm" method="post" action="${path}/mechine/binding">
					<div class="control-group">
						<label class="control-label">BTCWTO用户名:</label>
						<div class="controls">
							<input id="userName" name="userName" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">矿机编码:</label>
						<div class="controls">
							<input id="m_id" name="m_id" type="text" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">绑定矿机的MAC地址:</label>
						<div class="controls">
							<input id="mac" name="mac" type="text" />
						</div>
					</div>
					<div class="form-actions">
						<button id="smt" class="btn btn-primary" id="login-continue">提交绑定</button>
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
</body>
</html>

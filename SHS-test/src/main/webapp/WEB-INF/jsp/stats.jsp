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

	<div class="container-fluid" style="width: 85%; margin: 0 auto;">
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header" style="border-style: none;">
					<h1>
						Currency Stats <small>CloudCoin currency statistics</small>
					</h1>
				</div>

				<table class="table table-striped">
					<tr>
						<td width="60%">Blocks Mined</td>
						<td colspan="2">${poolStats.blockMined }</td>
					</tr>
					<tr>
						<td width="60%">Time Between Blocks</td>
						<td colspan="2">${poolStats.timeBetween }(minutes)</td>
					</tr>
					<tr>
						<td>YBI Mined</td>
						<td colspan="2">${poolStats.ybiMined }YBI</td>
					</tr>

					<!-- 
					<tr>
						<th colspan="3">Market Summary</th>
					</tr>
					<tr>
						<td>Market Price</td>
						<td>¥${marketStats.price } RMD (weighted)</td>
						<td><a href="#"><img src="images/chart_bar.png"
								border="0"></a></td>

					</tr>
					<tr>
						<td>Trade Volume</td>
						<td colspan="2">¥${marketStats.volume } RMB (TODAY)</td>
					</tr>
					<tr>
						<td>Trade Volume</td>
						<td colspan="2">12,565.12 YBI</td>
					</tr>
					
					 -->
					<tr>
						<th colspan="3">Hash Rate and Electricity Consumption</th>
					</tr>
					<tr>
						<td>Difficulty</td>
						<td colspan="2">--</td>
					</tr>
				</table>

				<div style="clear: both; padding-top: 20px; width: 100%;">
					<p>All statistics are for the previous 24 hour period unless
						otherwise stated</p>
				</div>


			</div>

			<hr>

			<footer>
				<p>&copy; 童颜堂投资 2014</p>
			</footer>

		</div>
		<!--/.fluid-container-->

		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="bootstrap/js/jquery.js"></script>
		<script src="bootstrap/js/bootstrap-transition.js"></script>
		<script src="bootstrap/js/bootstrap-alert.js"></script>
		<script src="bootstrap/js/bootstrap-modal.js"></script>
		<script src="bootstrap/js/bootstrap-dropdown.js"></script>
		<script src="bootstrap/js/bootstrap-scrollspy.js"></script>
		<script src="bootstrap/js/bootstrap-tab.js"></script>
		<script src="bootstrap/js/bootstrap-tooltip.js"></script>
		<script src="bootstrap/js/bootstrap-popover.js"></script>
		<script src="bootstrap/js/bootstrap-button.js"></script>
		<script src="bootstrap/js/bootstrap-collapse.js"></script>
		<script src="bootstrap/js/bootstrap-carousel.js"></script>
		<script src="bootstrap/js/bootstrap-typeahead.js"></script>
</body>
</html>

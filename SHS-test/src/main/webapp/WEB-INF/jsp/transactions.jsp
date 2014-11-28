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
				<h3>Transactions List</h3>
				<small>钱包汇出记录:</small>
			</div>
			<table class="table table-striped" style="margin-top: -35px">
				<tr>
					<th>To Address</th>
					<th>Time</th>
					<th>Amount</th>
				</tr>
				<c:forEach var="obj" items="${outlog.currentList}">
					<tr>
						<td><c:out value="${obj.toAddress }"></c:out></a></td>
						<td><c:out value="${obj.genTime }"></c:out></td>
						<td><button class="btn btn-success cb">
							<span data-c="9048255"><c:out value="${obj.amount }"></c:out> Ybi</span>
						</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="span5">
			<div class="page-header">
				<h3>Transactions List</h3>
				<small>钱包汇入记录:</small>
			</div>
			<table class="table table-striped" style="margin-top: -35px">
				<tr>
					<th>From Address</th>
					<th>Time</th>
					<th>Amount</th>
				</tr>
				<c:forEach var="obj" items="${inlog.currentList}">
					<tr>
						<td><c:out value="${obj.fromAddress }"></c:out></a></td>
						<td><c:out value="${obj.genTime }"></c:out></td>
						<td><button class="btn btn-success cb">
							<span data-c="9048255"><c:out value="${obj.amount }"></c:out> Ybi</span>
						</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>



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

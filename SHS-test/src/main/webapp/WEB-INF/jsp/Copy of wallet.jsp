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
		<div class="span6">
			<div class="page-header">
				<h3>Wallet Address List</h3>
				<small>我的钱包地址列表:</small>
			</div>
			<table class="table table-striped" style="margin-top: -35px">
				<tr>
					<th>Pay</th>
					<th>Address</th>
					<th>amount</th>
					<th>locked</th>
					<th>delete</th>
					<th>update</th>
				</tr>
				<c:forEach var="obj" items="${result.currentList}" varStatus="status">
					<tr style="display: none;">
					<td><a href='${path }/wallet_address?address=${obj.addressId }'>Go</a></td>
					<td id="ID_${status.index}">
						<c:out value="${obj.addressId }"></c:out></td>
						<td id="Name_${status.index}"><c:out value="${obj.amount }"></c:out></td>
						<td id="Telp_${status.index}"><c:out value="${obj.locked }"></c:out></td>
						<td><a href="${path }/delete?address=${obj.addressId }"><button>删除</button></a></td>
						<td><a href="#" id="modify_${status.index}" onclick="modify(${status.index})"><button>修改</button></a></td>
					</tr>
				</c:forEach>
			</table>

			<div>
				<a href="${path }/wallet?currentPage=${result.per }">上一页</a>|当前第${result.currentPage }页|共${result.allPage }页|<a
					href="${path }/wallet?currentPage=${result.next }">下一页</a>
			</div>
		</div>
		<div class="span5">
			<div class="page-header">
				<p align="right">
					<a class="btn btn-small btn-secondary recover-wallet-btn"
						href="${path }/newAddress">新建钱包</a> <a
						class="btn btn-small btn-secondary recover-wallet-btn" href="#">付款</a>
				</p>
			</div>
		</div>
	</div>



	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="${path}/bootstrap/js/jquery.js"></script>
	
	
	<script src="${path}/bootstrap/js/other.js"></script>
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

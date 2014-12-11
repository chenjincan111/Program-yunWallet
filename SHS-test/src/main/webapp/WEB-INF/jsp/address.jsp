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

	<div class="quickstart">
		<div class="container">
			<div class="row-fluid">
				<div class="span12">
					<h1>
						<span class="hidden-phone">My Wallet <small>Be Your
								Own Bank.</small></span>
					</h1>
				</div>
			</div>

			<div class="row-fluid" style="margin-top: 10px">
				<div class="span12 no-print">
					<ul class="nav nav-pills pull-left" style="margin-bottom: 3px">
						<li><a href="${path }/wallet" id="home-intro-btn">Wallet
								Home</a></li>
						<li><a id="my-transactions-btn">My Transactions</a></li>
						<li><a href="${path }/validate" class="hidden-phone"
							id="import-export-btn">validate</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 10px;">
		<div class="span6">
			<div class="page-header">
				<h3>Wallet Address List</h3>
				<small>我的钱包地址列表:</small>
			</div>
			<table class="table table-striped" style="margin-top: -35px">
				<tr>
					<th>Address</th>
					<th>amount</th>
					<th>locked</th>
				</tr>
				<c:forEach var="obj" items="${result.currentList}">
					<tr>
						<td><a
							href='${path }/wallet_address?address=${obj.addressId }'><c:out
									value="${obj.addressId }"></c:out></a></td>
						<td><c:out value="${obj.amount }"></c:out></td>
						<td><c:out value="${obj.locked }"></c:out></td>
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
						href="${path }/newAddress">新建钱包</a>
				</p>
			</div>

			<div class="form-horizontal">
				<form id="frm" method="post" action="${path}/payto"
					onsubmit="return check();">
					<div class="control-group">
						<label class="control-label">钱包地址:</label>
						<div class="controls">
							<input id="address" name="address" type="text"
								value="${wallet.addressId }" readonly="readonly" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">当前地址余额:</label>

						<div class="controls">
							<input id="currentAmount" name="currentAmount" type="text"
								value="${wallet.amount }" readonly="readonly" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">锁定:</label>
						<div class="controls">
							<input id="locked" name="locked" type="text"
								value="${wallet.locked }" readonly="readonly" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">转账地址:</label>
						<div class="controls">
							<input id="toAddress" name="toAddress" type="text" value="" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">回显信息:</label>
						<div class="controls">
							<input id="userName" name="userName" type="text" value="${LOGIN_USER.userName }"
								readonly="readonly" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">转账金额:</label>
						<div class="controls">
							<input id="amount" name="amount" type="text" value="" />
						</div>
					</div>
					<div class="form-actions">
						<button id="smt" class="btn btn-primary" id="login-continue">转出云币</button>
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
		$(document).ready(function() {
			var address = $("#toAddress").val();
			if (address == null || address == '') {
				return;
			}
			$("#toAddress").change(function() {
				var url = "${path}/addresswho.json?address=" + address;
				$.getJSON(url, function(result) {
					$.each(result, function(i, field) {
						$("#userName").attr("value", field);
					});
				});
				alert(htmlobj);
			});
		});

		function check() {
			var toAddress = $("#toAddress").val();
			var amount = $("#amount").val();
			//var currentAmount =  $("#currnetAmount").val();
			var locked =  $("#locked").val();
			
			if(locked!="false"){
				alert("账户被锁定，不能进行交易！");
				return false;
			}

			if (toAddress == '') {
				alert("请输入你要汇款的地址！");
				$("toAddress").focus();
				return false;
			}
			
			if (amount == ''){
				alert("请输入你要汇款的金额！");
				$("amount").focus();
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>

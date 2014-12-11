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
				<small>
					<input id="id_text" name="findW" style="color:#C0C0C0" type="text" value="input the address name" onclick="textChange1()" onblur="textChange2()" />
					<select id="id_sel" name="isLocked">
						<option value="2" selected="selected">All</option>
						<option value="1">true</option>	
						<option value="0">false</option>		
					</select>
					<input style="vertical-align: top" type="button" value="search" onclick="searchW()" />
				</small>
			</div>
			<table class="table table-striped" style="margin-top: -35px">
				<tr>
					<th>Address</th>
					<th>amount</th>
					<th>locked</th>
					<th>delete</th>
					<th>update</th>
				</tr>
				<c:forEach var="obj" items="${result.currentList}" varStatus="status">
					<tr id="id_tr1_${status.index}" style="display:table-row">
						<td><a
							href='${path }/wallet_address?address=${obj.addressId }'><c:out
									value="${obj.addressId }"></c:out></a></td>
						<td><c:out value="${obj.amount }"></c:out></td>
						<td><c:out value="${obj.locked }"></c:out></td>
						<td><a href="${path }/delete?address=${obj.addressId }"><button>删除</button></a></td>
						<td><a href="#"><button onclick="change(${status.index})">修改</button></a></td>
					</tr>
					<tr id="id_tr2_${status.index}" style="display: none;">
							
							<td><input style="width:125px" id='address${status.index}' type='input' name='address' value='${obj.addressId }' readonly=readonly></a></td>
							<td><input style="width:125px" id='amount${status.index}' type='input' name='amount' value='${obj.amount }'></td>
							<!--  td><input style="width:125px" id='locked' type='input' name='locked' value='${obj.locked }'></td>-->
							<td><select style="width:71px;height:24px;" id='locked${status.index}' name='locked'>
								<option value="true">true</option>
								<option value="false">false</option>
							</select></td>
							<td><a href="${path }/delete?address=${obj.addressId }"><button>删除</button></a></td>
							<td><a href="#"><button onclick="change(${status.index})">修改</button></a></td>
					
					</tr>
				</c:forEach>
			</table>

			<div>
				<a href="${path }/wallet?currentPage=0">首页</a> | <a href="${path }/wallet?currentPage=${result.per }">上一页</a> | 当前第${result.currentPage }页 | 共${result.allPage }页 | <a
					href="${path }/wallet?currentPage=${result.next }">下一页</a>|<a href="${path }/wallet?currentPage=${result.allPage }">尾页</a>
				<input style="width: 17px" type="text" id="id_gpage" name="tpage" value="${result.currentPage }" />   <button style="vertical-align:top;" onclick="goPage()">Go</button>
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
	<script type="text/javascript">
	
		function textChange1(){
			document.getElementById("id_text").value="";
		}
		function textChange2(){
			if(document.getElementById("id_text").value=="")
			    document.getElementById("id_text").value="input the address name";
		}
		
		function change(num){
			
			var tr1 = "id_tr1_"+num;
			var tr2 = "id_tr2_"+num;
			var trs1 = document.getElementById(tr1).style.display;
			var trs2 = document.getElementById(tr2).style.display;
			if(trs1!="none"){
				document.getElementById(tr1).style.display="none";
				document.getElementById(tr2).style.display="table-row";
			}else{
				
				var address = document.getElementById("address"+num).value;
				var locked = document.getElementById("locked"+num).value;
				var amount = document.getElementById("amount"+num).value;
				//alert(address);
				window.location.reload("/SHS-test/update?amount="+amount+"&locked="+locked+"&address="+address);
			}
		}
		
		function searchW(){
			var fw = document.getElementById("id_text").value;
			var il = document.getElementById("id_sel").value; 
			window.location.reload("/SHS-test/walletFind?findW="+fw+"&isLocked="+il);
			//window.location.reload("/SHS-test/update?amount="+amount);
		}
		
		function goPage(){
			var gpage = document.getElementById("id_gpage").value;
			window.location.reload("/SHS-test/wallet?currentPage="+gpage);
		}
	
	</script>
	
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

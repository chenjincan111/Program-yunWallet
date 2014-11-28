<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/base.jsp"%>
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
					<li><a href="${path }/wallet" id="home-intro-btn">Wallet Home</a></li>
					<li><a href="${path }/transactions" id="my-transactions-btn">My Transactions</a></li>
					<li><a href="${path }/validate" class="hidden-phone"
						id="import-export-btn">validate</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
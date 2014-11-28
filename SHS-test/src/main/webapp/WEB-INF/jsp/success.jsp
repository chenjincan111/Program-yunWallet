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

<div class="container" style="margin-top:10px;">
    <div id="notices"></div>
</div>

<div class="container" style="margin-top:10px;" id="password-strength">
    <div class="alert alert-block alert-info" data-alert="alert" >
        <a class="close" href="#">&times;</a>
        <p>
            <strong>SUCCESS!</strong><br />
            ${msg }</b>
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

  </body>
</html>

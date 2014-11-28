<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="utf-8" http-equiv="charset">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link media="screen" rel="stylesheet"
	href="${path}/bootstrap/css/bootstrap.min.css">
<title>Hello world</title>
</head>
<body>
	<div class="container" style="margin-top: 20px;">
		<form class="form-horizontal" action="${path}/demo/insert" method="post">
			<div class="control-group">
				<label class="control-label" for="title">Title</label>
				<div class="controls">
					<input type="text" id="title" name="title">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="description">Description</label>
				<div class="controls">
					<input type="text" id="description" name="description">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="duration">Duration</label>
				<div class="controls">
					<div class="input-prepend input-append">
						<span class="add-on">$</span> <input class="span2" id="duration"
							name="duration" type="text"> <span class="add-on">.00</span>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn">Submit</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
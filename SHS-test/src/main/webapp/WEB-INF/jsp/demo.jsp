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
		<form class="form-inline" action="${path}/demo" method="post">
			<input type="text" name="title" class="input-small"
				placeholder="TITLE"> <input type="password"
				name="description" placeholder="DESCRIPTION">
			<button type="submit" class="btn">Search</button>
		</form>
		<p>
			<button class="btn btn-primary" type="button" id="insert">INSERT</button>
		</p>
		<table class="table">
			<tr>
				<th>RID</th>
				<th>CODE</th>
				<th>TITLE</th>
				<th>DESCRIPTION</th>
				<th>START DATE TIME</th>
				<th>DURATION</th>
			</tr>
			<c:forEach var="obj" items="${result.currentList}">
				<tr>
					<td><c:out value="${obj.rid }"></c:out></td>
					<td><c:out value="${obj.code }"></c:out></td>
					<td><c:out value="${obj.title }"></c:out></td>
					<td><c:out value="${obj.description }"></c:out></td>
					<td><c:out value="${obj.startDatetime }"></c:out></td>
					<td><c:out value="${obj.duration }"></c:out></td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<a href="${path }/demo/${result.per }">上一页</a>|当前第${result.currentPage }页|共${result.allPage }页|<a
				href="${path }/demo/${result.next }">下一页</a>
		</div>
	</div>
</body>
</html>
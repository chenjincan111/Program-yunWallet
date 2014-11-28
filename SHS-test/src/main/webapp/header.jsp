<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/base.jsp"%>
<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="#"> &nbsp;      YUN - Cloud Coin</a>
      <div class="nav-collapse collapse">
        <p class="navbar-text pull-right">
          	&nbsp; <a href="${path }/logout" class="navbar-link"> Logout</a>
        </p>
        <p class="navbar-text pull-right">
          Logged in as <a href="#" class="navbar-link">${user.email}</a>
        </p>
        <ul class="nav">
          <li><a href="#">Home</a></li>
          <li><a href="#">Stats</a></li>
          <li><a href="#">API</a></li>
          <li><a href="${path }/wallet">Wallet</a></li>
          <li><a href="${path }/mechine">矿机</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<base href="<%=basePath%>">
<title>软件成本估算工具</title>
<!-- Custom Theme files -->
<script src="scripts/jquery-2.1.4.js"></script>
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/jquery.validate.min.js"></script>
<script src="scripts/jquery.validate.expand.js"></script>
<script src="scripts/messages_zh.min.js"></script>
<link rel="stylesheet" href="styles/bootstrap.min.css">
<link rel="stylesheet"	href="styles/common.css" />
<link href="styles/login.css" rel="stylesheet" />
</head>	
<body>
	<div class="title">
		<h2>软件成本估算工具登录页面</h2>
	</div>
	<form name="loginForm" method="post" action="user!login">
		<div class="signup">
			<span class="ribben"></span>
			<p>
				用户名：<span class="dot"> </span>
			</p>
			<input type="text" name="user.email" placeholder="example@email.com" />
			<p>
				密码：<span class="dot"> </span>
			</p>
			<input type="password" name="user.password" placeholder="" /> 
			<a class="btn btn-primary" role="button" href="javascript:document.loginForm.submit();">登录</a> 
			<a href="organization!listOrg" role="button" class="btn btn-primary" data-toggle="modal" data-target="#userRegisterModal">用户注册</a> 
			<a href="common/organization.jsp" role="button" class="btn btn-primary" data-toggle="modal"
				data-target="#orgRegisterModal">组织注册</a>
		</div>
	</form>
	<div class="copyright">
		<p>北航软件所 版权所有 @2015</p>
		<p>公司地址：北京市海淀区学院路37号</p>
		<p>电话：010－82318974</p>
	</div>

	<!-- Modal for User Register -->
	<div id="userRegisterModal" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>

	<!-- Modal for Organization Register -->
	<div id="orgRegisterModal" class="modal fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content"></div>
		</div>
	</div>
</body>



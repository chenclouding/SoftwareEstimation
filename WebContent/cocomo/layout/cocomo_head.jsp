<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- Custom Theme files -->
<script src="scripts/jquery-2.1.4.js"></script>
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/jquery.validate.min.js"></script>
<script src="scripts/jquery.validate.expand.js"></script>
<script src="scripts/messages_zh.min.js"></script>
<link rel="stylesheet" href="styles/bootstrap.min.css">
<link rel="stylesheet" href="styles/common.css" />
<link rel="stylesheet" href="styles/index.css" />
</head>
<style>
a#backIndex{
float:right;
margin-right:60px;
background:none;
}
</style>
<!-- Wrap -->
<div id="wrap">
	<!-- Header -->
	<div id="header">
		<h1 id="logo">软件成本估算工具</h1>
		<h2 id="slogan">提供更快捷的软件估算支持平台...</h2>
		<div id="searchform">
			<form method="post" class="search" action="#">
				<p>
					<input name="search_query" class="textbox" type="text" /> <input
						name="search" class="button" type="submit" value="搜索" />
				</p>
			</form>
		</div>
	</div>

	<!-- menu -->
	<div id="menu">
		<ul>
		<li class="submenu"><a href="cocomo/welcome.jsp">使用帮助</a></li>
		<li class="submenu"><a href="cocomo!editAppComp?countSession.id=<%=session.getAttribute("countSessionId") %>">应用组装子模型</a></li>
		<li class="submenu"><a href="cocomo!editEarlyDesign?countSession.id=<%=session.getAttribute("countSessionId") %>">早期设计子模型</a></li>
		<li class="submenu"><a href="cocomo!editPostArchitecture?countSession.id=<%=session.getAttribute("countSessionId") %>">后体系架构子模型</a></li>
		</ul>
		<a id="backIndex" href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>">返回主页面</a>
		<div id="login-info">
			当前项目：<%=session.getAttribute("projectName") %>&nbsp;&nbsp;
			估算场景：<%=session.getAttribute("countSessionName") %>&nbsp;&nbsp;
			当前用户：<%=session.getAttribute("userEmail") %>
		</div>
	</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" media="screen" href="styles/index.css" />
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
				<li><a href="project!list?user.id=<%=session.getAttribute("userId") %>" target="main">项目管理</a></li>
				<li><a href="project!listProjects?user.id=<%=session.getAttribute("userId") %>" target="main">模块分解</a></li>
				<li><a href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>" target="main">估算场景</a></li>
				<li><a href="user!edit?user.id=<%=session.getAttribute("userId") %>" target="main">修改个人信息</a></li>
			</ul>
			<div id="login-info">
				当前用户：<%=session.getAttribute("userEmail") %>&nbsp;&nbsp;<a href="common/login.jsp">退出</a>
			</div>
		</div>
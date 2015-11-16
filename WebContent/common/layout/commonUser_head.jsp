<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<li><a href="project!list?user.id=<%=session.getAttribute("userId") %>">项目管理</a></li>
			<li><a href="project!listProjects?user.id=<%=session.getAttribute("userId") %>">模块分解</a></li>
			<li><a href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>">估算场景</a></li>
			<li><a href="user!edit?user.id=<%=session.getAttribute("userId") %>">修改个人信息</a></li>
		</ul>
		<div id="login-info">
			当前用户：<%=session.getAttribute("userEmail") %>&nbsp;&nbsp;<a
				href="common/login.jsp">退出</a>
		</div>
	</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>一般用户</h1>
	<ul class="sidemenu">
		<li><a
			href="common/commonUser_welcome.jsp"
			>使用帮助</a></li>
		<li><a
			href="project!list?user.id=<%=session.getAttribute("userId") %>"
			>项目管理</a></li>
		<li><a
			href="project!listProjects?user.id=<%=session.getAttribute("userId") %>"
			>模块分解</a></li>
		<li><a
			href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>"
			>估算场景</a></li>
		<li><a
			href="user!edit?user.id=<%=session.getAttribute("userId") %>"
			>修改个人信息</a></li>
	</ul>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>组织管理员</h1>
	<ul class="sidemenu">
		<li><a
			href="organization!edit?organization.id=
					<%=session.getAttribute("orgId") %>&isDetail=false"
			>修改组织</a></li>
		<li><a href="countSession!list?organization.id=<%=session.getAttribute("orgId") %>" >项目管理</a></li>
		<li><a
			href="user!list?organization.id=<%=session.getAttribute("orgId") %>"
			>用户管理</a></li>
		<li><a
			href="param!edit?organization.id=<%=session.getAttribute("orgId") %>"
			>设置调整因子</a></li>
		<li><a
			href="devLang!edit?organization.id=<%=session.getAttribute("orgId") %>"
			>设置编程语言</a></li>
		<li><a href="common/resetPassword.jsp" >修改密码</a></li>
	</ul>
</div>


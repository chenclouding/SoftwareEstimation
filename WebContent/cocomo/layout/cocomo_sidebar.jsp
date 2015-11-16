<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>COCOMO II模型</h1>
	<ul class="sidemenu">
		<li class="submenu"><a href="cocomo/welcome.jsp">使用帮助</a></li>
		<li class="submenu"><a href="cocomo!editAppComp?countSession.id=<%=session.getAttribute("countSessionId") %>">应用组装子模型</a></li>
		<li class="submenu"><a href="cocomo!editEarlyDesign?countSession.id=<%=session.getAttribute("countSessionId") %>">早期设计子模型</a></li>
		<li class="submenu"><a href="cocomo!editPostArchitecture?countSession.id=<%=session.getAttribute("countSessionId") %>">后体系架构子模型</a></li>
	</ul>
</div>
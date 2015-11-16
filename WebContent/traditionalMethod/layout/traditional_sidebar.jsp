<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>传统估算方法</h1>
	<ul class="sidemenu">
		<li class="submenu"><a href="traditionalMethod/welcome.jsp">使用帮助</a></li>
		<li class="submenu"><a href="pert!editPert?countSession.id=<%=session.getAttribute("countSessionId") %>">PERT法</a></li>
		<li class="submenu"><a href="traditionalMethod/delphi.jsp">Delphi法</a></li>
		<li class="submenu"><a href="traditionalMethod/analogy.jsp">类比法</a></li>
	</ul>
</div>

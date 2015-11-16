<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>cosmic全功能点方法</h1>
	<ul class="sidemenu">
			<li class="submenu"><a href="cosmic/welcome.jsp">使用帮助</a></li>
	<li class="category">识别功能过程</li>
		<li class="submenu"><a href="functionProcess!list?countSession.id=<%=session.getAttribute("countSessionId") %>">功能流程</a></li>
		<li class="submenu"><a href="interestObject!list?countSession.id=<%=session.getAttribute("countSessionId") %>">兴趣对象与数据组</a></li>
	<li class="category">识别数据移动</li>
		<li class="submenu"><a href="module!listModulesForFunctionProcess?countSession.id=<%=session.getAttribute("countSessionId") %>">添加数据移动</a></li>
		<li class="submenu"><a href="countSession!listDataMovements?countSession.id=<%=session.getAttribute("countSessionId") %>">度量结果查看</a></li>
	</ul>
</div>
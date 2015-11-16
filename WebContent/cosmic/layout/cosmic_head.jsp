<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</head>
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
		<li class="submenu"><a href="cosmic/welcome.jsp">使用帮助</a></li>
		<li class="submenu"><a href="functionProcess!list?countSession.id=<%=session.getAttribute("countSessionId") %>">功能流程</a></li>
		<li class="submenu"><a href="interestObject!list?countSession.id=<%=session.getAttribute("countSessionId") %>">兴趣对象与数据组</a></li>
		<li class="submenu"><a href="module!listModulesForFunctionProcess?countSession.id=<%=session.getAttribute("countSessionId") %>">添加数据移动</a></li>
		<li class="submenu"><a href="countSession!listDataMovements?countSession.id=<%=session.getAttribute("countSessionId") %>">度量结果查看</a></li>
		</ul>
		
		<div id="login-info">
			当前项目：<%=session.getAttribute("projectName") %>&nbsp;&nbsp;
			当前用户：<%=session.getAttribute("userEmail") %>&nbsp;&nbsp;
			<a href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>">返回主页面</a>
		</div>
	</div>
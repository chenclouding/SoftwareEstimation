<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>软件成本估算工具</title>
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/styles/login.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<div class="title">
<h2>软件成本估算工具登录页面</h2>
</div>
<form method="post" >  
<div class="signup">
		<span class="ribben"></span>
		<p>邮箱：<span class="dot"> </span></p>
		<input type="text" placeholder="example@email.com">
		<p>密码：<span class="dot"> </span></p>
	 	<input type="password" placeholder="">
	 	<input type="submit" value="登录">
	 	<input class="theme-register" href="javascript:;" type="button" value="用户注册">
	 	<input class="theme-register" href="javascript:;" type="button" value="组织注册">
</div>
</form>
<div class="copyright">
	<p>北航软件所 版权所有 @2015</p>
	<p>公司地址：北京市海淀区学院路37号</p>
	<p>电话：010－82318974</p>
</div>
<div>
<jsp:include page="user.jsp"> 
<jsp:param name="popup_title" value="注册用户" />
</jsp:include>
<jsp:include page="organization.jsp"> 
<jsp:param name="popup_title" value="注册组织" />
</jsp:include>
</div>
</body>
</html>
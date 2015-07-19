<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/popup.css" media="all" />
<title>Insert title here</title>
<style>
.theme-form{
	margin-top:20px;
	width:320px;
}
.theme-form input.btn{
height:30px;
width:34%;
}
.theme-form li:last-child{
margin-left:100px;
}
</style>
</head>
<body>
   	<h3>重置密码</h3>	
  	<form class="theme-form" action="user!reset?user.id='${sessionScope.userId}'" name="industryForm" method="post">
		<ol>
			<li><label>当前密码：</label> <input class="ipt" type="text" name="user.password" /></li>
			<li><label>新密码：</label> <input class="ipt" type="text" name="newPassword" /></li>
			<li><label>确认密码：</label> <input class="ipt" type="text" /></li>
			<li><input class="btn btn-primary" type="submit" value="保 存 "/>
			<input class="btn btn-primary" type="reset" value="重置" /></li>
		</ol>
   </form>
</body>
</html>
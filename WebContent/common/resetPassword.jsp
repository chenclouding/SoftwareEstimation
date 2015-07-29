<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/common.css">
<title>Insert title here</title>
</head>
<body>
   	<h3>重置密码</h3>	
   	<s:actionerror />
   	<form name="resetPwdForm" action="user!reset" method="post">
		<div class="form-group">
			<label for="userPwd" class="col-sm-3 control-label">当前密码</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="userPwd" name="user.password" />
			</div>
		</div>
		<div class="form-group">
			<label for="userNewPwd" class="col-sm-3 control-label">新密码</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="userNewPwd" name="newPassword" />
			</div>
		</div>
		<div class="form-group">
			<label for="userRePwd" class="col-sm-3 control-label">确认密码</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="userRePwd" name="rePassword" />
			</div>
		</div>
			<input class="btn btn-primary" type="submit" value="保 存 "/>
			<input class="btn btn-primary" type="reset" value="重置" />
   </form>
</body>
</html>
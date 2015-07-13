<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script language="JavaScript">
function regist(){
	targetForm = document.forms[0];
	targetForm.action = "regist"
	targetForm.submit();
}
</script>
<body>
<form action="login" method="post"> 
用户名：<input type="text" name = "username" />
密码：<input type="text" name = "password" />
<input type="submit" value="提交" />
<input type="submit" value="注册" onclick="regist();"/>
</form>
<form action="addBook" method="post">
用户名：<input type="text" name = "username" />
<input type="submit" value="提交" />
</form> -->
<form action="uploadPro" method="post" enctype = "multipart/form-data">
文件标题：<input type="text" name = "title" />
上传文件：<input type="file" name = "upload" />
<input type="submit" value="提交" />
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<base href="<%=basePath%>">
<title>软件成本估算工具</title>
<!-- Custom Theme files -->
<script src="scripts/jquery-2.1.4.js"></script>
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/jquery.validate.min.js"></script>
<script src="scripts/jquery.validate.expand.js"></script>
<script src="scripts/messages_zh.min.js"></script>
<link rel="stylesheet" href="styles/bootstrap.min.css">
<link rel="stylesheet"	href="styles/common.css" />
</head>
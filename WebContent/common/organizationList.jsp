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
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/styles/common.css">
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>

</head>
<body>
	<div id="orgList">
		<h3>组织列表</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>联系人</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>修改</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="org" value="organizations" status="index">
					<tr>
						<td><s:property value="#index.count" /></td>
						<td><s:property value="#org.name" /></td>
						<td><s:property value="#org.contact" /></td>
						<td><s:property value="#org.phone" /></td>
						<td><s:property value="#org.email" /></td>
						<td><a onclick="window.parent.$.showModal(<s:property value='#org.id' />);"> 
						<span class="glyphicon glyphicon-edit"></span>
						</a></td>
						<td><a
							href="organization!delete?organization.id=<s:property value="#org.id" />">
								<span class="glyphicon glyphicon-trash"></span>
						</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<script>
	$.extend({
		postOrgData : function(orgData) {
			$.post("organization!edited", orgData, function(data){
				var doms = $.parseHTML(data);
				$("#orgList").html(doms);
			});
		}
	});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.Organization"%>
<%@ page import="bean.User"%>
<%@ page import="business.OrganizationBusiness"%>
<%@ page import="business.UserBusiness"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/styles/bootstrap-table.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/styles/common.css">
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/scripts/bootstrap-table.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="userList">
		<h3>用户列表</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>组织名称</th>
					<th>邮箱</th>
					<th>姓名</th>
					<th>组织管理员</th>
					<th>删除</th>
				</tr>
			</thead>
			<%
		List<Organization> organizations = new OrganizationBusiness().getAllOrganization();
           for(Organization org:organizations)
           {
        	   List<User> users = new UserBusiness().getUsersByOrganization(org);
               for(User user:users)
               {%>
			<tbody>
				<tr>
					<td><%=org.getName() %></td>
					<td><%=user.getEmail() %></td>
					<td><%=user.getName() %></td>
					<td><%=user.getRole() %></td>
					<td><a
						href="organization!delete?organization.id=<%=org.getId()%>"> <span
							class="glyphicon glyphicon-trash"></span>
					</a></td>
				</tr>
			</tbody>
			<%}
          }%>
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Organization" %>
<%@ page import="business.OrganizationBusiness" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap-table.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/common.css">
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap-table.min.js"></script>

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
		<%
		List<Organization> organizations = new OrganizationBusiness().getAllOrganization();
		int sequence = 1;
 
           for(Organization org:organizations)
           {%>
           <tbody>
           <tr>
               <td><%=sequence++ %></td>
               <td><%=org.getName() %></td>
               <td><%=org.getContact() %></td>
               <td><%=org.getPhone() %></td>
               <td><%=org.getEmail() %></td>
		        <td>
		        	<a href="organization!edit?organization.id=<%=org.getId()%>">
				  		<span class="glyphicon glyphicon-edit"></span>
					</a>  
		        </td>
		        <td>
		        <a href="organization!delete?organization.id=<%=org.getId()%>">
				  <span class="glyphicon glyphicon-trash"></span>
				</a>
		        </td>
          </tr>
          </tbody>
          <%}%>      
    </table>
    </div>
</body>
</html>
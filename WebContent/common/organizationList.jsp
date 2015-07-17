<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.Organization" %>
<%@ page import="business.OrganizationBusiness" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap-table.min.css">
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap-table.min.js"></script>
<script>
$(document).ready(function(){
	if(organizations == null){
		$("#orgList").css("display","none");
		$("#errorMessage").show();
	}
})
</script>
</head>
<body>
<h1 id="errorMessage" style="display:none;color:red">目前无组织信息，请添加组织</h1>
<div id="orgList">
	<h1>组织列表</h1>	
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
		        <td class = editimg>
		          	  <a href="Organization!edit?organization.id=<%org.getId();%>/>">
		          	  	<IMG src="/nesma/images/btnedit.gif" alt="点击修改" border="0" />
		          	  </a>
		        </td>
		        <td class = delimg>
		              <a href="Organization!del?organization.id=<%org.getId();%>/>" 
		              onclick="return confirmdel(<s:property value="users.size"/>)">
		              	<img src="/nesma/images/btndel.gif" alt="点击删除" width="15" height="12" border="0" />
		              </a>
		        </td>
          </tr>
          </tbody>
          <%}%>      
    </table>
    </div>
</body>
</html>
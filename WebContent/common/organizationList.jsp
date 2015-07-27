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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/common.css">
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
<script>

</script>
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
	               <td><s:property value="#index.count"/></td>
	               <td><s:property value="#org.name" /></td>
	               <td><s:property value="#org.contact" /></td>
	               <td><s:property value="#org.phone" /></td>
	               <td><s:property value="#org.email" /></td>
			        <td>
			        	<a href="organization!edit?organization.id=<s:property value="#org.id" />" data-toggle="modal" data-target="#orgEditModal">
					  		<i class="icon-edit"></i>
						</a>  
			        </td>
			        <td>
			        <a href="organization!delete?organization.id=<s:property value="#org.id" />">
					  <i class="icon-trash"></i>
					</a>
			        </td>
	          </tr>
          </s:iterator>
          </tbody>  
    </table>
    </div>
    
	<!-- Modal for Organization Register -->
	<div id="orgEditModal" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">修改组织</h3>
		</div>
		<form class="theme-form" name="organizationform"
			action="organization!edited" method="post">
			<div class="modal-body">

				<ol>
					<li><label>组织名称：</label> <input class="ipt" type="text"
						name="organization.name" /></li>
					<li><label>组织类型：</label> <select class="ipt" type="text"
						name="organization.type">
							<option value="==请选择组织类型==">==请选择组织类型==</option>
							<option value="A.农、林、牧、渔业">A.农、林、牧、渔业</option>
							<option value="B.采矿业">B.采矿业</option>
							<option value="C.制造业">C.制造业</option>
							<option value="D.电力、热力、燃气及水生产和供应业">D.电力、热力、燃气及其它供应业</option>
							<option value="E.建筑业">E.建筑业</option>
							<option value="F.批发和零售业">F.批发和零售业</option>
							<option value="G.交通运输、仓储和邮政业">G.交通运输、仓储和邮政业</option>
							<option value="H.住宿和餐饮业">H.住宿和餐饮业</option>
							<option value="I.信息传输、软件和信息技术服务业">I.软件和信息技术、传输服务业</option>
							<option value="J.金融业">J.金融业</option>
							<option value="K.房地产业">K.房地产业</option>
							<option value="L.租赁和商务服务业">L.租赁和商务服务业</option>
							<option value="M.科学研究和技术服务业">M.科学研究和技术服务业</option>
							<option value="N.水利、环境和公共设施管理业">N.水利、环境和公共设施管理业</option>
							<option value="O.居民服务、修理和其他服务业">O.居民服务、修理和其他服务业</option>
							<option value="P.教育">P.教育</option>
							<option value="Q.卫生和社会工作">Q.卫生和社会工作</option>
							<option value="R.文化、体育和娱乐业">R.文化、体育和娱乐业</option>
							<option value="S.公共管理、社会保障和社会组织">S.公共管理、社会保障和组织</option>
							<option value="T.国际组织">T.国际组织</option>
					</select></li>
					<li><label>组织简介：</label> <input class="ipt" type="text"
						name="organization.description" /></li>
					<li><label>组织地址：</label> <input class="ipt" type="text"
						name="organization.address" /></li>
					<li><label>传真：</label> <input class="ipt" type="text"
						name="organization.postcode" /></li>
					<li><label>联系人：</label> <input class="ipt" type="text"
						name="organization.contact" /></li>
					<li><label>电话：</label> <input class="ipt" type="text"
						name="organization.phone" /></li>
					<li><label>邮箱：</label> <input class="ipt" type="text"
						name="organization.email" /></li>
				</ol>
			</div>
			<div class="modal-footer">
				<input class="btn btn-primary" type="submit" value="新建" /> 
				<input	class="btn btn-primary" type="reset" value="重置" />
			</div>
		</form>
	</div>
</body>
</html>
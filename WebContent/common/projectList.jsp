<%@ include file="layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/bootstrap-switch.min.css" />
<script src="scripts/bootstrap-switch.min.js"></script>

<body>
	<div id="projectList">
		<h3>项目列表</h3>
		<a id="projectAdd" onclick="window.parent.$.showProjectModal('<%=session.getAttribute("orgId") %>','add');"><span class="glyphicon glyphicon-plus-sign"></span></a>
		<table class="table table-bordered" id="project_table">
			<thead>
				<tr>			
					<th>编号</th>
					<th>项目名称</th>
					<th>修改</th>
					<th>删除</th>
					<th>下一步</th>
					<th>查看估算</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="project" value="projects" status="index">
					<tr>
						<td><s:property value="#index.count" /></td>
						<td><a onclick="window.parent.$.showProjectModal(<s:property value='#project.id' />,'detail');" >
						<s:property value="#project.name" />
						</a></td>					
						<td><a onclick="window.parent.$.showProjectModal(<s:property value='#project.id' />,'edit');"> 
						<span class="glyphicon glyphicon-edit"></span>
						</a></td>
						<td><a href="project!delete?project.id=<s:property value="#project.id" />&
						user.id=<s:property value="#project.user.id" />">
							<span class="glyphicon glyphicon-trash"></span>
						</a></td>
						<td><a href="project!listProjects?user.id=<%=session.getAttribute("userId") %>">下一步</a></td>
						<td><a href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>">查看估算</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
<script>
$.extend({
	postProjectData : function(projectData,actionName) {
			$.post(actionName, projectData, function(data){
				var doms = $.parseHTML(data);
				$("#projectList").html(doms);
			});			
	}
});
</script>
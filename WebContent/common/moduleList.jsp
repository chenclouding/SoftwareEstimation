<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="layout/commonUser_head.jsp"%>
<link href="styles/moduleList.css" rel="stylesheet" media="all" />
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div id="content-wrap">
<div id="module">
	<h3>模块列表</h3>
	<form name="projectSelectForm"
		id="projectSelectForm" action="module!list" method="post">
		<div class="form-group">
			<label for="projectSelect" class="col-sm-3">选择项目</label>
			<div class="col-sm-7">
				<s:select class="form-control" id="projectSelect" list="projects"
					listValue="name" listKey="id" name="project.id"
					value="%{project.id}"></s:select>
			</div>
		</div>
		<input class="btn btn-primary" type="submit" value="确定" />
	</form>
	<div id="moduleForm">
<%-- 		<a id="moduleAdd"
			onclick="window.parent.$.showModuleModal('<%=session.getAttribute("projectId")%>','add');"> --%>

	<a id="moduleAdd" href="common/module.jsp" role="button" data-toggle="modal" data-target="#moduleModal">
			<span class="glyphicon glyphicon-plus-sign"></span>
		</a>
	</div>
	<div id="moduleList">
		<table class="table table-bordered" id="module_table">
			<tr>
				<td>序号</td>
				<td>名称</td>
				<td>修改</td>
				<td>删除</td>
				<td>下一步</td>
			</tr>
			<s:iterator id="module" value="modules" status="index">
				<tr>
					<td><s:property value="#index.count" /></td>
					<td><%-- <a
						onclick="window.parent.$.showModuleModal(<s:property value='#module.id' />,'detail');">
							<s:property value="#module.name" /> --%>
		<a href="module!edit?module.id=<s:property value='#module.id' />&isDetail=true" role="button"  
	data-toggle="modal" data-target="#moduleModal"><s:property value="#module.name" /> 
					</a></td>
					<td><%-- <a
						onclick="window.parent.$.showModuleModal(<s:property value='#module.id' />,'edit');"> --%>
			<a href="module!edit?module.id=<s:property value='#module.id' />&isDetail=false" role="button"  
	data-toggle="modal" data-target="#moduleModal">
							<span class="glyphicon glyphicon-edit"></span>
					</a></td>
					<td><a
						href="module!delete?module.id=<s:property value="#module.id" />&
						project.id=<%=session.getAttribute("projectId")%>">
							<span class="glyphicon glyphicon-trash"></span>
					</a></td>
					<td><a href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>">下一步</a></td>
				</tr>
			</s:iterator>
		</table>
	</div>
</div>
</div>
</div>
		<!-- Modal for create module-->
	<div id="moduleModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
<%@ include file="layout/commonUser_footer.jsp"%>
<script>
$('#moduleModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
/* $(document).ready(function(){ 
	alert($("#moduleForm").attr("action"));
}); */
/* $('#moduleModal').on('show.bs.modal', function (e) {
	$("#moduleForm").validate({
		rules: {
			"module.name":"required"
		}
	}); 
	//若为show detail设置input为不可编辑
	alert($(".form-horizontal").attr("action"));
 	if($(".form-horizontal").attr("action")=="module!list"){
 		console.log($("#moduleForm .form-control"));
			$("#moduleForm .form-control").attr("disabled",true);
	} 
	}) */
/* $.extend({
	postModuleData : function(moduleData, actionName) {
		$.post(actionName, moduleData, function(data) {
			var doms = $.parseHTML(data);
			$("#module").html(doms);
		});
	}
}); */
</script>
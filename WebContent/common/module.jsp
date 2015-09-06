<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">模块信息</h4>
</div>
<s:if test="actionName==null">
	<form class="form-horizontal" id="moduleForm" action="module!add" method="post" >
</s:if>
<s:else>
	<s:if test="actionName=='module!detail'">
		<form class="form-horizontal" id="moduleForm" action="" method="post" >
	</s:if>
	<s:else>
		<form class="form-horizontal" id="moduleForm" action="<s:property value='actionName' />" method="post" >
	</s:else>
</s:else>
<div class="modal-body">
	<div class="form-group">
		<label for="moduleName" class="col-sm-3 control-label">名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="moduleName" name="module.name"
				value="<s:property value="module.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="moduleDesc" class="col-sm-3 control-label">描述</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="moduleDesc"
				name="module.description" value="<s:property value="module.description"/>" />
		</div>
	</div>
	<input type="hidden" name="project.id" value="<%=session.getAttribute("projectId") %>" />
	<input type="hidden" name="module.id" value="<s:property value="module.id" />" />
	<div class="modal-footer">
<s:if test="actionName=='module!detail'">
			<input class="btn btn-primary" type="submit" onClick="$.preventPost();" value="确定" />
</s:if>
<s:else>
<input class="btn btn-primary" type="submit" value="确定" />
</s:else>
		<input class="btn btn-primary" type="reset" value="重置" />
	</div>
</div>
</form>

<script>
$.extend({
	preventPost : function() {
		event.preventDefault();
		$("#moduleModal").modal('hide');
	}
});
$(document).ready(function(){ 
	$(".form-horizontal").validate({
		rules: {
			"module.name":"required"
		}
	}); 
	//若为show detail设置input为不可编辑
 	if($(".form-horizontal").attr("action")==""){
			$("#moduleForm .form-control").attr("disabled",true);
	} 
});
</script>
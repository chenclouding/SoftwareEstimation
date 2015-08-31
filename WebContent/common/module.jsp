<%@ include file="layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">模块信息</h4>
</div>
<!-- <label class="message" style="display:none;">修改成功！</label> -->
<form class="form-horizontal" id="moduleForm"
	action="" method="post">
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
		<input class="btn btn-primary" onclick="$.postModuleData('<s:property value='actionName'/>')" value="确定" />
		<input class="btn btn-primary" type="reset" value="重置" />
	</div>
</div>
</form>
<!-- to be refined -->
<script>
$(document).ready(function(){ 
	$("#moduleForm").validate({
		rules: {
			"module.name":"required"
		}
	}); 
});
</script>
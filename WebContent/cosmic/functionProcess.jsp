<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">功能流程信息</h4>
</div>
<s:if test="actionName==null">
	<form class="form-horizontal" id="functionProcessForm" action="functionProcess!add" method="post" >
</s:if>
<s:else>
	<s:if test="actionName=='functionProcess!detail'">
		<form class="form-horizontal" id="functionProcessForm" action="" method="post" >
	</s:if>
	<s:else>
		<form class="form-horizontal" id="functionProcessForm" action="<s:property value='actionName' />" method="post" >
	</s:else>
</s:else>
<div class="modal-body">
	<div class="form-group">
		<label for="functionProcessName" class="col-sm-3 control-label">名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="functionProcessName" name="functionProcess.name"
				value="<s:property value="functionProcess.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="functionProcessDesc" class="col-sm-3 control-label">描述</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="functionProcessDesc"
				name="functionProcess.description" value="<s:property value="functionProcess.description"/>" />
		</div>
	</div>
	<input type="hidden" name="countSession.id" value="<s:property value="countSession.id" />" />
	<input type="hidden" name="module.id" value="<s:property value="module.id" />" />
	<input type="hidden" name="functionProcess.id" value="<s:property value="functionProcess.id" />" /> 
	<div class="modal-footer">
<s:if test="actionName=='functionProcess!detail'">
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
$(document).ready(function(){ 
	$(".form-horizontal").validate({
		rules: {
			"functionProcess.name":"required",
		}
	});
	//若为show detail设置input为不可编辑
 	if($(".form-horizontal").attr("action")==""){
			$("#functionProcessForm .form-control").attr("disabled",true);
	} 
});
 $.extend({
	preventPost : function() {
		event.preventDefault();
		$("#functionProcessModal").modal('hide');
	}
});
</script>
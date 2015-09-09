<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">数据功能信息</h4>
</div>
<s:if test="actionName==null">
	<form class="form-horizontal" id="dataFunctionForm" action="dataFunction!add" method="post" >
</s:if>
<s:else>
	<s:if test="actionName=='dataFunction!detail'">
		<form class="form-horizontal" id="dataFunctionForm" action="" method="post" >
	</s:if>
	<s:else>
		<form class="form-horizontal" id="dataFunctionForm" action="<s:property value='actionName' />" method="post" >
	</s:else>
</s:else>
<div class="modal-body">
	<div class="form-group">
		<label for="dataFunctionName" class="col-sm-3 control-label">名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="dataFunctionName" name="dataFunction.name"
				value="<s:property value="dataFunction.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="dataFunctionDesc" class="col-sm-3 control-label">描述</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="dataFunctionDesc"
				name="dataFunction.description" value="<s:property value="dataFunction.description"/>" />
		</div>
	</div>
		<div class="form-group">
		<label for="dataFunctionType" class="col-sm-3 control-label">类型</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="dataFunctionType"
			list="{
				'ILF',
				'EIF'}"
			value="dataFunction.type" name="dataFunction.type" />
		</div>
		</div>
		<s:if test="countSession.methodType=='NESMA-详细型' || countSession.methodType=='IFPUG'">
			<div class="form-group">
			<label for="dataFunctionDet" class="col-sm-3 control-label">DET个数</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="dataFunctionDet"
					name="dataFunction.detCount" value="<s:property value="dataFunction.detCount"/>" />
			</div>
			</div>
			<div class="form-group">
			<label for="dataFunctionRet" class="col-sm-3 control-label">RET个数</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="dataFunctionRet"
					name="dataFunction.retCount" value="<s:property value="dataFunction.retCount"/>" />
			</div>
			</div>
		</s:if>
	<input type="hidden" name="countSession.id" value="<s:property value="countSession.id" />" />
	<input type="hidden" name="module.id" value="<s:property value="module.id" />" />
	<input type="hidden" name="dataFunction.id" value="<s:property value="dataFunction.id" />" /> 
	<div class="modal-footer">
<s:if test="actionName=='dataFunction!detail'">
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
			"dataFunction.name":"required",
			"dataFunction.detCount":{
					digits:true,
					required:true
			},
			"dataFunction.retCount":{
				digits:true,
				required:true
			}
		}
	});
	//若为show detail设置input为不可编辑
 	if($(".form-horizontal").attr("action")==""){
			$("#dataFunctionForm .form-control").attr("disabled",true);
	} 
});
 $.extend({
	preventPost : function() {
		event.preventDefault();
		$("#dataFunctionModal").modal('hide');
	}
});
</script>
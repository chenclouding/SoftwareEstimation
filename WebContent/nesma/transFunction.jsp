<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">事务功能信息</h4>
</div>
<s:if test="actionName==null">
	<form class="form-horizontal" id="transFunctionForm" action="transFunction!add" method="post" >
</s:if>
<s:else>
	<s:if test="actionName=='transFunction!detail'">
		<form class="form-horizontal" id="transFunctionForm" action="" method="post" >
	</s:if>
	<s:else>
		<form class="form-horizontal" id="transFunctionForm" action="<s:property value='actionName' />" method="post" >
	</s:else>
</s:else>
<div class="modal-body">
	<div class="form-group">
		<label for="transFunctionName" class="col-sm-3 control-label">名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="transFunctionName" name="transFunction.name"
				value="<s:property value="transFunction.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="transFunctionDesc" class="col-sm-3 control-label">描述</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="transFunctionDesc"
				name="transFunction.description" value="<s:property value="transFunction.description"/>" />
		</div>
	</div>
		<div class="form-group">
		<label for="transFunctionType" class="col-sm-3 control-label">类型</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="transFunctionType"
			list="{
				'EI',
				'EO',
				'EQ'}"
			value="transFunction.type" name="transFunction.type" />
		</div>
	</div>
		<s:if test="countSession.methodType=='NESMA-详细型' || countSession.methodType=='IFPUG'">
			<div class="form-group">
			<label for="transFunctionDet" class="col-sm-3 control-label">DET个数</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="transFunctionDet"
					name="transFunction.detCount" value="<s:property value="transFunction.detCount"/>" />
			</div>
			</div>
			<div class="form-group">
			<label for="transFunctionFtr" class="col-sm-3 control-label">FTR个数</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="transFunctionFtr"
					name="transFunction.ftrCount" value="<s:property value="transFunction.ftrCount"/>" />
			</div>
			</div>
		</s:if>
	<input type="hidden" name="countSession.id" value="<s:property value="countSession.id" />" />
	<input type="hidden" name="module.id" value="<s:property value="module.id" />" />
	<input type="hidden" name="transFunction.id" value="<s:property value="transFunction.id" />" /> 
	<div class="modal-footer">
	<s:if test="actionName=='transFunction!detail'">
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
			"transFunction.name":"required",
			"transFunction.detCount":{
				digits:true,
				required:true
			},
			"transFunction.ftrCount":{
				digits:true,
				required:true
			}
		}
	});
	//若为show detail设置input为不可编辑
 	if($(".form-horizontal").attr("action")==""){
			$("#transFunctionForm .form-control").attr("disabled",true);
	} 
});
 $.extend({
	preventPost : function() {
		event.preventDefault();
		$("#transFunctionModal").modal('hide');
	}
});
</script>
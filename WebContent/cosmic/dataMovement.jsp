<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">数据移动信息</h4>
</div>
<s:if test="actionName==null">
	<form class="form-horizontal" id="dataMovementForm" action="dataMovement!add" method="post" >
</s:if>
<s:else>
	<s:if test="actionName=='dataMovement!detail'">
		<form class="form-horizontal" id="dataMovementForm" action="" method="post" >
	</s:if>
	<s:else>
		<form class="form-horizontal" id="dataMovementForm" action="<s:property value='actionName' />" method="post" >
	</s:else>
</s:else>
<div class="modal-body">
	<div class="form-group">
		<label for="dataMovementName" class="col-sm-3 control-label">名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="dataMovementName" name="dataMovement.name"
				value="<s:property value="dataMovement.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="dataMovementType" class="col-sm-3 control-label">类型</label>
		<div class="col-sm-7">
			<s:select id="dataMovementType" list="{'输入','输出','读','写'}" class="form-control"
			name="dataMovement.type" ></s:select>
		</div>
	</div>
	<div class="form-group">
		<label for="interestObjectSelect" class="col-sm-3 control-label">兴趣对象</label>
		<div class="col-sm-7">
			<s:select id="interestObjectSelect" list="interestObjects" class="form-control"
				listValue="name" listKey="id" name="interestObject.id"
				value="%{interestObject.id}" onchange="change(this)"></s:select>
			<input id="interestObjects" type="hidden" value="<s:property value="interestObjectStr" />" />
		</div>
	</div>
	<div class="form-group">
		<label for="dataGroupSelect" class="col-sm-3 control-label">数据组</label>
		<div class="col-sm-7">
		<s:if test="actionName==null">
			<s:select id="dataGroupSelect" list="interestObjects[0].dataGroups" class="form-control"
				listValue="name" listKey="id" name="dataGroup.id"
				value="%{dataGroup.id}" ></s:select>
		</s:if>
		<s:else>
			<s:select id="dataGroupSelect" list="interestObject.dataGroups" class="form-control"
				listValue="name" listKey="id" name="dataGroup.id"
				value="%{dataGroup.id}" ></s:select>
		</s:else>
		</div>
	</div>
	<input type="hidden" name="functionProcess.id" value="<s:property value="functionProcess.id" />" />
	<input type="hidden" name="countSession.id" value="<s:property value="countSession.id" />" />
	<input type="hidden" name="module.id" value="<s:property value="module.id" />" />
	<input type="hidden" name="dataMovement.id" value="<s:property value="dataMovement.id" />" /> 
	<div class="modal-footer">
<s:if test="actionName=='dataMovement!detail'">
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
			"dataMovement.name":"required",
			"interestObject.id":"required",
			"dataGroup.id":"required"
		}
	});
	//若为show detail设置input为不可编辑
 	if($(".form-horizontal").attr("action")==""){
			$("#dataMovementForm .form-control").attr("disabled",true);
	} 
});
 $.extend({
	preventPost : function() {
		event.preventDefault();
		$("#dataMovementModal").modal('hide');
	}
});
</script>
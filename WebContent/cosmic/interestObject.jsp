<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">兴趣对象信息</h4>
</div>
<s:if test="actionName==null">
	<form class="form-horizontal" id="interestObjectForm" action="interestObject!add" method="post" >
</s:if>
<s:else>
	<s:if test="actionName=='interestObject!detail'">
		<form class="form-horizontal" id="interestObjectForm" action="" method="post" >
	</s:if>
	<s:else>
		<form class="form-horizontal" id="interestObjectForm" action="<s:property value='actionName' />" method="post" >
	</s:else>
</s:else>
<div class="modal-body">
	<div class="form-group">
		<label for="interestObjectName" class="col-sm-3 control-label">名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="interestObjectName" name="interestObject.name"
				value="<s:property value="interestObject.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="interestObjectDesc" class="col-sm-3 control-label">描述</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="interestObjectDesc"
				name="interestObject.description" value="<s:property value="interestObject.description"/>" />
		</div>
	</div>
	<s:if test="actionName==null">
	<div class="form-group">
		<label for="interestObjectDataGroups" class="col-sm-3 control-label">数据组</label>
		<div id="addDataGroup" class="col-sm-7">
		<p>
			<input type="text" class="form-control"	name="interestObject.dataGroups[0].name" 
			value="<s:property value="interestObject.dataGroups"/>" />
				<a onclick=" $.addNewDataGroup();" id="addNew">新增</a>
		</p>
		</div>
	</div>
	</s:if>
	<s:else>
		<div class="form-group">
		<label for="interestObjectDataGroups" class="col-sm-3 control-label">数据组</label>
		<div id="addDataGroup" class="col-sm-7">
		<s:iterator id="dataGroup" value="dataGroups" status="index">
			<s:if test="#index.index==0" >
				<p>
					<input type="text" class="form-control"	name="interestObject.dataGroups[0].name" 
					value="<s:property value="#dataGroup.name"/>" />
						<a onclick=" $.addNewDataGroup();" id="addNew">新增</a>
				</p>
			</s:if>
			<s:else>
				<p>
					<input type="text" class="form-control"	name="interestObject.dataGroups[<s:property value="#index.index" />].name" 
					value="<s:property value="#dataGroup.name"/>" />
					<a onclick="removeDataGroup(this)" >删除</a>
				</p>
			</s:else>
		</s:iterator>
		</div>
	</div>
	</s:else>
	<input type="hidden" name="countSession.id" value="<s:property value="countSession.id" />" />
	<input type="hidden" name="module.id" value="<s:property value="module.id" />" />
	<input type="hidden" name="interestObject.id" value="<s:property value="interestObject.id" />" /> 
	<div class="modal-footer">
<s:if test="actionName=='interestObject!detail'">
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
			"interestObject.name":"required",
			"interestObject.dataGroups[0].name":"required"
		}
	});
	//若为show detail设置input为不可编辑
 	if($(".form-horizontal").attr("action")==""){
			$("#interestObjectForm .form-control").attr("disabled",true);
			$("#interestObjectForm a").removeAttr("onclick");
	} 
	
});
 $.extend({
	preventPost : function() {
		event.preventDefault();
		$("#interestObjectModal").modal('hide');
	}
});
</script>
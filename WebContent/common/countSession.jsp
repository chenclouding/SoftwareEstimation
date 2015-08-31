<%@ include file="layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#countSessionForm ul {
margin:0px;
	padding: 0px;
	list-style: none;
}

#countSessionForm ul li {
	clear: both;
	padding-top: 8px;
}

#countSessionForm ul input, #countSessionForm ul label {
	float: left;
}
</style>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">估算会话信息</h4>
</div>
<form class="form-horizontal" id="countSessionForm"	action="" method="post">
<div class="modal-body">
	<div class="form-group">
		<label for="countSessionName" class="col-sm-3 control-label">名称</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="countSessionName" name="countSession.name"
				value="<s:property value="countSession.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="countSessionDesc" class="col-sm-3 control-label">描述</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="countSessionDesc"
				name="countSession.description" value="<s:property value="countSession.description"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="countSessionMethodType" class="col-sm-3 control-label">估算方法</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="countSessionMethodType"
				list="{
					'IFPUG',
					'NESMA',
					'COSMIC',
					'Pert',
					'Delphi'}"
				value="countSession.methodType" name="countSession.methodType" />
		</div>
	</div>
	<div class="form-group">
		<label for="countSessionLifecyclePhase" class="col-sm-3 control-label">生命周期阶段</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="countSessionLifecyclePhase"
				list="{
					'需求早期',
					'需求后期',
					'概要设计阶段',
					'详细设计阶段',
					'编码阶段',
					'测试阶段',
					'项目已完成'}"
				value="countSession.lifecyclePhase" name="countSession.lifecyclePhase" />
		</div>
	</div>
	<div class="form-group">
		<label for="countSessionPurpose" class="col-sm-3 control-label">估算目的</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="countSessionPurpose"
				name="countSession.purpose" value="<s:property value="countSession.purpose"/>" />		
			<ul>	
			<li>
			<input type="radio" name="purpose" value="作为估算开发工作量的输入" /><label>作为估算开发工作量的输入</label></li>
			<li>
			<input type="radio" name="purpose" value="度量需求变更部分的规模，以管理变更" /><label>度量需求变更部分的规模，以管理变更</label></li>
			<li>
			<input type="radio" name="purpose" value="度量已交付软件规模，以度量开发效率" /><label>度量已交付软件规模，以度量开发效率</label></li>
			<li>
			<input type="radio" name="purpose" value="度量总规模和开发规模，以度量重用规模" /><label>度量总规模和开发的规模，以度量重用规模</label></li>
			<li>
			<input type="radio" name="purpose" value="度量已有软件规模，以度量维护人员的效率" /><label>度量已有软件规模，以度量维护人员的效率</label></li>
		</ul>
		</div>
	</div>
	<div class="form-group">
		<label for="countSessionScope" class="col-sm-3 control-label">估算范围</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="countSessionScope"
				name="countSession.scope" value="<s:property value="countSession.scope"/>" />
		</div>
	</div>
	<input type="hidden" name="project.id" value="<%=session.getAttribute("projectId") %>" />
	<input type="hidden" name="countSession.id" value="<s:property value="countSession.id" />" />
	<div class="modal-footer">
		<input class="btn btn-primary" onclick="$.postCountSessionData('<s:property value='actionName'/>')" value="确定" />
		<input class="btn btn-primary" type="reset" value="重置" />
	</div>
</div>
<script>
$(document).ready(function(){
	$("#countSessionForm").validate({
		rules: {
			"countSession.name":"required",
			"countSession.scope":"required"
		}
	}); 
});
</script>
</form>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script src="scripts/bootstrap-datetimepicker.min.js"></script>
<script src="scripts/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" href="styles/bootstrap-datetimepicker.min.css">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">项目信息</h4>
</div>
<s:if test="actionName==null"> 
<form class="form-horizontal" name="projectForm" id="projectForm"
	action="project!add" method="post">
</s:if> 
<s:else> 
<form class="form-horizontal" name="projectForm" id="projectForm"
	action="<s:property value="actionName"/>" method="post">
</s:else> 
	<div class="modal-body">
		<div class="form-group">
			<label for="projectName" class="col-sm-3 control-label">项目名称</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="projectName"
					name="project.name"
					value="<s:property value="project.name"/>" />
			</div>
		</div>
		<div class="form-group">
			<label for="projectDesc" class="col-sm-3 control-label">项目描述</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="projectDesc"
					name="project.description"
					value="<s:property value="project.description"/>" />
			</div>
		</div>
		<div class="form-group">
			<label for="projectType" class="col-sm-3 control-label">项目类型</label>
			<div class="col-sm-7">
				<s:select class="form-control" id="projectType"
					list="{
  				'新开发',
  				'二次开发',
  				'增强型'}"
					value="project.type" name="project.type" />
			</div>
			</div>
			<div class="form-group">
				<label for="projectIDE" class="col-sm-3 control-label">集成开发环境</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="projectIDE"
						name="project.ide"
						value="<s:property value="project.ide"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="projectDevLang" class="col-sm-3 control-label">开发语言(refine)</label>
				<div class="col-sm-7">
					<s:select class="form-control" id="projectDevLang" list="devLangs"
					listValue="name" listKey="id" name="project.devLang"
					value="%{project.devLang}"></s:select>
				</div>
			</div>
			<div class="form-group">
				<label for="projectOS" class="col-sm-3 control-label">操作系统</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="projectOS"
						name="project.os"
						value="<s:property value="project.os"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="projectDatabase" class="col-sm-3 control-label">数据库</label>
				<div class="col-sm-7">
					<s:select class="form-control" id="projectDatabase"
					list="{
		  				'MySQL',
		  				'SQL Server',
		  				'Sybase',
		  				'Access',
		  				'FoxPro',
		  				'Informix',
		  				'DB2',
		  				'PostgreSQL'}"
							value="project.database" name="project.database" />
				</div>
			</div>
			<div class="form-group">
				<label for="projectLifeCyleModel" class="col-sm-3 control-label">生命周期模型</label>
				<div class="col-sm-7">
					<s:select class="form-control" id="projectLifeCyleModel"
					list="{
		  				'瀑布模型',
		  				'迭代模型',
		  				'增量模型',
		  				'螺旋模型',
		  				'原型模型',
		  				'敏捷开发'}"
							value="project.lifeCycleModel" name="project.lifeCycleModel" />
				</div>
			</div>
			<div class="form-group">
				<label for="projectStartTime" class="col-sm-3 control-label">开始时间</label>
				<div class="col-sm-7">
					<input type="text" class="form-control form_date" id="projectStartTime" readonly 
					data-date-format="yyyy-mm-dd" name="project.startTime" 
					value="<s:property value="project.startTime"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="projectEndTime" class="col-sm-3 control-label">结束时间</label>
				<div class="col-sm-7">
					<input type="text" class="form-control form_date" id="projectEndTime" readonly
					data-date-format="yyyy-mm-dd" name="project.endTime"
					value="<s:property value="project.endTime"/>" />
				</div>
			</div>
			<input type="hidden" name="user.id" value="<%=session.getAttribute("userId") %>"/>
			<s:if test="actionName!=null"> 
		  		<input type="hidden" name="project.id" value="<s:property value="project.id"/>"/>
			</s:if>
		</div>
		<div class="modal-footer">
			<s:if test="actionName==null">
				<input class="btn btn-primary" type="submit" value="确定" />
			</s:if>
			<s:else>
				<input class="btn btn-primary" onclick="$.postData()" value="确定" />
			</s:else>
			<input class="btn btn-primary" type="reset" value="重置" />
		</div>
</form>
<script>
$(document).ready(function(){ 
	$("#projectForm").validate({
 		rules: {
			"project.name":"required",
			"project.devLang":"required",
			"project.ide":"required",
			"project.lifeCycleModel":"required",
			"project.os":"required",
			"project.database":"required",
			"project.startTime":"required",
			"project.endTime":"required",
		} 
	}); 
}); 
$('#projectStartTime').datetimepicker({
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0,
    pickerPosition: "bottom-left",
});
$('#projectEndTime').datetimepicker({
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0,
    pickerPosition: "bottom-left",
});
/* $.extend({
	postOrgEditData : function() {
		$.post("project!edited", $('#orgForm').serialize(), function(){
			$("label.message").css('display','block');
		});
	}
}); */
</script>
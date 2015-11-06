<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/cocomo_head.jsp"%>
<style>
.col-sm-3 {
	width: 15%;
}

.col-sm-7 {
	width: 40%;
}

.footer {
	margin-left: 70%;
}

.footer .btn-primary {
	padding: 6px;
	width: 70px;
}

.form-control {
	display: inline;
	width: 70%;
}

#prodRadios {
	margin-left: 120px;
	padding-top: 7px;
}

#prodRadios label {
	width: 97%;
	display: inline-block;
}
</style>

<div id="content-wrap">
	<h3>应用组装子模型估算页面</h3>
	<form class="form-horizontal" id="appForm" action="cocomo!editedAppCom"
		method="post">
		<div class="form-group">
			<label for="nop" class="col-sm-3 control-label">新对象点数</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="nop"
					name="applicationComposition.nop"
					value="<s:property value="applicationComposition.nop"/>" />个
			</div>
		</div>
		<div class="form-group">
			<label for="prod" class="col-sm-3 control-label">生产率</label>
			<div id="prodRadios">
				<s:radio name="applicationComposition.prod" theme="simple"
					list="%{#{4:'取值为4。开发者的经验/能力为“非常低”，环境成熟度/能力为“非常低”',
				7:'取值为7。开发者的经验/能力为“低”，环境成熟度/能力为“低”',
				13:'取值为13。开发者的经验/能力为“一般”，环境成熟度/能力为“一般”',
				25:'取值为25。开发者的经验/能力为“高”，环境成熟度/能力为“高”',
				25:'取值为50。开发者的经验/能力为“非常高”，环境成熟度/能力为“非常高”'}}"
					value="applicationComposition.prod" listKey="key" ></s:radio>
			</div>
		</div>
		<div class="form-group">
			<label for="monthlyAvg" class="col-sm-3 control-label">人员薪资水平</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="monthlyAvg"
					name="applicationComposition.monthlyAvg"
					value="<s:property value="applicationComposition.monthlyAvg"/>" />万元/人月
			</div>
		</div>
		<input type="hidden" name="applicationComposition.id"
			value="<s:property value="applicationComposition.id"/>" /> 
		<input type="hidden" name="countSession.id"
			value="<s:property value="countSession.id"/>" />
		<div class="footer">
			<input class="btn btn-primary" type="submit" value="估算" /> 
			<input class="btn btn-primary" type="reset" value="重置" />
		</div>
	</form>
	<hr />
	<div id="estimationResult">
		<p>
			工作量：
			<s:property value="applicationComposition.effort" />
			人月
		</p>
		<p>
			成本：
			<s:property value="applicationComposition.cost" />
			万元
		</p>
	</div>
</div>
</div>
<%@ include file="layout/cocomo_footer.jsp"%>
<script>
	$(document).ready(function() {
		$(".form-horizontal").validate({
			rules : {
				"applicationComposition.nop" : {
					required : true,
					digits : true
				},
				"applicationComposition.prod" : "required",
				"applicationComposition.monthlyAvg" : "required"
			}
		});
	});
</script>
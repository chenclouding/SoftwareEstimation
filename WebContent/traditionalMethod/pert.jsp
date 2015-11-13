<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/traditional_head.jsp"%>
<link rel="stylesheet"	href="styles/pert.css" /> 


<div id="content-wrap">
	<h3>PERT估算页面</h3>
	<form class="form-horizontal" id="appForm" action="tradition!editedPert"
		method="post">
		<div class="form-group">
			<label class="col-sm-2 control-label" for="estimateObject" >估算内容</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="estimateObject"
					name="pert.estimateObject"
					value="<s:property value="pert.estimateObject"/>" />
			</div>
		</div>
		<div id="pertItemTitle">
		<label class="valueTitle">乐观值</label>
		<label class="valueTitle">最可能值</label>
		<label class="valueTitle">悲观值</label>
		<label class="valueTitle">权重</label>
		</div>
		<div id="addPertItem">
		<p>
			<input type="text" class="pertItem" name="pert.pertItems[0].optimistic" 
			value="<s:property value="pert.pertItems[0].optimistic"/>" /><input type="text" class="pertItem" name="pert.pertItems[0].pessimistic" 
			value="<s:property value="pert.pertItems[0].pessimistic"/>" /><input type="text" class="pertItem" name="pert.pertItems[0].mostLikely" 
			value="<s:property value="pert.pertItems[0].mostLikely"/>" /><input type="text" class="pertItem" name="pert.pertItems[0].weight" 
			value="<s:property value="pert.pertItems[0].weight"/>" /><a onclick=" $.addNewPertItem();" id="addNew">新增</a>
		</p>
		</div>
		<input type="hidden" name="pert.id"
			value="<s:property value="pert.id"/>" /> 
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
			点估计值：
			<s:property value="pert.effort" />
		</p>
		<p>
			区间估计值（最小）：
			<s:property value="pert.intervalMin" />
		</p>
		<p>
			区间估计值（最大）：
			<s:property value="pert.intervalMax" />
		</p>
	</div>
</div>
</div>
<%@ include file="layout/traditional_footer.jsp"%>
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
	$.extend({
		addNewPertItem : function() {
			var addDiv = $('#addPertItem');
		 	var i = $('#addPertItem input').size();  
			$(
				'<p><input type="text" class="pertItem" name="pert.pertItems['+i+'].optimistic" />'+ 
				'<input type="text" class="pertItem" name="pert.pertItems['+i+'].pessimistic" />'+
				'<input type="text" class="pertItem" name="pert.pertItems['+i+'].mostLikely" />'+
				'<input type="text" class="pertItem" name="pert.pertItems['+i+'].weight" />'+
				'<a onclick="removePertItem(this)" >删除</a></p>')				
				.appendTo(addDiv);
			return false;

		}
	});
	function removePertItem(element){
		var i = $('#addPertItem input').size() + 1; 
		$(element).parents('p').remove();
		return false;
	}
</script>
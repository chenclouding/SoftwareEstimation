<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<div id="wrap">
<%@ include file="layout/traditional_head.jsp"%>
<%@ include file="layout/traditional_sidebar.jsp"%>

<div id="content-wrap">
	<h3>PERT估算页面</h3>
	<form class="form-horizontal" id="appForm" action="pert!editedPert"
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
		<s:if test="pertItems==null">
		<div id="addPertItem">
		<p>
			<input type="text" class="pertItem" name="pertItems[0].optimistic" 
			value="<s:property value="pertItems[0].optimistic"/>" /><input type="text" class="pertItem" name="pertItems[0].mostLikely"
			value="<s:property value="pertItems[0].mostLikely"/>" /><input type="text" class="pertItem" name="pertItems[0].pessimistic" 
			value="<s:property value="pertItems[0].pessimistic"/>" /><input type="text" class="pertItem" name="pertItems[0].weight" 
			value="<s:property value="pertItems[0].weight"/>" /><a onclick=" $.addNewPertItem();" id="addNew">新增</a>
		</p>
		</div>
		</s:if>
		<s:else>
		<div id="addPertItem">
				<s:iterator id="pertItem" value="pertItems" status="index">
			<s:if test="#index.index==0" >
				<p>
			<input type="text" class="pertItem" name="pertItems[0].optimistic" 
			value="<s:property value="#pertItem.optimistic"/>" /><input type="text" class="pertItem" name="pertItems[0].mostLikely"
			value="<s:property value="#pertItem.mostLikely"/>" /><input type="text" class="pertItem" name="pertItems[0].pessimistic" 
			value="<s:property value="#pertItem.pessimistic"/>" /><input type="text" class="pertItem" name="pertItems[0].weight" 
			value="<s:property value="#pertItem.weight"/>" /><a onclick=" $.addNewPertItem();" id="addNew">新增</a>
				</p>
			</s:if>
			<s:else>
			<p>
			<input type="text" class="pertItem" name="pertItems[<s:property value="#index.index" />].optimistic" 
			value="<s:property value="#pertItem.optimistic"/>" /><input type="text" class="pertItem" name="pertItems[<s:property value="#index.index" />].mostLikely"
			value="<s:property value="#pertItem.mostLikely"/>" /><input type="text" class="pertItem" name="pertItems[<s:property value="#index.index" />].pessimistic" 
			value="<s:property value="#pertItem.pessimistic"/>" /><input type="text" class="pertItem" name="pertItems[<s:property value="#index.index" />].weight" 
			value="<s:property value="#pertItem.weight"/>" />
					<a onclick="removePertItem(this)" >删除</a>
				</p>
			</s:else>	
		</s:iterator>
		</div>
		</s:else>
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
			<s:property value="pert.pointEstimate" />
		</p>
		<p>
			区间估计值（最小）：
			<s:property value="pert.intervalEstimateMin" />
		</p>
		<p>
			区间估计值（最大）：
			<s:property value="pert.intervalEstimateMax" />
		</p>
	</div>
</div>
</div>
<%@ include file="/common/layout/footer.jsp"%>
<script>
	$(document).ready(function() {
		$(".form-horizontal").validate({
			rules : {
				"pert.estimateObject" :  "required",
			}
		});
	});
	$.extend({
		addNewPertItem : function() {
			var addDiv = $('#addPertItem');
		 	var i = $('#addPertItem input').size()/4;  
			$(
				'<p><input type="text" class="pertItem" name="pertItems['+i+'].optimistic" />'+ 
				'<input type="text" class="pertItem" name="pertItems['+i+'].mostLikely" />'+
				'<input type="text" class="pertItem" name="pertItems['+i+'].pessimistic" />'+
				'<input type="text" class="pertItem" name="pertItems['+i+'].weight" />'+
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

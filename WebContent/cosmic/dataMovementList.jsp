<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="layout/cosmic_head.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link href="styles/dataMovementList.css" rel="stylesheet" media="all" />
<style>
.col-md-4{
	padding:5px;
 	width:31%; 
	margin:0px 10px 10px 0px;
}
.panel-default,.panel-default .panel-heading{
border-color:#09B1B2
}
.panel-default .panel-heading{
font-size:13px;
} 
</style>
<div id="content-wrap">
<h3>数据移动列表</h3>
<form name="moduleSelectForm"
	id="moduleSelectForm" action="dataMovement!list" method="post">
	<div class="form-group">
		<label for="moduleSelect" class="col-sm-3">选择模块</label>
		<div class="col-sm-7">
			<s:select id="moduleSelect" list="modules" class="form-control"
				listValue="name" listKey="id" name="module.id"
				value="%{module.id}"></s:select>
		</div>
	</div>
	<input type="hidden" name="countSession.id" value="<%=session.getAttribute("countSessionId") %>" />
	<input class="btn btn-primary" type="submit" value="确定" />
</form>
<div id="dataMovementList">
<s:iterator id="functionProcess" value="functionProcesses" status="index">
<div class="panel panel-default">
  <div class="panel-heading">
   <div class="col-md-2">
  <s:property value="#functionProcess.name" />
  </div>
	<a id="dataMovementAdd" href="dataMovement!passParams?functionProcess.id=<s:property value="#functionProcess.id" />&
		countSession.id=<%=session.getAttribute("countSessionId") %>" role="button" data-toggle="modal" data-target="#dataMovementModal">
	<span class="glyphicon glyphicon-plus-sign"></span></a></div>
  <div class="panel-body">
  <s:iterator id="dataMovement" value="#functionProcess.dataMovements">
    <div class="col-md-4" style="background-color:lightcyan;">
	    <div class="col-md-5"><a href="dataMovement!edit?dataMovement.id=<s:property value='#dataMovement.id' />&isDetail=true" role="button"  
	data-toggle="modal" data-target="#dataMovementModal">
	    <s:property value="#dataMovement.name" /></a>
	    </div>
	    <div class="col-md-1">
	    <a id="dataMovementEdit" href="dataMovement!edit?dataMovement.id=<s:property value='#dataMovement.id' />&isDetail=false"
	    role="button" data-toggle="modal" data-target="#dataMovementModal">
		<span class="glyphicon glyphicon-edit"></span></a>
		</div>
		<div class="col-md-1">
		<a id="dataMovementDelete" href="dataMovement!delete?dataMovement.id=<s:property value='#dataMovement.id' />&
		countSession.id=<%=session.getAttribute("countSessionId") %>" >
		<span class="glyphicon glyphicon-trash"></span></a>
		</div>
    </div>
    </s:iterator>
  </div>
 </div>
</s:iterator>
</div>
 </div>
 </div>
 	<!-- Modal for create dataMovement-->
	<div id="dataMovementModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
 <%@ include file="layout/cosmic_footer.jsp"%>
<script>
$('#dataMovementModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
function change(element){
	var index=element.selectedIndex ;             // selectedIndex代表的是你所选中项的index
	var selectedItem = element.options[index].value;
   	var interestObjects=JSON.parse($("#interestObjects").val()); 
	$.each(interestObjects, function(idx, interestObject) {
 		if(interestObject.id==selectedItem){
 			$("#dataGroupSelect").empty(); 
 			$.each(interestObject.dataGroups, function(idx, dataGroup) {
 				$("#dataGroupSelect").append("<option value="+dataGroup.id+">"+
 						dataGroup.name+"</option>"); 
 			});
 			}
 		});  
}
</script>

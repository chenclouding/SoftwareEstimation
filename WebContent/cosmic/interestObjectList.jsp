<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div id="wrap">
<%@ include file="layout/cosmic_head.jsp"%>
<%@ include file="layout/cosmic_sidebar.jsp"%>
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
font-size:15px;
}
#addDataGroup .form-control{
width:88%;
display: inline;
float:left;
}
 #addDataGroup p{
 margin-bottom:15px;
padding:0px 0px 15px 0px;
} 
</style>
<div id="content-wrap">
<h3>兴趣对象列表</h3>
<div id="interestObjectList">
<s:iterator id="module" value="modules" status="index">
<div class="panel panel-default">
  <div class="panel-heading">
   <div class="col-md-6">
  <s:property value="#module.name" />
  </div>
	<a id="interestObjectAdd" href="interestObject!passParams?module.id=<s:property value="#module.id" />&
		countSession.id=<%=session.getAttribute("countSessionId") %>" role="button" data-toggle="modal" data-target="#interestObjectModal">
	<span class="glyphicon glyphicon-plus-sign"></span></a></div>
  <div class="panel-body">
  <s:iterator id="interestObject" value="#module.interestObjects">
    <div class="col-md-4" style="background-color:lightcyan;">
	    <div class="col-md-5"><a href="interestObject!edit?interestObject.id=<s:property value='#interestObject.id' />&isDetail=true" role="button"  
	data-toggle="modal" data-target="#interestObjectModal">
	    <s:property value="#interestObject.name" /></a>
	    </div>
	    <div class="col-md-1">
	    <a id="interestObjectEdit" href="interestObject!edit?interestObject.id=<s:property value='#interestObject.id' />&isDetail=false"
	    role="button" data-toggle="modal" data-target="#interestObjectModal">
		<span class="glyphicon glyphicon-edit"></span></a>
		</div>
		<div class="col-md-1">
		<a id="interestObjectDelete" href="interestObject!delete?interestObject.id=<s:property value='#interestObject.id' />&
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
 	<!-- Modal for create interestObject-->
	<div id="interestObjectModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
 <%@ include file="/common/layout/footer.jsp"%>
<script>

$('#interestObjectModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
$.extend({
	addNewDataGroup : function() {
		var addDiv = $('#addDataGroup');
	 	var i = $('#addDataGroup input').size();  
		$(
			'<p><input type="text" class="form-control" name="interestObject.dataGroups['+i+'].name" /><a onclick="removeDataGroup(this)" >删除</a> </p>')
			.appendTo(addDiv);
		return false;

	}
});
function removeDataGroup(element){
	var i = $('#addDataGroup input').size() + 1; 
	$(element).parents('p').remove();
	return false;
}
</script>

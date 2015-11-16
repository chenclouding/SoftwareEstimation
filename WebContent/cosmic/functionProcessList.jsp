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

</style>
<div id="content-wrap">
<h3>功能流程列表</h3>
<div id="functionProcessList">
<s:iterator id="module" value="modules" status="index">
<div class="panel panel-default">
  <div class="panel-heading">
   <div class="col-md-6">
  <s:property value="#module.name" />
  </div>
	<a id="functionProcessAdd" href="functionProcess!passParams?module.id=<s:property value="#module.id" />&
		countSession.id=<%=session.getAttribute("countSessionId") %>" role="button" data-toggle="modal" data-target="#functionProcessModal">
	<span class="glyphicon glyphicon-plus-sign"></span></a></div>
  <div class="panel-body">
  <s:iterator id="functionProcess" value="#module.functionProcesses">
    <div class="col-md-4" style="background-color:lightcyan;">
	    <div class="col-md-5"><a href="functionProcess!edit?functionProcess.id=<s:property value='#functionProcess.id' />&isDetail=true" role="button"  
	data-toggle="modal" data-target="#functionProcessModal">
	    <s:property value="#functionProcess.name" /></a>
	    </div>
	    <div class="col-md-1">
	    <a id="functionProcessEdit" href="functionProcess!edit?functionProcess.id=<s:property value='#functionProcess.id' />&isDetail=false"
	    role="button" data-toggle="modal" data-target="#functionProcessModal">
		<span class="glyphicon glyphicon-edit"></span></a>
		</div>
		<div class="col-md-1">
		<a id="functionProcessDelete" href="functionProcess!delete?functionProcess.id=<s:property value='#functionProcess.id' />&
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
 	<!-- Modal for create functionProcess-->
	<div id="functionProcessModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
 <%@ include file="/common/layout/footer.jsp"%>
<script>

$('#functionProcessModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
</script>

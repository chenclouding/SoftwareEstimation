<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<div id="wrap">
<%@ include file="layout/nesma_head.jsp"%>
<%@ include file="layout/nesma_sidebar.jsp"%>
<style>
.col-md-6{
	padding:5px;
	width:48%;
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
<h3>事务功能列表</h3>
<div id="transFunctionList">
<s:iterator id="module" value="modules" status="index">
<div class="panel panel-default">
  <div class="panel-heading">
   <div class="col-md-2">
  <s:property value="#module.name" />
  </div>
	<a id="transFunctionAdd" href="transFunction!passParams?module.id=<s:property value="#module.id" />&
		countSession.id=<%=session.getAttribute("countSessionId") %>" role="button" data-toggle="modal" data-target="#transFunctionModal">
	<span class="glyphicon glyphicon-plus-sign"></span></a></div>
  <div class="panel-body">
  <s:iterator id="transFunction" value="#module.transFunctions">
    <div class="col-md-6" style="background-color:lightcyan;">
	    <div class="col-md-5"><a href="transFunction!edit?transFunction.id=<s:property value='#transFunction.id' />&isDetail=true" role="button"  
	data-toggle="modal" data-target="#transFunctionModal">
	    <s:property value="#transFunction.name" /></a>
	    </div>
	    <div class="col-md-1">
	    <s:property value="#transFunction.type" />
	    </div>
	    <div class="col-md-1">
	    <s:property value="#transFunction.fpCount" />
	    </div>
	    <div class="col-md-1">
	    <a id="transFunctionEdit" href="transFunction!edit?transFunction.id=<s:property value='#transFunction.id' />&isDetail=false"
	    role="button" data-toggle="modal" data-target="#transFunctionModal">
		<span class="glyphicon glyphicon-edit"></span></a>
		</div>
		<div class="col-md-1">
		<a id="transFunctionDelete" href="transFunction!delete?transFunction.id=<s:property value='#transFunction.id' />&
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
 	<!-- Modal for create transFunction-->
	<div id="transFunctionModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
 <%@ include file="/common/layout/footer.jsp"%>
<script>

$('#transFunctionModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
</script>

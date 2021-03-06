<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="scripts/rowspan.js"></script>
<div id="wrap">
<%@ include file="layout/cosmic_head.jsp"%>
<%@ include file="layout/cosmic_sidebar.jsp"%>
<style>
.col-md-6, .col-md-5{
padding-left:0px;
}
.col-md-5{
margin-bottom:10px;
}
</style>
<div id="content-wrap">
	<h3>功能点规模估算结果</h3>
	<div id="estimateResultList">
		<div class="estimateResultTitle">
			<div class="col-md-6">
				<div class="col-md-5">项目名称：</div>
				<s:property value="project.name" />
			</div>
			<div class="col-md-6">
				<div class="col-md-5">估算场景名称：</div>
				<s:property value="countSession.name" />
			</div>
			<div class="col-md-6">
				<div class="col-md-5">采用的估算方法：</div>
				<s:property value="countSession.methodType" />
			</div>
			<div class="col-md-6">
				<div class="col-md-5">估算人员：</div>
				<%=session.getAttribute("userEmail")%>
			</div>
			<div class="col-md-6">
				<div class="col-md-5">功能点总数：</div>
				<s:property value="countSession.ufpc" />
				CFP
			</div>
		</div>
		<table class="table table-bordered" id="estimateResult_table">
			<thead>
				<tr>
					<th>模块</th>
					<th>功能过程</th>
					<th>数据移动</th>
					<th>类型</th>
					<th>功能点数</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="module" value="modules" status="index">			
				  <s:iterator id="functionProcess" value="#module.functionProcesses">
				  	<s:iterator id="dataMovement" value="#functionProcess.dataMovements">
					<tr>
						<td><s:property value="#module.name" /></td>
						<td><s:property value="#functionProcess.name" /></td>
						<td><s:property value="#dataMovement.name" /></td>
						<td><s:property value="#dataMovement.type" /></td>
						<td>1</td>
					</tr>
					</s:iterator>
					</s:iterator>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>
</div>
 <%@ include file="/common/layout/footer.jsp"%>
<script type="text/javascript">
$(function() {
 	$("#estimateResult_table").rowspan(0); 
 	$("#estimateResult_table").rowspan(1); 
});
</script>
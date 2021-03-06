<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div id="wrap">
<s:if test="organizations!=null">	
<%@ include file="layout/sysAdmin_head.jsp"%>
<%@ include file="layout/sysAdmin_sidebar.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/orgAdmin_head.jsp"%>
<%@ include file="layout/orgAdmin_sidebar.jsp"%>
</s:else>
<link href="styles/moduleList.css" rel="stylesheet" media="all" />
<script src="scripts/rowspan.js"></script>
<div id="content-wrap">
<div id="countSession">
	<h3>估算会话列表</h3>
	<div id="countSessionList">

	<s:if test="organizations==null">	
		<table class="table table-bordered" id="countSession_table">
			<tr>
				<td>项目名称</td>
				<td>估算名称</td>
				<td>估算方法</td>
				<td>新建时间</td>
				<td>功能点数</td>
				<td>工作量</td>						
			</tr>
				<s:iterator id="project" value="projects">
						<s:iterator id="countSession" value="#project.countSessions">
				<tr>
				<td><s:property value="#project.name" /></td>
					<td><s:property value="#countSession.name" /></td>
					<td><s:property value="#countSession.methodType" /></td>
					<td><s:date name="#countSession.time" format="yyyy-MM-dd"/></td>
					<td><s:property value="#countSession.ufpc" /></td>
					<td><a href="cocomo!getAllEstimations?countSession.id=<s:property value='#countSession.id' />" role="button"  
	data-toggle="modal" data-target="#cocomoListModal">查看详情</a></td>
				</tr>
			</s:iterator>
			</s:iterator>
		</table>
		</s:if>
<s:else>
		<table class="table table-bordered" id="countSession_table">
			<tr>
				<td>组织名称</td>
				<td>项目名称</td>
				<td>估算名称</td>
				<td>估算方法</td>
				<td>新建时间</td>
				<td>功能点数</td>					
				<td>工作量</td>
			</tr>
			<s:iterator id="org" value="organizations">
			<s:iterator id="user" value="#org.users">
				<s:iterator id="project" value="#user.projects">
						<s:iterator id="countSession" value="#project.countSessions">
				<tr>
				<td><s:property value="#org.name" /></td>
				<td><s:property value="#project.name" /></td>
					<td><s:property value="#countSession.name" /></td>
					<td><s:property value="#countSession.methodType" /></td>
					<td><s:date name="#countSession.time" format="yyyy-MM-dd"/></td>
					<td><s:property value="#countSession.ufpc" /></td>
					<td><a href="cocomo!getAllEstimations?countSession.id=<s:property value='#countSession.id' />" role="button"  
	data-toggle="modal" data-target="#cocomoListModal">查看详情</a></td>
					
				</tr>
			</s:iterator>
			</s:iterator>
						</s:iterator>
						</s:iterator>
		</table>
</s:else>
	</div>
</div>
</div>
</div>
<%@ include file="/common/layout/footer.jsp"%>

		<!-- Modal for list cocomo estimation results-->
	<div id="cocomoListModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>

<script type="text/javascript">
$(function() {
 	$("#countSession_table").rowspan(0);
	$("#countSession_table").rowspan(1); 
	$('#cocomoListModal').on('hide.bs.modal', function(e) {
		$(this).removeData();
	});
});
</script>
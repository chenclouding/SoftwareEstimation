<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<link href="styles/moduleList.css" rel="stylesheet" media="all" />
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div id="wrap">
<%@ include file="layout/commonUser_head.jsp"%>
<%@ include file="layout/commonUser_sidebar.jsp"%>
<div id="content-wrap">
<div id="countSession">
	<h3>估算会话列表</h3>
	<form name="projectSelectForm"
		id="projectSelectForm" action="countSession!list" method="post">
		<div class="form-group">
			<label for="projectSelect" class="col-sm-3">选择项目</label>
			<div class="col-sm-7">
				<s:select id="projectSelect" list="projects" class="form-control"
					listValue="name" listKey="id" name="project.id"
					value="%{project.id}"></s:select>
			</div>
		</div>
		<input class="btn btn-primary" type="submit" value="确定" />
	</form>
	<div id="countSessionForm">
			<a id="countSessionAdd" href="common/countSession.jsp" role="button" data-toggle="modal" data-target="#countSessionModal">
			<span class="glyphicon glyphicon-plus-sign"></span>
		</a>
	</div>
	<div id="countSessionList">
		<table class="table table-bordered" id="countSession_table">
			<tr>
				<td>序号</td>
				<td>名称</td>
				<td>估算方法</td>
				<td>新建时间</td>
				<td>功能点数</td>
				<td colspan="2">工作量</td>						
				<td>修改</td>
				<td>删除</td>
				<td>开始估算</td>
			</tr>
			<s:iterator id="countSession" value="countSessions" status="index">
				<tr>
					<td><s:property value="#index.count" /></td>
					<td>
			<a href="countSession!edit?countSession.id=<s:property value='#countSession.id' />&isDetail=true" role="button"  
	data-toggle="modal" data-target="#countSessionModal"><s:property value="#countSession.name" /> </a>
					</td>
					<td><s:property value="#countSession.methodType" /></td>
					<td><s:date name="#countSession.time" format="yyyy-MM-dd"/></td>
					<td><a href="countSession!select?countSession.id=<s:property value='#countSession.id' />">
					<s:if test="#countSession.ufpc==null">0
					</s:if>
					<s:else>
						<s:property value="#countSession.ufpc" />
					</s:else></a></td>
					
					<td><a href="cocomo!getAllEstimations?countSession.id=<s:property value='#countSession.id' />" role="button"  
	data-toggle="modal" data-target="#cocomoListModal">查看</a></td>
					<td><a href="countSession!cocomo?countSession.id=<s:property value='#countSession.id' />">修改</a></td>
					<td>
					<a href="countSession!edit?countSession.id=<s:property value='#countSession.id' />&isDetail=false" role="button"  
	data-toggle="modal" data-target="#countSessionModal"><span class="glyphicon glyphicon-edit"></span></a>
					</td>
					<td><a
						href="countSession!delete?countSession.id=<s:property value="#countSession.id" />&
						project.id=<%=session.getAttribute("projectId")%>">
							<span class="glyphicon glyphicon-trash"></span>
					</a></td>
						<td><a href="countSession!select?countSession.id=<s:property value="#countSession.id" />">开始估算</a></td>
				</tr>
			</s:iterator>
		</table>
	</div>
</div>
</div>
</div>
	<!-- Modal for create session-->
	<div id="countSessionModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
		<!-- Modal for list cocomo estimation results-->
	<div id="cocomoListModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
 <%@ include file="/common/layout/footer.jsp"%>
<script>
$('#countSessionModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
$('#cocomoListModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
</script>
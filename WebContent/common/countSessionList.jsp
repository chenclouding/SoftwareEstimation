<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="layout/commonUser_head.jsp"%>
<link href="styles/moduleList.css" rel="stylesheet" media="all" />
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<%-- 		<a id="countSessionAdd"
			onclick="window.parent.$.showCountSessionModal('<%=session.getAttribute("projectId")%>','add');">
			<span class="glyphicon glyphicon-plus-sign"></span>
		</a> --%>
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
				<td>修改</td>
				<td>删除</td>
				<td>开始估算</td>
			</tr>
			<s:iterator id="countSession" value="countSessions" status="index">
				<tr>
					<td><s:property value="#index.count" /></td>
					<td><%-- <a
						onclick="window.parent.$.showCountSessionModal(<s:property value='#countSession.id' />,'detail');">
							<s:property value="#countSession.name" />
					</a> --%>
			<a href="countSession!edit?countSession.id=<s:property value='#countSession.id' />&isDetail=true" role="button"  
	data-toggle="modal" data-target="#countSessionModal"><s:property value="#countSession.name" /> </a>
					</td>
					<td><s:property value="#countSession.methodType" /></td>
					<td><s:date name="#countSession.time" format="yyyy-MM-dd"/></td>
					<td><%-- <a
						onclick="window.parent.$.showCountSessionModal(<s:property value='#countSession.id' />,'edit');">
							<span class="glyphicon glyphicon-edit"></span>
					</a> --%>
					<a href="countSession!edit?countSession.id=<s:property value='#countSession.id' />&isDetail=false" role="button"  
	data-toggle="modal" data-target="#countSessionModal"><span class="glyphicon glyphicon-edit"></span></a>
					</td>
					<td><a
						href="countSession!delete?countSession.id=<s:property value="#countSession.id" />&
						project.id=<%=session.getAttribute("projectId")%>">
							<span class="glyphicon glyphicon-trash"></span>
					</a></td>
					<td><a>开始估算</a></td>
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
	<%@ include file="layout/commonUser_footer.jsp"%>
<script>
$('#countSessionModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
</script>
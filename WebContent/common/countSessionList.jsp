<%@ include file="layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="styles/moduleList.css" rel="stylesheet" media="all" />
<div id="countSession">
	<h3>估算会话列表</h3>
	<form class="form-horizontal" name="projectSelectForm"
		id="projectSelectForm" action="countSession!list" method="post">
		<div class="form-group">
			<label for="projectSelect" class="col-sm-3">选择项目</label>
			<div class="col-sm-7">
				<s:select class="form-control" id="projectSelect" list="projects"
					listValue="name" listKey="id" name="project.id"
					value="%{project.id}"></s:select>
			</div>
		</div>
		<input class="btn btn-primary" type="submit" value="确定" />
	</form>
	<div id="countSessionForm">
		<a id="countSessionAdd"
			onclick="window.parent.$.showCountSessionModal('<%=session.getAttribute("projectId")%>','add');">
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
					<td><a
						onclick="window.parent.$.showCountSessionModal(<s:property value='#countSession.id' />,'detail');">
							<s:property value="#countSession.name" />
					</a></td>
					<td><s:property value="#countSession.methodType" /></td>
					<td><s:date name="#countSession.time" format="yyyy-MM-dd"/></td>
					<td><a
						onclick="window.parent.$.showCountSessionModal(<s:property value='#countSession.id' />,'edit');">
							<span class="glyphicon glyphicon-edit"></span>
					</a></td>
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
<script>
$.extend({
	postCountSessionData : function(countSessionData, actionName) {
		$.post(actionName, countSessionData, function(data) {
			var doms = $.parseHTML(data);
			$("#countSession").html(doms);
		});
	}
});
</script>
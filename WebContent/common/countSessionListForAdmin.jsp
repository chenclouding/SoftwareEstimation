<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<s:if test="organizations!=null">	
<%@ include file="layout/sysAdmin_head.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/orgAdmin_head.jsp"%>
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
				<td>查看详情</td>
			</tr>
				<s:iterator id="project" value="projects">
						<s:iterator id="countSession" value="#project.countSessions">
				<tr>
				<td><s:property value="#project.name" /></td>
					<td><s:property value="#countSession.name" /></td>
					<td><s:property value="#countSession.methodType" /></td>
					<td><s:date name="#countSession.time" format="yyyy-MM-dd"/></td>
					<td>功能点数</td>
					<td>工作量</td>
					<td><a>查看详情</a></td>
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
				<td>查看详情</td>
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
					<td>功能点数</td>
					<td>工作量</td>
					<td><a>查看详情</a></td>
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
<s:if test="organizations!=null">	
<%@ include file="layout/sysAdmin_footer.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/orgAdmin_footer.jsp"%>
</s:else>

<script type="text/javascript">
$(function() {
 	$("#countSession_table").rowspan(0);
	$("#countSession_table").rowspan(1); 
});
</script>
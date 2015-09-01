<%@ include file="layout/sysAdmin_head.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content-wrap">
	<div id="orgList">
		<h3>组织列表</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>联系人</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>修改</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="org" value="organizations" status="index">
					<tr>
						<td><s:property value="#index.count" /></td>
						<td>
						<%-- <a onclick="window.parent.$.showModal(<s:property value='#org.id' />,'detail');"> --%>
	<a href="organization!edit?organization.id=<s:property value='#org.id' />&isDetail=true" role="button"  name="detail"
	data-toggle="modal" data-target="#organizationModal">	
						<s:property value="#org.name" /></a></td>
						<td><s:property value="#org.contact" /></td>
						<td><s:property value="#org.phone" /></td>
						<td><s:property value="#org.email" /></td>
						<td>
	<a href="organization!edit?organization.id=<s:property value='#org.id' />&isDetail=false" role="button"  
	data-toggle="modal" data-target="#organizationModal">	
		<%-- 				<a onclick="window.parent.$.showModal(<s:property value='#org.id' />,'edit');">  --%>
						<span class="glyphicon glyphicon-edit"></span>
						</a></td>
						<td><a
							href="organization!delete?organization.id=<s:property value="#org.id" />">
								<span class="glyphicon glyphicon-trash"></span>
						</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- Modal for Organization Register -->
<div id="organizationModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		</div>
	</div>
</div>
<%@ include file="layout/sysAdmin_footer.jsp"%>
<script>
$('#organizationModal').on('hide.bs.modal', function(e) {
	$(this).removeData();
});
</script>
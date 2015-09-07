<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="organization==null">	
<%@ include file="layout/sysAdmin_head.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/orgAdmin_head.jsp"%>
</s:else>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/bootstrap-switch.min.css" />
<script src="scripts/bootstrap-switch.min.js"></script>
<script src="scripts/rowspan.js"></script>
<div id="content-wrap">
	<div id="userList">
		<h3>用户列表</h3>
		<table class="table table-bordered" id="user_table">
			<thead>
				<tr>
					<s:if test="organization==null">				
					<th>组织名称</th>
					</s:if>
					<th>邮箱</th>
					<th>姓名</th>
					<th>组织管理员</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="organization==null">
				<s:iterator id="org" value="organizations">
						<s:iterator id="user" value="#org.users">
						<tr>
							<td><s:property value="#org.name" /></td>
							<td><s:property value="#user.email" /></td>
							<td><s:property value="#user.name" /></td>						
							<td>
							<input type="hidden" value="<s:property value="#user.id" />" />
							<s:if test="#user.role==2">
							    <input type="checkbox" name="my-checkbox" data-size="mini" data-animate="false" 
    							data-on-text="是" data-off-text="否" data-on-color="info" />
							</s:if>			
							<s:else>
							    <input type="checkbox" name="my-checkbox" data-size="mini" data-animate="false" 
    							data-on-text="是" data-off-text="否" checked data-on-color="info" />
							</s:else>
							</td>
							<td><a href="user!delete?user.id=<s:property value="#user.id" />">
								<span class="glyphicon glyphicon-trash"></span>
							</a></td>
						</tr>
					</s:iterator>
				</s:iterator>
				</s:if>
				<s:else>
					<s:iterator id="user" value="users">
						<tr>
							<td><s:property value="#user.email" /></td>
							<td><s:property value="#user.name" /></td>						
							<td>
							<input type="hidden" value="<s:property value="#user.id" />" />
							<s:if test="#user.role==2">
							    <input type="checkbox" name="my-checkbox" data-size="mini" data-animate="false" 
    							data-on-text="是" data-off-text="否" data-on-color="info" />
							</s:if>			
							<s:else>
							    <input type="checkbox" name="my-checkbox" data-size="mini" data-animate="false" 
    							data-on-text="是" data-off-text="否" checked data-on-color="info" />
							</s:else>
							</td>
							<td><a href="user!delete?user.id=<s:property value="#user.id" />&organization.id=<%=session.getAttribute("orgId") %>">
								<span class="glyphicon glyphicon-trash"></span>
							</a></td>
						</tr>
					</s:iterator>
				</s:else>

			</tbody>
		</table>
	</div>
</div>
</div>
<s:if test="organization==null">	
<%@ include file="layout/sysAdmin_footer.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/orgAdmin_footer.jsp"%>
</s:else>

<script type="text/javascript">
$(function() {
	$("#user_table").rowspan(0);
	$("[name='my-checkbox']").bootstrapSwitch();//修改是否为组织管理员
	$('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function(event, state) {
		var inputNodeElement = this.parentNode.parentNode.parentNode.childNodes[1];
 		var userId = inputNodeElement.value;
		var userRole = (state==true)?1:2;
		$.post("user!edited", {"user.id": userId,"user.role": userRole});
	});
});
</script>

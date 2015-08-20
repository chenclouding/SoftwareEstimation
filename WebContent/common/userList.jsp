<%@ include file="layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/bootstrap-switch.min.css" />
<script src="scripts/bootstrap-switch.min.js"></script>

<body>
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
</body>
<script type="text/javascript">
jQuery.fn.rowspan = function(colIdx) { //合并相同的行
	return this.each(function() {
		var that;
		$('tr', this).each(function(row) {
			$('td:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {
				if (that != null && $(this).html() == $(that).html()) {
					rowspan = $(that).attr("rowSpan");
					if (rowspan == undefined) {
						$(that).attr("rowSpan",1);
						rowspan = $(that).attr("rowSpan");
					}
					rowspan = Number(rowspan) + 1;
					$(that).attr("rowSpan",rowspan);
					$(this).hide();
				} else {
					that = this;
				}
			});
		});
	});
}
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

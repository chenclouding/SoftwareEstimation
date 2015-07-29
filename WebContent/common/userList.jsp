<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap-switch.min.css">
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap-switch.min.js"></script>
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
	$("[name='my-checkbox']").bootstrapSwitch();
	$('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function(event, state) {
		  console.log(this); // DOM element
		  console.log(event); // jQuery event
		  console.log(state); // true | false
		});
});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="userList">
		<h3>用户列表</h3>
		<table class="table table-bordered" id="user_table">
			<thead>
				<tr>
					<th>组织名称</th>
					<th>邮箱</th>
					<th>姓名</th>
					<th>组织管理员</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="org" value="organizations">
					<s:iterator id="user" value="#org.users">
						<tr>
							<td><s:property value="#org.name" /></td>
							<td><s:property value="#user.email" /></td>
							<td><s:property value="#user.name" /></td>
							<td><s:if test="#user.role==2">
							    <input type="checkbox" name="my-checkbox" data-size="mini" data-animate="false" 
    							data-on-text="是" data-off-text="否" data-on-color="info" />
							</s:if>			
							<s:else>
							    <input type="checkbox" name="my-checkbox" data-size="mini" data-animate="false" 
    							data-on-text="是" data-off-text="否" checked data-on-color="info" />
							</s:else></td>
							<%-- <s:property value="#user.role" /></td> --%>
							<td><a href="user!delete?user.id=<s:property value="#user.id" />">
								<span class="glyphicon glyphicon-trash"></span>
							</a></td>
						</tr>
					</s:iterator>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
</html>
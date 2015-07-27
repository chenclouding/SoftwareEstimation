<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/common.css">
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
<script type="text/javascript">
jQuery.fn.rowspan = function(colIdx) { //封装的一个JQuery小插件 
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
							<td><s:property value="#user.role" /></td>
							<td><a href="user!delete?user.id=<s:property value="#user.id" />">
									<i class="icon-trash"></i>
							</a></td>
						</tr>
					</s:iterator>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>系统管理员</h1>
	<ul class="sidemenu">
		<li><a href="organization!list">组织管理</a></li>
		<li><a href="#">项目管理</a></li>
		<li><a href="user!list">用户管理</a></li>
		<li><a href="common/resetPassword.jsp">修改密码</a></li>
	</ul>
</div>
<!-- Footer -->
<div id="footer">
	<p>&copy; 2015 北航软件所 &nbsp;&nbsp; 公司地址：北京市海淀区学院路37号 &nbsp;&nbsp;
		电话：010－82318974 &nbsp;&nbsp;</p>

</div>
<script>
	$(document).ready(function(){
		var height = $(document).height(); //浏览器当前窗口可视区域高度
		 $("#wrap").css("min-height",height-60);
		
	});
</script>

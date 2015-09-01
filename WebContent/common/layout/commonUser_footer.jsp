<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>一般用户</h1>
	<ul class="sidemenu">
		<li><a
			href="project!list?user.id=<%=session.getAttribute("userId") %>"
			target="main">项目管理</a></li>
		<li><a
			href="project!listProjects?user.id=<%=session.getAttribute("userId") %>"
			target="main">模块分解</a></li>
		<li><a
			href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>"
			target="main">估算场景</a></li>
		<li><a
			href="user!edit?user.id=<%=session.getAttribute("userId") %>"
			target="main">修改个人信息</a></li>
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
	 $("#wrap").css("min-height",height);
});
</script>
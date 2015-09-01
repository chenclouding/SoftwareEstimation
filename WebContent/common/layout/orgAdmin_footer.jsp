<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>组织管理员</h1>
	<ul class="sidemenu">
		<li><a
			href="organization!edit?organization.id=
					<%=session.getAttribute("orgId") %>&isDetail=false"
			target="main">修改组织</a></li>
		<li><a href="#" target="main">项目管理</a></li>
		<li><a
			href="user!list?organization.id=<%=session.getAttribute("orgId") %>"
			target="main">用户管理</a></li>
		<li><a
			href="param!edit?organization.id=<%=session.getAttribute("orgId") %>"
			target="main">设置调整因子</a></li>
		<li><a
			href="devLang!edit?organization.id=<%=session.getAttribute("orgId") %>"
			target="main">设置编程语言</a></li>
		<li><a href="common/resetPassword.jsp" target="main">修改密码</a></li>
	</ul>
</div>
<!--End content-wrap-->
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

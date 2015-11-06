<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>COCOMO II模型</h1>
	<ul class="sidemenu">
		<li class="submenu"><a href="welcome.jsp">使用帮助</a></li>
		<li class="submenu"><a href="cocomo!editAppComp?countSession.id=<%=session.getAttribute("countSessionId") %>">应用组装子模型</a></li>
		<li class="submenu"><a href="cocomo!editEarlyDesign?countSession.id=<%=session.getAttribute("countSessionId") %>">早期设计子模型</a></li>
		<li class="submenu"><a href="">后体系架构子模型</a></li>
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
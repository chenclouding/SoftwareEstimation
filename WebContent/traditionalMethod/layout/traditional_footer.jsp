<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>传统估算方法</h1>
	<ul class="sidemenu">
		<li class="submenu"><a href="traditionalMethod/welcome.jsp">使用帮助</a></li>
		<li class="submenu"><a href="tradition!pert?countSession.id=<%=session.getAttribute("countSessionId") %>">PERT法</a></li>
		<li class="submenu"><a href="traditionalMethod/delphi.jsp">Delphi法</a></li>
		<li class="submenu"><a href="tradition!editPostArchitecture?countSession.id=<%=session.getAttribute("countSessionId") %>">类比法</a></li>
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
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<h1>cosmic全功能点方法</h1>
	<ul class="sidemenu">
	<li class="category">识别功能过程</li>
		<li class="submenu"><a href="functionProcess!list?countSession.id=<%=session.getAttribute("countSessionId") %>">功能流程</a></li>
		<li class="submenu"><a href="interestObject!list?countSession.id=<%=session.getAttribute("countSessionId") %>">兴趣对象与数据组</a></li>
	<li class="category">识别数据移动</li>
		<li class="submenu"><a href="dataMovement!list?countSession.id=<%=session.getAttribute("countSessionId") %>">添加数据移动</a></li>
		<li class="submenu"><a href="countSession!listDataMovements?countSession.id=<%=session.getAttribute("countSessionId") %>">度量结果查看</a></li>
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
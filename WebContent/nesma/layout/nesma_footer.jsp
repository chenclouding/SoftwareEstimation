<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
<s:if test="#session.methodType=='NESMA-预估型'" >
	<h1>nesma预估型</h1>
	</s:if>
	<s:if test="#session.methodType=='NESMA-估计型'" >
 	<h1>nesma估计型</h1>
 	</s:if>
<s:if test="#session.methodType=='NESMA-详细型'" >
	<h1>nesma详细型</h1>
	</s:if>
	<s:if test="#session.methodType=='IFPUG'" >
	<h1>ifpug</h1> 
	</s:if>
	<ul class="sidemenu">
			<li><a href="dataFunction!list?countSession.id=<%=session.getAttribute("countSessionId") %>&listAll=false">数据功能</a></li>
			<s:if test="#session.methodType!='NESMA-预估型'" >
			<li><a href="transFunction!list?countSession.id=<%=session.getAttribute("countSessionId") %>&listAll=false">事务功能</a></li>
			</s:if>
			<li><a href="dataFunction!list?countSession.id=<%=session.getAttribute("countSessionId") %>&listAll=true">度量结果查看</a></li>
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
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
			<li><a href="nesma/welcome.jsp">使用帮助</a></li>
			<li><a href="dataFunction!list?countSession.id=<%=session.getAttribute("countSessionId") %>">数据功能</a></li>
			<s:if test="#session.methodType!='NESMA-预估型'" >
			<li><a href="transFunction!list?countSession.id=<%=session.getAttribute("countSessionId") %>">事务功能</a></li>
			</s:if>
			<li><a href="countSession!listFunctions?countSession.id=<%=session.getAttribute("countSessionId") %>">度量结果查看</a></li>
	</ul>
</div>

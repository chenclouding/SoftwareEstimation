<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="#session.userRole==1">	
<%@ include file="layout/orgAdmin_head.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/commonUser_head.jsp"%>
</s:else>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content-wrap">
<h3 class="welcome">欢迎使用软件估算工具^-^</h3>
</div>
</div>
<s:if test="#session.userRole==1">
<%@ include file="layout/orgAdmin_footer.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/commonUser_footer.jsp"%>
</s:else>
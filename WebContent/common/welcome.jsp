<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<div id="wrap">
<s:if test="#session.userRole==1">	
<%@ include file="layout/orgAdmin_head.jsp"%>
<%@ include file="layout/orgAdmin_sidebar.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/commonUser_head.jsp"%>
<%@ include file="layout/commonUser_sidebar.jsp"%>
</s:else>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content-wrap">
<h3 class="welcome">欢迎使用软件估算工具^-^</h3>
</div>
</div>
 <%@ include file="/common/layout/footer.jsp"%>
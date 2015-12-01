<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ include file="/common/layout/commonInclude.jsp"%>
  <link rel="stylesheet"	href="styles/param.css" /> 
<div id="wrap">
<%@ include file="/common/layout/orgAdmin_head.jsp"%>
<%@ include file="/common/layout/orgAdmin_sidebar.jsp"%>
<div id="content-wrap">
<h3>已有编程语言</h3>	
 <form class="form-horizontal" id="devLangEditForm" 
action="devLang!edited?organization.id=<%=session.getAttribute("orgId") %>" method="post">
<s:actionmessage /> 
<s:actionerror />  
<s:iterator value="devLangs" id="devLang" status="status">
<div class="form-group form-group-sm">
	<label class="col-sm-3 control-label"><s:property value="%{#devLang.name}"/></label>
		<s:textfield type="hidden" name ="devLangs[%{#status.index}].id" value="%{#devLang.id}" />
	<div class="col-sm-7">
		<s:textfield type="text" class="form-control" name ="devLangs[%{#status.index}].linesPerFP" 
		value="%{#devLang.linesPerFP}" />
	</div>
	<a href="devLang!delete?devLang.id=<s:property value="%{#devLang.id}" />&
	organization.id=<%=session.getAttribute("orgId") %>"><span class="glyphicon glyphicon-trash"></span></a>
</div>
</s:iterator>
<div class="footer">
	<input class="btn btn-primary" type="submit" value="修改 "/>
</div>
</form>
<form class="form-horizontal" id="devLangAddForm" 
action="devLang!add?organization.id=<%=session.getAttribute("orgId") %>" method="post">
<h3>新增编程语言</h3>
<div class="form-group form-group-sm">
	<label for="devLangName" class="col-sm-3 control-label">编程语言</label>
	<div class="col-sm-7">
		<input type="text" class="form-control" id="devLangName" name="devLang.name" />
	</div>
</div>
<div class="form-group form-group-sm">
	<label for="devLangLines" class="col-sm-3 control-label">源代码行数/功能点</label>
	<div class="col-sm-7">
		<input type="text" class="form-control" id="devLangLines" name="devLang.linesPerFP" />
		LOC/FP
	</div>
</div>
<div class="footer">
	<input class="btn btn-primary" type="submit" value="保 存 "/>
	<input class="btn btn-primary" type="reset" value="重置" />
</div>
</form>
</div>
</div>
 <%@ include file="/common/layout/footer.jsp"%>

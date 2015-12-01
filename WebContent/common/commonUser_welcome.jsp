<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<div id="wrap">
<%@ include file="layout/commonUser_head.jsp"%>
<%@ include file="layout/commonUser_sidebar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/welcome.css" />
<div id="content-wrap">
<h3>软件估算流程说明</h3>
<p>用户登录后，需要新建项目、拆分功能模块和新建估算场景，这三步分别对应于左边目录的三项。</p>
<ol>
<li>首先输入项目基本信息，新建项目。新增后可以看到所有项目列表。</li>
<img src="img/help/common/project_create.png"
	 alt="新建项目" class="img_inserted" />
 <img src="img/help/common/project_list.png"
	 alt="新建项目" class="img_inserted" />
<br /><br />
<li>点击“模块分解”，先选择需要进行分解的项目，然后添加模块。</li>
<img src="img/help/common/module_list.png"
	 alt="新建项目" class="img_inserted" />
<li>点击“估算场景”，先选择需要增加估算场景的项目，然后新建估算场景，选择估算方法。</li>
<img src="img/help/common/countSession_create.png"
	 alt="新建项目" class="img_inserted" />
<br /><br />
<li>点击估算会话列表中的“开始估算”，可进入相应的估算界面。点击“工作量”一栏下的“修改”可以进入COCOMO II模型估算界面。</li>
 <img src="img/help/common/countSession_list.png"
	 alt="新建项目" class="img_inserted" />
<br /><br />
</ol>
</div>
</div>
 <%@ include file="/common/layout/footer.jsp"%>
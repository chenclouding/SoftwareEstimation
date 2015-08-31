<%@ include file="layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" media="screen" href="styles/index.css" />
</head>
<body>
	<!-- Wrap -->
	<div id="wrap">

		<!-- Header -->
		<div id="header">

			<h1 id="logo">软件成本估算工具</h1>
			<h2 id="slogan">提供更快捷的软件估算支持平台...</h2>

			<div id="searchform">
				<form method="post" class="search" action="#">
					<p>
						<input name="search_query" class="textbox" type="text" /> <input
							name="search" class="button" type="submit" value="搜索" />
					</p>
				</form>
			</div>
		</div>

		<!-- menu -->
		<div id="menu">
			<ul>
				<li><a href="project!list?user.id=<%=session.getAttribute("userId") %>" target="main">项目管理</a></li>
				<li><a href="project!listProjects?user.id=<%=session.getAttribute("userId") %>" target="main">模块分解</a></li>
				<li><a href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>" target="main">估算场景</a></li>
				<li><a href="user!edit?user.id=<%=session.getAttribute("userId") %>" target="main">修改个人信息</a></li>
			</ul>
			<div id="login-info">
				当前用户：<%=session.getAttribute("userEmail") %>&nbsp;&nbsp;<a href="common/login.jsp">退出</a>
			</div>
		</div>

		<!--Content Wrap -->
		<div id="content-wrap">
			<div id="main">
				<iframe frameborder="0" scrolling="auto" name="main"
					src="project!list?user.id=<%=session.getAttribute("userId") %>"></iframe>
			</div>
			<div id="sidebar">
				<h1>一般用户</h1>
				<ul class="sidemenu">
					<li><a href="project!list?user.id=<%=session.getAttribute("userId") %>" target="main">项目管理</a></li>
					<li><a href="project!listProjects?user.id=<%=session.getAttribute("userId") %>" target="main">模块分解</a></li>
					<li><a href="project!listProjectsForSession?user.id=<%=session.getAttribute("userId") %>" target="main">估算场景</a></li>
					<li><a href="user!edit?user.id=<%=session.getAttribute("userId") %>" target="main">修改个人信息</a></li>
				</ul>
			</div>
			<!--End content-wrap-->
		</div>

		<!-- Footer -->
		<div id="footer">
			<p>&copy; 2015 北航软件所 &nbsp;&nbsp; 公司地址：北京市海淀区学院路37号 &nbsp;&nbsp;
				电话：010－82318974 &nbsp;&nbsp;</p>

		</div>
		<!-- END Wrap -->
	</div>
	<!-- Modal for create project-->
	<div id="projectModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
		<!-- Modal for create module-->
	<div id="moduleModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
	<!-- Modal for create session-->
	<div id="countSessionModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	var height = $(document).height(); //浏览器当前窗口可视区域高度
	 $("#wrap").css("min-height",height);
	
		//countSession中，选择目的填充input
		$(document).on('click', 'input[name="purpose"]', function() { 
			$("input[name='countSession.purpose']").val(jQuery(this).val());		
		});
	
});

$.extend({
	showProjectModal : function(Id,option) {
		if(option != "add"){
 			var url = "project!edit?project.id=" + Id;
			$.get(url, function(data) {
				var doms = $.parseHTML(data);
				$("#projectModal .modal-content").html(doms);
				//若是显示项目信息，则input变为disabled
				if(option=="detail"){
					$("#projectForm .form-control").attr("disabled",true);
				}
			}); 
		}else{
			var url = "devLang!list?organization.id=" + Id;
			$.get(url,function(data){  
				$("#projectModal .modal-content").html(data);
			});
		}
		$("#projectModal").modal('show');
	}
});
$.extend({
	showModuleModal : function(Id,option) {
	if(option == "add"){
		$.get("common/module.jsp", function(data) {
			var doms = $.parseHTML(data);
			$("#moduleModal .modal-content").html(doms);
		});
	}
	else{
		var url = "module!edit?module.id=" + Id;
		$.get(url, function(data) {
			var doms = $.parseHTML(data);
			$("#moduleModal .modal-content").html(doms);
			//若是显示模块信息，则input变为disabled
			if(option=="detail"){
				$("#moduleForm .form-control").attr("disabled",true);
			}
		});
	}
	$("#moduleModal").modal('show');
}
});
$.extend({
	showCountSessionModal : function(Id,option) {
	if(option == "add"){
		$.get("common/countSession.jsp", function(data) {
 			var doms = $.parseHTML(data);
 			/* 获取所有元素，包括script节点 */
/*            var doms = $.parseHTML(data, document, true); */

			$("#countSessionModal .modal-content").html(doms);
		});
	}
	else{
		var url = "countSession!edit?countSession.id=" + Id;
		$.get(url, function(data) {
			var doms = $.parseHTML(data);
			$("#countSessionModal .modal-content").html(doms);
			//若是显示模块信息，则input变为disabled
			if(option=="detail"){
				$("#countSessionForm .form-control").attr("disabled",true);
			}
		});
	}
	$("#countSessionModal").modal('show');
}
});
$.extend({
	postData : function() {
		main.window.$.postUserEditData($('#userForm').serialize());
	}
});
$.extend({
	postProjectData : function(actionName) {
		$("#projectModal").modal('hide');
		main.window.$.postProjectData($('#projectForm').serialize(),actionName);
	}
});
$.extend({
	postModuleData : function(actionName) {
		if(actionName ==""){
			$("#moduleModal").modal('hide');
			main.window.$.postModuleData($('#moduleForm').serialize(),"module!add");			
		}else{
			$("#moduleModal").modal('hide');
			main.window.$.postModuleData($('#moduleForm').serialize(),actionName);
		}
	}
});
$.extend({
	postCountSessionData : function(actionName) {
/* 		$("#countSessionForm").validate({
			rules: {
				"countSession.name":"required",
				"countSession.scope":"required"
			}
		});  */
		if(actionName ==""){
			$("#countSessionModal").modal('hide');
			main.window.$.postCountSessionData($('#countSessionForm').serialize(),"countSession!add");			
		}else{
			$("#countSessionModal").modal('hide');
			main.window.$.postCountSessionData($('#countSessionForm').serialize(),actionName);
		}
	}
});
</script>



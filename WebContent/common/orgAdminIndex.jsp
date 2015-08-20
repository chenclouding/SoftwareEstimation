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
				<li><a href="organization!edit" target="main"><span>修改组织</span></a></li>
				<li><a href="index.html" target="main"><span>项目管理</span></a></li>
				<li><a href="user!list" target="main"><span>用户管理</span></a></li>
				<li><a href="common/resetPassword.jsp" target="main">设置调整因子</a></li>
				<li><a href="common/resetPassword.jsp" target="main"><span>修改密码</span></a></li>
			</ul>
			<div id="login-info">
				当前用户：<%=session.getAttribute("userEmail") %>&nbsp;&nbsp;<a href="common/login.jsp">退出</a>
			</div>
		</div>

		<!--Content Wrap -->
		<div id="content-wrap">
			<div id="main">
				<iframe frameborder="0" scrolling="auto" name="main"
					src="organization!edit?organization.id=
					<%=session.getAttribute("orgId") %>"></iframe>
			</div>

			<div id="sidebar">
				<h1>组织管理员</h1>
				<ul class="sidemenu">
					<li><a href="organization!edit?organization.id=
					<%=session.getAttribute("orgId") %>" target="main">修改组织</a></li>
					<li><a href="#" target="main">项目管理</a></li>
					<li><a href="user!list?organization.id=<%=session.getAttribute("orgId") %>" target="main">用户管理</a></li>
					<li><a href="cocomo/param.jsp" target="main">设置调整因子</a></li>
					<li><a href="common/resetPassword.jsp" target="main">修改密码</a></li>
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
<!-- 	
	<div id="orgEditModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			</div>
		</div>
	</div> -->
</body>
<script>
	$(document).ready(function(){
		var height = $(document).height(); //浏览器当前窗口可视区域高度
		 $("#wrap").css("min-height",height);
		
	});
/* 	$('#orgEditModal').on('hide.bs.modal', function(e) {
		$(this).removeData();
	});

	$.extend({
		showModal : function(orgId,option) {
			var url = "organization!edit?organization.id=" + orgId;
			$.get(url, function(data) {
				var doms = $.parseHTML(data);
				$(".modal-content").html(doms);
				//若是显示组织信息，则input变为disabled
				if(option=="detail"){
					$("#orgForm .form-control").attr("disabled",true);
				}
				$("#orgEditModal").modal('show');
			});
		}
	});
	$.extend({
		postData : function() {
			$("#orgEditModal").modal('hide');
			main.window.$.postOrgData($('#orgForm').serialize());
		}
	}); */
</script>



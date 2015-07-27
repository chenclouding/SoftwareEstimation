<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>软件成本估算工具</title>
<!-- Custom Theme files -->
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/scripts/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/styles/bootstrap.min.css" />
<link href="<%=request.getContextPath()%>/styles/login.css"
	rel="stylesheet" type="text/css" media="all" />
<style>
.signup input[type="submit"] {
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="title">
		<h2>软件成本估算工具登录页面</h2>
	</div>
	<form method="post" action="user!login">
		<div class="signup">
			<span class="ribben"></span>
			<p>
				邮箱：<span class="dot"> </span>
			</p>
			<input type="text" name="user.name" placeholder="example@email.com" />
			<p>
				密码：<span class="dot"> </span>
			</p>
			<input type="password" name="user.password" placeholder="" /> 
			<input type="submit" value="登录" /> 
			<a href="#userRegisterModal" role="button" class="btn btn-primary" 
				data-toggle="modal">用户注册</a> 
				<a href="#orgRegisterModal" role="button" class="btn btn-primary" 
				data-toggle="modal">组织注册</a>
		</div>
	</form>
	<div class="copyright">
		<p>北航软件所 版权所有 @2015</p>
		<p>公司地址：北京市海淀区学院路37号</p>
		<p>电话：010－82318974</p>
	</div>

	<!-- Modal for User Register -->
	<div id="userRegisterModal" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">注册用户</h3>
		</div>
		<form class="theme-form" name="loginform" action="user!add"
			method="post">
			<div class="modal-body">
				<ol>
					<li><p>邮箱：</p>
						<input class="ipt" type="text" name="user.email"
						placeholder="example@email.com" /></li>
					<li><p>密码：</p>
						<input class="ipt" type="password" name="user.password" /></li>
					<li><p>再次输入密码：</p>
						<input class="ipt" type="password" name="repassword" /></li>
					<li><p>姓名：</p>
						<input class="ipt" type="text" name="user.name" /></li>
					<li><p>所属单位：</p>
						<select class="ipt" name="organization.id">
							<s:iterator id="org" value="organizations">
								<option><s:property value="#org.name" /></option>
							</s:iterator>
					</select>
				</ol>
			</div>
			<div class="modal-footer">
				<input class="btn btn-primary" type="submit" value="新建" /> <input
					class="btn btn-primary" type="reset" value="重置" />
			</div>
		</form>
	</div>

	<!-- Modal for Organization Register -->
	<div id="orgRegisterModal" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">注册组织</h3>
		</div>
		<form class="theme-form" name="organizationform"
			action="organization!add" method="post">
			<div class="modal-body">

				<ol>
					<li><label>组织名称：</label> <input class="ipt" type="text"
						name="organization.name" /></li>
					<li><label>组织类型：</label> <select class="ipt" type="text"
						name="organization.type">
							<option value="==请选择组织类型==">==请选择组织类型==</option>
							<option value="A.农、林、牧、渔业">A.农、林、牧、渔业</option>
							<option value="B.采矿业">B.采矿业</option>
							<option value="C.制造业">C.制造业</option>
							<option value="D.电力、热力、燃气及水生产和供应业">D.电力、热力、燃气及其它供应业</option>
							<option value="E.建筑业">E.建筑业</option>
							<option value="F.批发和零售业">F.批发和零售业</option>
							<option value="G.交通运输、仓储和邮政业">G.交通运输、仓储和邮政业</option>
							<option value="H.住宿和餐饮业">H.住宿和餐饮业</option>
							<option value="I.信息传输、软件和信息技术服务业">I.软件和信息技术、传输服务业</option>
							<option value="J.金融业">J.金融业</option>
							<option value="K.房地产业">K.房地产业</option>
							<option value="L.租赁和商务服务业">L.租赁和商务服务业</option>
							<option value="M.科学研究和技术服务业">M.科学研究和技术服务业</option>
							<option value="N.水利、环境和公共设施管理业">N.水利、环境和公共设施管理业</option>
							<option value="O.居民服务、修理和其他服务业">O.居民服务、修理和其他服务业</option>
							<option value="P.教育">P.教育</option>
							<option value="Q.卫生和社会工作">Q.卫生和社会工作</option>
							<option value="R.文化、体育和娱乐业">R.文化、体育和娱乐业</option>
							<option value="S.公共管理、社会保障和社会组织">S.公共管理、社会保障和组织</option>
							<option value="T.国际组织">T.国际组织</option>
					</select></li>
					<li><label>组织简介：</label> <input class="ipt" type="text"
						name="organization.description" /></li>
					<li><label>组织地址：</label> <input class="ipt" type="text"
						name="organization.address" /></li>
					<li><label>传真：</label> <input class="ipt" type="text"
						name="organization.postcode" /></li>
					<li><label>联系人：</label> <input class="ipt" type="text"
						name="organization.contact" /></li>
					<li><label>电话：</label> <input class="ipt" type="text"
						name="organization.phone" /></li>
					<li><label>邮箱：</label> <input class="ipt" type="text"
						name="organization.email" /></li>
				</ol>
			</div>
			<div class="modal-footer">
				<input class="btn btn-primary" type="submit" value="新建" /> 
				<input	class="btn btn-primary" type="reset" value="重置" />
			</div>
		</form>
	</div>
</body>
</html>
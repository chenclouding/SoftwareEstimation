<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">用户信息</h4>
</div>

<form class="form-horizontal" name="loginform" action="<s:property value="actionName"/>"
	method="post">
	<div class="modal-body">
		<div class="form-group">
			<label for="userEmail" class="col-sm-3 control-label">邮箱</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="userEmail" placeholder="example@email.com"
					name="user.email"
					value="<s:property value="user.email"/>" />
			</div>
		</div>
		<div class="form-group">
			<label for="userPwd" class="col-sm-3 control-label">密码</label>
			<div class="col-sm-7">
				<input type="password" class="form-control" id="userPwd" 
					name="user.password"
					value="<s:property value="user.password"/>" />
			</div>
		</div>
		<div class="form-group">
			<label for="userRePwd" class="col-sm-3 control-label">重复密码</label>
			<div class="col-sm-7">
				<input type="password" class="form-control" id="userRePwd" 
					name="repassword" />
			</div>
		</div>
		<div class="form-group">
			<label for="userName" class="col-sm-3 control-label">姓名</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="userName" 
					name="user.name"
					value="<s:property value="user.name"/>" />
			</div>
		</div>
		<div class="form-group">
			<label for="userOrg" class="col-sm-3 control-label">所属单位</label>
			<div class="col-sm-7">
			      <s:select class="form-control" id="userOrg" list="organizations" listValue="name" listKey="id" name="organization.id"></s:select>  
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<input class="btn btn-primary" type="submit" value="新建" /> <input
			class="btn btn-primary" type="reset" value="重置" />
	</div>
</form>
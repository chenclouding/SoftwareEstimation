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
<label class="message" style="display:none;">修改成功！</label>
<form class="form-horizontal" id="userForm"
	action="<s:property value="actionName"/>" method="post">
<div class="modal-body">
	<div class="form-group">
		<label for="userEmail" class="col-sm-3 control-label">邮箱</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="userEmail"
				placeholder="example@email.com" name="user.email"
				value="<s:property value="user.email"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="userPwd" class="col-sm-3 control-label">密码</label>
		<div class="col-sm-7">
			<input type="password" class="form-control" id="userPwd"
				name="user.password" value="<s:property value="user.password"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="userRePwd" class="col-sm-3 control-label">重复密码</label>
		<div class="col-sm-7">
			<input type="password" class="form-control" id="userRePwd"
				name="rePassword" />
		</div>
	</div>
	<div class="form-group">
		<label for="userName" class="col-sm-3 control-label">姓名</label>
		<div class="col-sm-7">
			<input type="text" class="form-control" id="userName"
				name="user.name" value="<s:property value="user.name"/>" />
		</div>
	</div>
	<div class="form-group">
		<label for="userOrg" class="col-sm-3 control-label">所属单位</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="userOrg" list="organizations"
				listValue="name" listKey="id" name="organization.id"
				value="%{user.organization.name}"></s:select>
		</div>
		
	</div>
	<input type="hidden" name="user.id"	value="<s:property value="user.id"/>" />
	<div class="modal-footer">
				<s:if test="actionName!='user!edited'">
				<input class="btn btn-primary" type="submit" value="确定" />
			</s:if>
			<s:else>
				<input class="btn btn-primary" onclick="$.postUserEditData()" value="确定" />
			</s:else>
			<input class="btn btn-primary" type="reset" value="重置" />
	</div>
</div>
</form>
<script>
$(document).ready(function(){ 
	$("#userForm").validate({
		rules: {
			"user.email": {
				required: true,
				email: true,
			},
			"user.password": {
				required: true,
				minlength: 6,
			},
			rePassword: {
				required: true,
				minlength: 6,
				equalTo: "#userPwd"
			},
			"organization.id":"required"
		}

	}); 
	//若在一般用户界面下，用户信息的style要进行修改
	if(!$(".modal-header").parent().hasClass("modal-content")){
		$(".col-sm-3").css({'float':'left','width':'15%','font-size':'12px'});
		$(".col-sm-7").css({'float':'left','width':'50%'});
		$(".form-control").css({'font-size':'12px','height':'30px'});
		$(".modal-title").css({'color':'#69BECD','font-weight':'Bold','font-size':'130%','font-family':'Verdana'});
		$("button.close").css({'color':'#FFF'});
		$(".form-group").css({'margin-bottom':'10px'});
		$(".modal-footer .btn-primary").css({'float':'left','padding':'6px 0px'});
		$(".modal-header").css({'padding-bottom':'1px'});
	}
}); 
$.extend({
	postUserEditData : function() {
		$.post("user!edited", $('#userForm').serialize(), function(){
			$("label.message").css('display','block');
		});
	}
}); 
</script>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="#session.userRole==0">	
<%@ include file="layout/sysAdmin_head.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/orgAdmin_head.jsp"%>
</s:else>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content-wrap">
   	<h3>重置密码</h3>	
   	<s:actionerror />
   	<s:actionmessage />   	
   	<form class="resetPwdForm" action="user!reset" method="post">
		<div class="form-group form-group-sm">
			<label for="userPwd" class="col-sm-3 control-label">当前密码</label>
			<div class="col-sm-7">
				<input type="password" class="form-control" id="userPwd" name="user.password" />
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label for="userNewPwd" class="col-sm-3 control-label">新密码</label>
			<div class="col-sm-7">
				<input type="password" class="form-control" id="userNewPwd" name="newPassword" />
			</div>
		</div>
		<div class="form-group form-group-sm">
			<label for="userRePwd" class="col-sm-3 control-label">确认密码</label>
			<div class="col-sm-7">
				<input type="password" class="form-control" id="userRePwd" name="rePassword" />
			</div>
		</div>
		<input type="hidden" name=user.id value="<%=session.getAttribute("userId") %>" />
		<div class="btn-submit">
			<input class="btn btn-primary" type="submit" value="保 存 "/>
			<input class="btn btn-primary" type="reset" value="重置" />
		</div>
   </form>
</div>
</div>
<s:if test="#session.userRole==0">	
<%@ include file="layout/sysAdmin_footer.jsp"%>
</s:if>
<s:else>
<%@ include file="layout/orgAdmin_footer.jsp"%>
</s:else>

<script>
$(document).ready(function(){ 
	$(".resetPwdForm").validate({
		rules: {
			"user.password": "required",
			newPassword: {
				required: true,
				minlength: 6,
			},
			rePassword: {
				required: true,
				minlength: 6,
				equalTo: "#userNewPwd"
			}
		}
	}); 
	}); 
</script>
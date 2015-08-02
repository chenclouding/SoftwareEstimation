<%@ include file="layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">组织信息</h4>
</div>
<label class="message" style="display:none;">修改成功！</label>
<s:if test="actionName==null"> 
<form class="form-horizontal" name="organizationform" id="orgForm"
	action="organization!add" method="post">
</s:if> 
<s:else> 
<form class="form-horizontal" name="organizationform" id="orgForm"
	action="<s:property value="actionName"/>" method="post">
</s:else> 
	<div class="modal-body">
		<div class="form-group">
			<label for="orgName" class="col-sm-3 control-label">组织名称</label>
			<div class="col-sm-7">
				<input type="text" class="form-control" id="orgName"
					name="organization.name"
					value="<s:property value="organization.name"/>" />
			</div>
		</div>
		<div class="form-group">
			<label for="orgType" class="col-sm-3 control-label">组织类型</label>
			<div class="col-sm-7">
				<s:select class="form-control" id="orgType"
					list="{
  				'A.农、林、牧、渔业',
  				'B.采矿业',
  				'C.制造业',
  				'D.电力、热力、燃气等供应业',
  				'E.建筑业',
  				'F.批发和零售业',
  				'G.交通运输、仓储和邮政业',
  				'H.住宿和餐饮业',
  				'I.信息传输、软件和IT服务业',
  				'J.金融业',
  				'K.房地产业',
  				'L.租赁和商务服务业',
  				'M.科学研究和技术服务业',
  				'N.水利、环境和公共设施管理业',
  				'O.居民服务、修理和其他服务业',
  				'P.教育',
  				'Q.卫生和社会工作',
  				'R.文化、体育和娱乐业',
  				'S.公共管理、社会保障和组织',
  				'T.国际组织'}"
					value="organization.type" name="organization.type" />
			</div>
			</div>
			<div class="form-group">
				<label for="orgDesc" class="col-sm-3 control-label">组织简介</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="orgDesc"
						name="organization.description"
						value="<s:property value="organization.description"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="orgAddr" class="col-sm-3 control-label">组织地址</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="orgAddr"
						name="organization.address"
						value="<s:property value="organization.address"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="orgPostCode" class="col-sm-3 control-label">邮编</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="orgPostCode"
						name="organization.postcode"
						value="<s:property value="organization.postcode"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="orgFax" class="col-sm-3 control-label">传真</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="orgFax"
						name="organization.fax"
						value="<s:property value="organization.fax"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="orgContact" class="col-sm-3 control-label">联系人</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="orgContact"
						name="organization.contact"
						value="<s:property value="organization.contact"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="orgPhone" class="col-sm-3 control-label">电话</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="orgPhone"
						name="organization.phone"
						value="<s:property value="organization.phone"/>" />
				</div>
			</div>
			<div class="form-group">
				<label for="orgEmail" class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-7">
					<input type="email" class="form-control" id="orgEmail"
						name="organization.email"
						value="<s:property value="organization.email"/>" />
				</div>
			</div>
			<s:if test="actionName!=null"> 
		  		<input type="hidden" name="organization.id" value="<s:property value="organization.id"/>"/>
			</s:if>
		</div>
		<div class="modal-footer">
			<s:if test="actionName==null">
				<input class="btn btn-primary" type="submit" value="确定" />
			</s:if>
			<s:else>
				<input class="btn btn-primary" onclick="$.postData()" value="确定" />
			</s:else>
			<input class="btn btn-primary" type="reset" value="重置" />
		</div>
</form>
<script>
$(document).ready(function(){ 
	$("#orgForm").validate({
		rules: {
			"organization.name": {
				required: true,
				minlength:2,
			},
			"organization.type":"required",
			"organization.address":"required",
			"organization.postcode":{
				isZipCode: true,
			},
			"organization.fax":{
				isFax: true,
			},
			"organization.contact":"required",
			"organization.phone": {
				isPhone: true,
			},
			"organization.email": {
				required:true,
				email: true,
			},
		}
	}); 
	
	//若在组织级管理员界面下，组织信息的style要进行修改
	if(!$(".modal-header").parent().hasClass("modal-content")){
		$(".col-sm-3").css({'float':'left','width':'15%','font-size':'12px'});
		$(".col-sm-7").css({'float':'left','width':'50%'});
		$(".form-control").css({'font-size':'12px','height':'30px'});
		$(".modal-title").css({'color':'#69BECD','font-weight':'Bold','font-size':'130%','font-family':'Verdana'});
		$("button.close").css({'color':'#FFF'});
		$(".form-group").css({'margin-bottom':'10px'});
		$(".modal-footer .btn-primary").css({'float':'left','padding':'6px 0px'});
		$(".modal-header").css({'padding-bottom':'1px'});
		$("input[onclick]").attr("onclick","$.postOrgEditData()");
	}
	
}); 
$.extend({
	postOrgEditData : function() {
		$.post("organization!edited", $('#orgForm').serialize(), function(){
			$("label.message").css('display','block');
		});
	}
});
</script>
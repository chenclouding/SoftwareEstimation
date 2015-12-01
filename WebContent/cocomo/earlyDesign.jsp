<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/common/layout/commonInclude.jsp"%>
<link rel="stylesheet"	href="styles/param.css" /> 
<div id="wrap">
<%@ include file="layout/cocomo_head.jsp"%>
<%@ include file="layout/cocomo_sidebar.jsp"%>
<style>
#linesPerFP,#monthlyAvg,#functionPoint,#KSLOC{
	display:inline;
	width:60%;
}
.table>tbody>tr>td{
border-top:0px;
}
p{
padding:0px 12px 10px 12px;
}
</style>
<div id="content-wrap">
	<h3>早期设计子模型估算页面</h3>
	<form class="form-horizontal" id="appForm" action="cocomo!editedEarlyDesign"
		method="post">
	<div class="form-group">
		<label for="functionPoint" class="col-sm-3 control-label">功能点数(FP)</label>
		<div class="col-sm-7">
			<s:if test="countSession.methodType!='COSMIC'">
				<input class="form-control" id="functionPoint"	name="countSession.ufpc" 
				value="<s:property value="countSession.ufpc" />" readonly />个
			</s:if>
			<!--COSMIC要先转换成FP -->
			<s:else>
				<input class="form-control" id="functionPoint"	name="CFP_to_FP" 
				value="<s:property value="CFP_to_FP" />" readonly />个
			</s:else>
		</div>
	</div>
	<div class="form-group">
		<label for="functionPoint" class="col-sm-3 control-label">千行源代码数</label>
		<div class="col-sm-7">
			<input class="form-control" id="KSLOC"	name="earlyDesAndPostArch.KSLOC" 
			value="<s:property value="earlyDesAndPostArch.KSLOC" />" />千行
		</div>
	</div>
<div id="scaleFactor">
<label class="title control-label">规模因子</label>
	<div class="form-group">
		<label for="sf_PREC" class="col-sm-3 control-label">先例性</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="sf_PREC"
				list="{
				'非常低',
  				'低',
  				'一般',
  				'高',
  				'非常高',
  				'极其高'}"
  				value="param.sf_PREC" name="param.sf_PREC" />
		</div>
	</div>
	<div class="form-group">
		<label for="sf_FLEX" class="col-sm-3 control-label">开发灵活性</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="sf_FLEX"
				list="{
  				'非常低',
  				'低',
  				'一般',
  				'高',
  				'非常高',
  				'极其高'}"
				value="param.sf_FLEX" name="param.sf_FLEX" />
		</div>
		</div>
	<div class="form-group">
		<label for="sf_RESL" class="col-sm-3 control-label">早期设计/风险化解</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="sf_RESL"
				list="{
  				'非常低',
  				'低',
  				'一般',
  				'高',
  				'非常高',
  				'极其高'}"
				value="param.sf_RESL" name="param.sf_RESL" />
		</div>
	</div>
	<div class="form-group">
		<label for="sf_TEAM" class="col-sm-3 control-label">团队凝聚力</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="sf_TEAM"
				list="{
  				'非常低',
  				'低',
  				'一般',
  				'高',
  				'非常高',
  				'极其高'}"
				value="param.sf_TEAM" name="param.sf_TEAM" />
		</div>
	</div>
	<div class="form-group">
		<label for="sf_PMAT" class="col-sm-3 control-label">过程成熟度</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="sf_PMAT"
				list="{
  				'非常低',
  				'低',
  				'一般',
  				'高',
  				'非常高',
  				'极其高'}"
				value="param.sf_PMAT" name="param.sf_PMAT" />
		</div>
	</div>
</div>

<div id="costDriver">
<label class="title control-label" >成本驱动因子</label>
	<div class="form-group">
		<label for="ed_RCPX" class="col-sm-3 control-label">产品可靠性和复杂性</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="ed_RCPX"
				list="{
				'极其低',
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.ed_RCPX" name="param.ed_RCPX" />
		</div>
	</div>
	<div class="form-group">
		<label for="ed_RUSE" class="col-sm-3 control-label">可重用性需求</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="ed_RUSE"
				list="{
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.ed_RUSE" name="param.ed_RUSE" />
		</div>
	</div>
	<div class="form-group">
		<label for="ed_PDIF" class="col-sm-3 control-label">平台难度</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="ed_PDIF"
				list="{
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.ed_PDIF" name="param.ed_PDIF" />
		</div>
	</div>
	<div class="form-group">
		<label for="ed_PREX" class="col-sm-3 control-label">个人经验</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="ed_PREX"
				list="{
				'极其低',
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.ed_PREX" name="param.ed_PREX" />
		</div>	
	</div>
	<div class="form-group">
		<label for="ed_FCIL" class="col-sm-3 control-label">设施</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="ed_FCIL"
				list="{
				'极其低',
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.ed_FCIL" name="param.ed_FCIL" />
		</div>
	</div>
	<div class="form-group">
		<label for="ed_SCED" class="col-sm-3 control-label">要求的开发进度</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="ed_SCED"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.ed_SCED" name="param.ed_SCED" />
		</div>
	</div>
	<div class="form-group">
		<label for="ed_FCIL" class="col-sm-3 control-label">人员能力</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="ed_PERS"
				list="{
				'极其低',
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.ed_PERS" name="param.ed_PERS" />
		</div>
	</div>
</div>
<div id="otherParams">
<label class="title control-label" >其他参数</label>
	<div class="form-group"  style="width:100%;">
		<label for="monthlyAvg" class="col-sm-3 control-label" style="width:21%;">人员薪资水平</label>
		<div class="col-sm-7">
			<input class="form-control" id="monthlyAvg"	name="param.monthlyAvg" 
			value="<s:property value="param.monthlyAvg"/>" style="width:50%;" />
		万元/月
		</div>
	</div>
	<div class="form-group">
		<label for="devLangs" class="col-sm-3 control-label">开发语言</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="devLangs" list="devLangs" listKey="name"
				listValue="name" name="earlyDesAndPostArch.language"
				value="earlyDesAndPostArch.language"
				onchange="change()"></s:select>
		</div>
	</div>
	<div class="form-group">
		<label for="linesPerFP" class="col-sm-3 control-label">代码行/功能点</label>
		<div class="col-sm-7">
			<input class="form-control" id="linesPerFP"	name="earlyDesAndPostArch.linesPerFP" 
			value="<s:property value="earlyDesAndPostArch.linesPerFP" />" />
		LOC/FP
		</div>
	</div>
</div>
<input type="hidden" id="devLangsString" value="<s:property value="devLangsString" />" />
<input type="hidden" name="countSession.id" value="<s:property value="countSession.id" />" />
<input type="hidden" name="param.id" value="<s:property value="param.id" />" />
<input type="hidden" name="earlyDesAndPostArch.id" value="<s:property value="earlyDesAndPostArch.id" />" />
<div class="footer">
	<input class="btn btn-primary"  type="submit" value="确定" />
	<input class="btn btn-primary" type="reset" value="重置" />
</div>
	</form>
	<hr />
	<div id="estimationResult">
		<p>
			工作量：
			<s:property value="earlyDesAndPostArch.effort" />
			人月
		</p>
				<p>
			工期：
			<s:property value="earlyDesAndPostArch.duration" />
			月
		</p>
		<p style="margin-bottom:20px;">
			成本：
			<s:property value="earlyDesAndPostArch.cost" />
			万元
		</p>
	</div>
</div>
</div>
 <%@ include file="/common/layout/footer.jsp"%>
<script>
	$(document).ready(function() {
		$(".form-horizontal").validate({
			rules: {
				"earlyDesAndPostArch.KSLOC":"required"
			}
		}); 
 		//根据编程语言的不同，修改对应的LinesPerFP
		var selectedItem = $("#devLangs  option:selected").text();
	   	var devLangs=JSON.parse($("#devLangsString").val()); 
	   	$.each(devLangs, function(idx, devLang) {
 		if(devLang.name==selectedItem){
 			$("#linesPerFP").val(devLang.linesPerFP); 
 			}
 		});  
	   	
	   	//根据选择的编程语言和未调整功能点数，填充千行源代码输入框
	   	//若不使用功能点，直接输入代码行，不执行该步
	   	if($("#functionPoint").val()!=""){
		   	var KSLOC=$("#functionPoint").val()*$("#linesPerFP").val();
		   	$("#KSLOC").val(KSLOC/1000);
		   	$("#KSLOC").attr("readonly","readonly");
	   	}
	});
		//根据编程语言的不同，修改对应的LinesPerFP
function change(){
	var selectedItem = $("#devLangs  option:selected").text();
   	var devLangs=JSON.parse($("#devLangsString").val()); 
   	$.each(devLangs, function(idx, devLang) {
		if(devLang.name==selectedItem){
			$("#linesPerFP").val(devLang.linesPerFP); 
			}
		}); 
   	//根据选择的编程语言和未调整功能点数，填充千行源代码输入框
   	//若不使用功能点，直接输入代码行，不执行该步
   	if($("#functionPoint").val()!=""){
	   	var KSLOC=$("#functionPoint").val()*$("#linesPerFP").val();
	   	$("#KSLOC").val(KSLOC/1000);
   	}
}
</script>
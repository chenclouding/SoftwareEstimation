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
p{
padding:0px 12px 10px 12px;
}
</style>
<div id="content-wrap">
	<h3>后体系架构子模型估算页面</h3>
	<form class="form-horizontal" id="appForm" action="cocomo!editedPostArchitecture"
		method="post">
	<div class="form-group">
		<label for="functionPoint" class="col-sm-3 control-label">功能点数(FP)</label>
		<div class="col-sm-7">
				<s:if test="countSession.methodType!='COSMIC'">
			<input class="form-control" id="functionPoint"	name="countSession.ufpc" 
			value="<s:property value="countSession.ufpc" />" readonly />个
						</s:if>
			<!-- COSMIC要先转换成FP -->
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
		<label for="cd_RELY" class="col-sm-3 control-label">软件可靠性需求</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_RELY"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_RELY" name="param.cd_RELY" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_DATA" class="col-sm-3 control-label">应用数据库的大小</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_DATA"
				list="{
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_DATA" name="param.cd_DATA" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_CPLX" class="col-sm-3 control-label">产品复杂度</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_CPLX"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.cd_CPLX" name="param.cd_CPLX" />
		</div>	
	</div>
	<div class="form-group">
		<label for="cd_RUSE" class="col-sm-3 control-label">可重用性需求</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_RUSE"
				list="{
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.cd_RUSE" name="param.cd_RUSE" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_DOCU" class="col-sm-3 control-label">文档与生命周期匹配度</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_DOCU"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_DOCU" name="param.cd_DOCU" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_TIME" class="col-sm-3 control-label">运行时间约束</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_TIME"
				list="{
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.cd_TIME" name="param.cd_TIME" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_STOR" class="col-sm-3 control-label">内存约束</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_STOR"
				list="{
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.cd_STOR" name="param.cd_STOR" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_PVOL" class="col-sm-3 control-label">平台稳定性</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_PVOL"
				list="{
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_PVOL" name="param.cd_PVOL" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_ACAP" class="col-sm-3 control-label">分析能力</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_ACAP"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_ACAP" name="param.cd_ACAP" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_PCAP" class="col-sm-3 control-label">编程人员能力</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_PCAP"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_PCAP" name="param.cd_PCAP" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_AEXP" class="col-sm-3 control-label">应用经验</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_AEXP"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_AEXP" name="param.cd_AEXP" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_PLEX" class="col-sm-3 control-label">平台经验</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_PLEX"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_PLEX" name="param.cd_PLEX" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_LTEX" class="col-sm-3 control-label">编程语言和工具经验</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_LTEX"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_LTEX" name="param.cd_LTEX" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_PCON" class="col-sm-3 control-label">人员连续性</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_PCON"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_PCON" name="param.cd_PCON" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_TOOL" class="col-sm-3 control-label">采用的软件工具</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_TOOL"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_TOOL" name="param.cd_TOOL" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_SITE" class="col-sm-3 control-label">多站点开发</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_SITE"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高',
	 				'极其高'}"
				value="param.cd_SITE" name="param.cd_SITE" />
		</div>
	</div>
	<div class="form-group">
		<label for="cd_SCED" class="col-sm-3 control-label">对开发时间的要求</label>
		<div class="col-sm-7">
			<s:select class="form-control" id="cd_SCED"
				list="{
	 				'非常低',
	 				'低',
	 				'一般',
	 				'高',
	 				'非常高'}"
				value="param.cd_SCED" name="param.cd_SCED" />
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
		<s:if test="earlyDesign==null" >
			<s:select class="form-control" id="devLangs" list="devLangs" listKey="name"
				listValue="name" name="earlyDesAndPostArch.language"
				value="earlyDesAndPostArch.language"
				onchange="change()"></s:select>
		</s:if>
		<s:else>
			<s:select class="form-control" id="devLangs" list="devLangs" listKey="name"
				listValue="name" name="earlyDesAndPostArch.language"
				value="earlyDesign.language"
				onchange="change()"></s:select>
		</s:else>
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
 <%@ include file="/common/layout/commonInclude.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet"	href="styles/param.css" /> 
 <div id="wrap">
<%@ include file="/common/layout/orgAdmin_head.jsp"%>
<%@ include file="/common/layout/orgAdmin_sidebar.jsp"%>
<div id="content-wrap">
<form class="form-horizontal paramForm" id="paramForm" 
action="param!edited?organization.id=<%=session.getAttribute("orgId") %>" method="post">
<s:actionmessage />  
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
<div id="monthlyAvg">
<label class="title control-label" >其他参数</label>
	<div class="form-group">
		<label for="monthlyAvg" class="col-sm-3 control-label">人员薪资水平</label>
		<div class="col-sm-7">
			<input class="form-control" id="monthlyAvg"	name="param.monthlyAvg" value="<s:property value="param.monthlyAvg"/>" />
			万元/月
		</div>
	</div>
</div>
<div class="footer">
	<input class="btn btn-primary"  type="submit" value="确定" />
	<input class="btn btn-primary" type="reset" value="重置" />
</div>
</form>
</div>
</div>
 <%@ include file="/common/layout/footer.jsp"%>
<script>
$(document).ready(function(){ 
	$("#paramForm").validate({
		rules: {
			"param.monthlyAvg": {
				required: true,
				number:true
			}
		}
	}); 
}); 
</script>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<div id="wrap">
<%@ include file="layout/traditional_head.jsp"%>
<%@ include file="layout/traditional_sidebar.jsp"%>
<link rel="stylesheet" href="styles/welcome.css" />
<div id="content-wrap">
	<div id="methodHelp">
		<h3>传统估算方法介绍</h3>
			<ol>
			<li>
			<p>PERT法</p>
			<p>PERT法起源于计划评审技术。该方法考虑了估算活动的风险与不确定性，能提供较为准确的估算。
			PERT法可用于估算任何量，不仅局限于工作量，还包括规模、成本、工期等，甚至可应用于非软件行业。
			PERT使用三种估算值来界定待估算值的近似区间，进行综合整理可计算出待估算值的点预测或区间预测。
			<ol>
				<li>最可能值（ Vm）：基于活动的一般情况，所得到的估计值。 </li>
				<li>最乐观值（ Vo）：基于活动的最好情况，所得到的估计值。 </li>
				<li>最悲观值（ Vp）：基于活动的最差情况，所得到的估计值。 </li>
			</ol>
			对以上三个估算值进行加权平均，可以计算出预期活动的估算值和方差，计算公式为：
			<img style="width:30%" src="img/help/traditionalMethod/pert_formula.png"
				 alt="PERT计算公式" class="img_inserted" />
			</p>
			</li>
			<li>
			<p>Delphi法</p>
			<p>Delphi法大致过程为：协调人将问题描述分发给专家小组的每位成员，在预测期间专家之间不能沟通结果。
			协调人负责征询专家意见并进行归纳，随后将归纳结果再次发送到专家手中，再次征询意见。
			如此反复，直到取得比较一致的预测结果。Delphi法广泛地收集意见，取各家之长，估算结果较为可靠。
			</p>
			</li>
			<li>
			<p>类比法</p>
			<p>在进行工作量估算时，如果手头拥有的历史数据是来自规模差距不大的项目，可以使用类比法得到工作量估算值。
			这种根据过去相似项目的工作量来计算新项目的工作量估算值的方法是一种很稳妥的做法。
			该方法需要获取以前相似项目的详细数据如规模、工作量等，通过模块分解、类比寻找差异和共同点，从而得出新软件项目的待估算值。
			</p>
			</li>
			</ol>
	</div>
	<div id="toolHelp">
	<h3>模块使用说明</h3>
		<p>工具对Delphi法和类比法没有提供计算支持，仅有估算流程指导页面，对PERT法提供了计算支持。
		PERT法需要输入多组估计值，每组估计值都包含最可能值、乐观值、悲观值和权重。系统结合每组数据的权重可得出估计值的点预测和区间预测。</p>
		<img src="img/help/traditionalMethod/pert_result.png"
			 alt="PERT计算公式" class="img_inserted" />
		 <br /></br />
	</div>
</div>
</div>
<%@ include file="/common/layout/footer.jsp"%>
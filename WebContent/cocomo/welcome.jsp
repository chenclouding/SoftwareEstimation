<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/welcome.css" />
<div id="wrap">
	<%@ include file="layout/cocomo_head.jsp"%>
	<%@ include file="layout/cocomo_sidebar.jsp"%>
	<div id="content-wrap">
		<div id="methodHelp">
			<h3>COCOMO II模型介绍</h3>
			<p>关于COCOMO II模型的方法介绍，请参见如下教程：</p>
			<p>
				<a target="_blank" href="docs/COCOMOII.pdf">COCOMO II模型介绍.pdf</a>
			</p>
		</div>
		<div id="toolHelp">
			<h3>COCOMO II模块使用说明</h3>
			<p>本模块支持COCOMO II模型中三种子方法的估算，分别是：
			<ul>
				<li><strong>应用组件子模型。</strong> 该子模型用于估算原型开发的工作量、成本。使用时需输入以下参数：
					<ol>
						<li>新对象点数。这是应用组件子模型的规模输入，由用户手动输入。</li>
						<li>生产率。生产率代表每人月可以开发的对象点个数，有四个等级可选。</li>
						<li>人员薪资水平。该值代表每人月需发放的薪资，默认从组织级参数中获取，估算时可修改。</li>
					</ol> 以上参数输入完成后，点击“估算”按钮，系统将估算出项目工作量和成本。 <img
					src="img/help/cocomo/applicationComposition.png"
					alt="COCOMO II模型应用组件子模型示例" class="img_inserted">
				</li>
				<br /><br />
				<li><strong>早期设计子模型。</strong>
					该模型用于估算除需求阶段以外的工作量、工期和成本。其中规模输入有两种来源：
					<ul>
						<li>一是以功能点作为输入。要求在进入COCOMO II模型估算之前，先用功能点估算方法估算出规模。
							这种情况下系统会自动将功能点转换为千行源代码数（KSLOC）。若使用的是COSMIC功能点方法， 还需要将CFP先转换为FP。</li>
						<li>二是以代码行作为输入。仅在功能点个数为0时，代码行输入窗口为可编辑状态。注意输入的是千行源代码数。</li>
					</ul> 使用时需输入以下参数：
					<ol>
						<li>规模因子。包括5个规模因子，初始值从组织级参数中获取，估算时可修改。</li>
						<li>成本驱动因子。该子模型包括7种成本驱动因子，代表了项目不同方面的属性。具体含义和等级取值参见：<a
							href="/docs/COCOMO II模型介绍.pdf">COCOMO II模型介绍.pdf</a></li>
						<li>其他参数。包括人员薪资水平、项目使用的开发语言和每功能点代表的代码行数，初始值从组织级参数中获取，估算时均可修改。</li>
					</ol> 以上参数输入完成后，点击“估算”按钮，系统将估算出项目工作量和成本。 <img
					src="img/help/cocomo/earlyDesign.png" alt="COCOMO II模型早期设计子模型示例"
					class="img_inserted">
				</li>
				<br /><br />
				<li><strong>后体系架构子模型。</strong>
					该模型用于估算除需求阶段以外的工作量、工期和成本。其中规模输入和早期设计子模型一样，有两种方式。
					使用时需输入以下参数：
					<ol>
						<li>规模因子。包括5个规模因子，初始值从组织级参数中获取，估算时可修改。</li>
						<li>成本驱动因子。该子模型包括17种成本驱动因子，代表了项目不同方面的属性。具体含义和等级取值参见：<a
							href="/docs/COCOMO II模型介绍.pdf">COCOMO II模型介绍.pdf</a></li>
						<li>其他参数。包括人员薪资水平、项目使用的开发语言和每功能点代表的代码行数，初始值从组织级参数中获取，估算时均可修改。</li>
					</ol> 以上参数输入完成后，点击“估算”按钮，系统将估算出项目工作量和成本。 <img
					src="img/help/cocomo/postArchitecture.png" alt="COCOMO II模型后体系架构子模型示例"
					class="img_inserted">
				</li>
				<br /><br />
			</ul>
		</div>
	</div>
</div>
<%@ include file="/common/layout/footer.jsp"%>
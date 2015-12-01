<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#content-wrap h3{
font-size:120%;
}
#methodHelp a{
text-decoration:underline;
}
</style>
<div id="wrap">
	<%@ include file="layout/cocomo_head.jsp"%>
	<%@ include file="layout/cocomo_sidebar.jsp"%>
	<div id="content-wrap">
		<div id="methodHelp">
			<h3>COCOMO II模型介绍</h3>
			<p>关于COCOMO II模型的方法介绍，请参见如下教程：</p>
			<p><a href="/docs/COCOMO II模型介绍.pdf">COCOMO II模型介绍.pdf</a></p>
		</div>
			<div id="toolHelp">
		<h3>COCOMO II模块使用说明</h3>
		<p>本模块支持COCOMO II模型中三种子方法的估算，分别是：
		<ul>
		<li><strong>应用组件子模型。</strong>
		          该子模型用于估算原型开发的工作量、成本。使用时需输入以下参数：
			<ol>
				<li>新对象点数。这是应用组件子模型的规模输入，由用户手动输入。</li>
				<li>生产率。生产率代表每人月可以开发的对象点个数，有四个等级可选。</li>
				<li>人员薪资水平。该值代表每人月需发放的薪资，默认从组织级参数中获取，估算时可修改。</li>
			</ol>
			以上参数输入完成后，点击“估算”按钮，系统将估算出项目工作量和成本。
			<img src="..." alt="COCOMO II模型应用组件子模型示例" class="img-thumbnail">
		</li>
		<li><strong>早期设计子模型。</strong>该模型以</li>
		</ul>
		</p>
	</div>
	</div>
</div>
<%@ include file="/common/layout/footer.jsp"%>
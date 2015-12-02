<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/common/layout/commonInclude.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/welcome.css" />
<div id="wrap">
	<%@ include file="layout/cosmic_head.jsp"%>
	<%@ include file="layout/cosmic_sidebar.jsp"%>
	<div id="content-wrap">
		<div class="methodHelp">
			<h3>COSMIC功能点估算方法介绍</h3>
			<p>关于COSMIC功能点估算方法介绍，请参见如下教程：</p>
			<p>
				<a target="_blank" href="docs/COSMIC.pdf">COSMIC估算方法介绍.pdf</a>
			</p>
		</div>
		<div class="toolHelp">
			<h3>COSMIC模块使用说明</h3>
			<p>COSMIC方法包括三个步骤:识别功能流程、识别兴趣对象和数据组、识别数据移动。</p>
			<ol>
				<li>首先按模块输入需求文档中识别出的功能流程，新增完成后可以看到按模块显示的列表。</li>
				 <img src="img/help/cosmic/functionProcess_create.png"
					 alt="新建功能流程" class="img_inserted" />
 				 <img src="img/help/cosmic/functionProcess_list.png"
					 alt="功能流程列表" class="img_inserted" />
				<br /><br />
				<li>接着按模块输入感兴趣对象及其对应的数据组，一个感兴趣对象可以有多个数据组。新增完成可以看到感兴趣对象列表</li>
				 <img src="img/help/cosmic/interestObject_create.png"
					 alt="新建感兴趣对象" class="img_inserted" />
 				 <img src="img/help/cosmic/interestObject_list.png"
					 alt="感兴趣对象列表" class="img_inserted" />
				<br /><br />				
				<li>然后，点击“添加数据移动”。选择好模块后，系统列出该模块下所有的功能流程，在功能流程中输入其中包含的所有数据移动，输入数据移动时，要标明该数据移动对应的兴趣对象和数据组。</li>
			    <img src="img/help/cosmic/dataMovement_create.png"
					 alt="新建数据移动" class="img_inserted" />
 				 <img src="img/help/cosmic/dataMovement_list.png"
					 alt="数据移动列表" class="img_inserted" />
				<br /><br />
				<li>点击“度量结果查看”，可查看功能点估算结果。</li>
 				 	<img src="img/help/cosmic/cosmic_result.png"
					 alt="COSMIC估算结果" class="img_inserted" />
				<br /><br />
			</ol>
		</div>
	</div>
</div>
<%@ include file="/common/layout/footer.jsp"%>
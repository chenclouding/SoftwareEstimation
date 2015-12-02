<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/layout/commonInclude.jsp"%>

<div id="wrap">
	<%@ include file="layout/nesma_head.jsp"%>
	<%@ include file="layout/nesma_sidebar.jsp"%>
<link rel="stylesheet" href="styles/welcome.css" />
	<div id="content-wrap">
	<div id="tabbox">
    <ul class="tabs" id="tabs">
       <li><a>NESMA-预估型</a></li>
       <li><a>NESMA-估计型</a></li>
       <li><a>NESMA-详细型或IFPUG</a></li>
    </ul>
    <ul class="tab_conbox" id="tab_conbox">
        <li class="tab_con">
			<div class="methodHelp">
				<h3>方法介绍</h3>
				<p>关于NESMA功能点估算方法介绍，请参见如下教程：</p>
				<p>
					<a target="_blank" href="docs/NESMA.pdf">NESMA估算方法介绍.pdf</a>
				</p>
			</div>
			<div class="toolHelp">
				<h3>模块使用说明</h3>
				<p>NESMA-预估型只需添加数据功能，识别出待估算项目中的数据功能后，在相应模块中输入即可。</p>
					<p>1. 首先按模块输入数据功能，新增完成后可以看到按数据功能列表。</p>
					 <img src="img/help/nesma/indicative_datafunction_create.png"
						 alt="新建数据功能" class="img_inserted" />
	 				 <img src="img/help/nesma/indicative_datafunction_list.png"
						 alt="数据功能列表" class="img_inserted" />
					<br /><br />
					<p>2. 点击“度量结果查看”，可查看>NESMA-预估型功能点估算结果。</p>
	 				 	<img src="img/help/nesma/indicative_result.png"
						 alt="NESMA-预估型估算结果" class="img_inserted" />
					<br /><br />
			</div>
        </li>
            
        <li class="tab_con">
			<div class="methodHelp">
				<h3>方法介绍</h3>
				<p>关于NESMA功能点估算方法介绍，请参见如下教程：</p>
				<p>
					<a target="_blank" href="docs/NESMA.pdf">NESMA估算方法介绍.pdf</a>
				</p>
			</div>
			<div class="toolHelp">
				<h3>模块使用说明</h3>
				<p>NESMA-估计型只需添加数据功能和事务功能。</p>
					<p>1. 首先，按模块输入数据功能，新增完成后可以看到按数据功能列表，步骤和“NESMA-预估型”类似。</p>
					<p>2. 其次，按模块输入事务功能，点击“事务功能”进行添加，新增完成后可以看到按事务功能列表。</p>
	 				 <img src="img/help/nesma/estimated_transfunction_list.png"
						 alt="事务功能列表" class="img_inserted" />
					<br /><br />
					<p>3. 点击“度量结果查看”，可查看NESMA-估计型功能点估算结果。</p>
	 				 	<img src="img/help/nesma/estimated_result.png"
						 alt="NESMA-估计型估算结果" class="img_inserted" />
					<br /><br />
			</div>
        </li>
    
        <li class="tab_con">
			<div class="methodHelp">
				<h3>方法介绍</h3>
				<p>关于NESMA功能点估算方法介绍，请参见如下教程：</p>
				<p>
					<a target="_blank" href="docs/NESMA.pdf">NESMA估算方法介绍.pdf</a>
				</p>
				<p>关于IFPUG功能点估算方法介绍，请参见如下教程：</p>
				<p>
					<a target="_blank" href="docs/IFPUG.pdf">IFPUG估算方法介绍.pdf</a>
				</p>
			</div>
			<div class="toolHelp">
				<h3>模块使用说明</h3>
				<p>NESMA-详细型和IFPUG方法的步骤完全相同，都需添加数据功能和事务功能，
				输入数据功能时，要输入DET/RET的个数；输入事务功能时，要输入DET/FTR的个数。</p>
					<p>1. 首先，按模块输入数据功能，注意要输入DET/RET的个数，新增完成后可以看到按数据功能列表。</p>
						 <img src="img/help/nesma/detail_datafunction_create.png"
							 alt="新建数据功能" class="img_inserted" />
		 				 <img src="img/help/nesma/detail_datafunction_list.png"
							 alt="数据功能列表" class="img_inserted" />
						<br /><br />								
					<p>2. 其次，按模块输入事务功能，注意要输入DET/FTR的个数，点击“事务功能”进行添加，新增完成后可以看到按事务功能列表。</p>
					 <img src="img/help/nesma/detail_transfunction_create.png"
							 alt="新建事务功能" class="img_inserted" />
	 				 <img src="img/help/nesma/detail_transfunction_list.png"
						 alt="事务功能列表" class="img_inserted" />
					<br /><br />
					<p>3. 点击“度量结果查看”，可查看>NESMA-详细型或IFPUG功能点估算结果。</p>
	 				 	<img src="img/help/nesma/detail_result.png"
						 alt="NESMA-详细型估算结果" class="img_inserted" />
					<br /><br />
			</div>
        </li>
    </ul>  
</div>
	</div>
</div>
<%@ include file="/common/layout/footer.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	jQuery.jqtab = function(tabtit,tab_conbox,shijian) {
		$(tab_conbox).find("li").hide();
		$(tabtit).find("li:first").addClass("thistab").show(); 
		$(tab_conbox).find("li:first").show();
	
		$(tabtit).find("li").bind(shijian,function(){
		  $(this).addClass("thistab").siblings("li").removeClass("thistab"); 
			var activeindex = $(tabtit).find("li").index(this);
			$(tab_conbox).children().eq(activeindex).show().siblings().hide();
			return false;
		});
	
	};
	/*调用方法如下：*/
	$.jqtab("#tabs","#tab_conbox","click");	
	$.jqtab("#tabs2","#tab_conbox2","mouseenter");
	
});
</script>
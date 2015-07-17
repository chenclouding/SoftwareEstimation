<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
jQuery(document).ready(function($) {
	$('.theme-organization').click(function(){
		$('.theme-popover-mask').fadeIn(100);
		$('.theme-popover-organization').slideDown(200);
	})
	$('.theme-poptit .close').click(function(){
		$('.theme-popover-mask').fadeOut(100);
		$('.theme-popover-organization').slideUp(200);
	})
})
</script>
</head>
<body>
	<div class="theme-popover-organization">
		<div class="theme-poptit">
			<a href="javascript:;" title="关闭" class="close">×</a>
			<h3>
				<%
					String title = request.getParameter("popup_title");
					if (title != null && !"".equals(title.trim()))
						out.println(title);
				%>
			</h3>
		</div>
		<div class="theme-popbod dform">
			<form class="theme-form" name="organizationform" action="organization!add"
				method="post">
				<ol>
					<li><label>组织名称：</label>
						<input class="ipt" type="text" name="organization.name" /></li>
					<li><label>组织类型：</label> <select class="ipt" type="text"
						name="organization.type">
							<option value="==请选择组织类型==">==请选择组织类型==</option>
							<option value="A.农、林、牧、渔业">A.农、林、牧、渔业</option>
							<option value="B.采矿业">B.采矿业</option>
							<option value="C.制造业">C.制造业</option>
							<option value="D.电力、热力、燃气及水生产和供应业">D.电力、热力、燃气及其它供应业</option>
							<option value="E.建筑业">E.建筑业</option>
							<option value="F.批发和零售业">F.批发和零售业</option>
							<option value="G.交通运输、仓储和邮政业">G.交通运输、仓储和邮政业</option>
							<option value="H.住宿和餐饮业">H.住宿和餐饮业</option>
							<option value="I.信息传输、软件和信息技术服务业">I.软件和信息技术、传输服务业</option>
							<option value="J.金融业">J.金融业</option>
							<option value="K.房地产业">K.房地产业</option>
							<option value="L.租赁和商务服务业">L.租赁和商务服务业</option>
							<option value="M.科学研究和技术服务业">M.科学研究和技术服务业</option>
							<option value="N.水利、环境和公共设施管理业">N.水利、环境和公共设施管理业</option>
							<option value="O.居民服务、修理和其他服务业">O.居民服务、修理和其他服务业</option>
							<option value="P.教育">P.教育</option>
							<option value="Q.卫生和社会工作">Q.卫生和社会工作</option>
							<option value="R.文化、体育和娱乐业">R.文化、体育和娱乐业</option>
							<option value="S.公共管理、社会保障和社会组织">S.公共管理、社会保障和组织</option>
							<option value="T.国际组织">T.国际组织</option>
					</select></li>
					<li><label>组织简介：</label>
						<input class="ipt" type="text" name="organization.description" /></li>
					<li><label>组织地址：</label>
						<input class="ipt" type="text" name="organization.address" /></li>
					<li><label>传真：</label>
						<input class="ipt" type="text" name="organization.postcode" /></li>
					<li><label>联系人：</label>
						<input class="ipt" type="text" name="organization.contact" /></li>
					<li><label>电话：</label>
						<input class="ipt" type="text" name="organization.phone" /></li>
					<li><label>邮箱：</label>
						<input class="ipt" type="text" name="organization.email" /></li>
					<li><input class="btn btn-primary" type="submit" value="新建" />
						<input class="btn btn-primary" type="reset" value="重置" /></li>
				</ol>
			</form>
		</div>
	</div>
	<div class="theme-popover-mask"></div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=request.getContextPath()%>/scripts/jquery-2.1.4.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/popup.css" media="all">
<script>
jQuery(document).ready(function($) {
	$('.theme-register').click(function(){
		$('.theme-popover-mask').fadeIn(100);
		$('.theme-popover').slideDown(200);
	})
	$('.theme-poptit .close').click(function(){
		$('.theme-popover-mask').fadeOut(100);
		$('.theme-popover').slideUp(200);
	})

})
</script>
</head>
<body>
<div class="theme-popover">
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
           <form class="theme-signin" name="loginform" action="user!add" method="post">
                <ol>
                     <li><p>邮箱：</p><input class="ipt" type="text" name="user.email" placeholder="example@email.com" /></li>
                     <li><p>密码：</p><input class="ipt" type="password" name="user.password" /></li>
                     <li><p>再次输入密码：</p><input class="ipt" type="password" name="repassword" /></li>
                     <li><p>姓名：</p><input class="ipt" type="text" name="user.name" /></li>
<!--                      <li><p>所属单位：</p><input class="ipt" type="text" name="repassword" /></li> -->
                     <li>
                     	<input class="btn btn-primary" type="submit" value="新建" />
                     	<input class="btn btn-primary" type="reset" value="重置" />
                     </li>
                </ol>
           </form>
     </div>
</div>
<div class="theme-popover-mask"></div>
</body>
</html>

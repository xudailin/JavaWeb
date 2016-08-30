<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主界面菜单栏</title>
<script language="javascript" src="js/jquery-1.9.1.min.js"></script>
<link href="css/MainGuide.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#test2").hide();
		$("#test1").click(function() {
			$("#test2").toggle();
		});
	});
</script>

</head>
<body>
		<div id="Sidebar">
			<div id="Guide"></div>
			<div id="Menu">
			<div id="Icon">
				<a href="welcome.jsp" class="STYLE25" target="main">首页</a>
			</div>
			<div id="Icon">
				<a href="provider!getAllProviders.action" class="STYLE25"
					target="main">供应商信息管理</a>
			</div>
			<div id="Icon">
				<a href="product!showAllProduct.action" class="STYLE25"
					target="main">库存信息管理</a>
			</div>
			<div id="Icon">
				<a href="#" id="test1" class="STYLE25">订单信息管理</a>
			</div>
			<div id="test2" style="display:none;">
				<div id="Icon">
					<a href="inOrder!getAllInOrder.action"
						class="STYLE25" target="main">&nbsp;&nbsp;入库订单管理</a>
				</div>
				<div id="Icon">
					<a href="outOrder!getAllOutOrder.action"
						class="STYLE25" target="main">&nbsp;&nbsp;出库订单管理</a>
				</div>
			</div>
			<div id="Icon">
				<a href="editPassword.jsp"
					class="STYLE25" target="main">系统设置</a>
			</div>
			<div id="Icon">
				<a href="userRead.jsp" class="STYLE25" target="main">系统使用说明</a>
			</div>
			</div>
	</div>
</body>
</html>
